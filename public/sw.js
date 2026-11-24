const CACHE_NAME = "hmm-kpi-v2";
const STATIC_ASSETS = [
  "/manifest.json",
  "/hmm-logo.png",
  "/pwa-192x192.png",
  "/pwa-512x512.png",
  "/maskable-icon-512x512.png",
  "/apple-touch-icon.png",
  "/favicon.ico",
];

// 1. Install event: cache core static assets (never cache root HTML so updates are instant)
self.addEventListener("install", (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(STATIC_ASSETS).catch((err) => {
        console.warn("[SW] Cache addAll warning:", err);
      });
    }),
  );
  self.skipWaiting();
});

// 2. Activate event: clean up all older caches immediately
self.addEventListener("activate", (event) => {
  event.waitUntil(
    caches.keys().then((keys) => {
      return Promise.all(
        keys.map((key) => {
          if (key !== CACHE_NAME) {
            return caches.delete(key);
          }
        }),
      );
    }),
  );
  self.clients.claim();
});

// 3. Fetch event: Stale-While-Revalidate for images/fonts, Network-First for HTML/APIs/JS
self.addEventListener("fetch", (event) => {
  const req = event.request;
  const url = new URL(req.url);

  // Skip non-GET requests and Supabase REST/Auth API requests
  if (
    req.method !== "GET" ||
    url.pathname.includes("/rest/v1") ||
    url.pathname.includes("/auth/v1")
  ) {
    return;
  }

  // Media assets (images, icons, fonts)
  if (
    url.pathname.endsWith(".png") ||
    url.pathname.endsWith(".jpg") ||
    url.pathname.endsWith(".ico") ||
    url.hostname.includes("fonts.gstatic.com") ||
    url.hostname.includes("fonts.googleapis.com")
  ) {
    event.respondWith(
      caches.match(req).then((cachedResponse) => {
        if (cachedResponse) {
          fetch(req)
            .then((networkResponse) => {
              if (networkResponse && networkResponse.status === 200) {
                caches.open(CACHE_NAME).then((cache) => cache.put(req, networkResponse));
              }
            })
            .catch(() => {});
          return cachedResponse;
        }
        return fetch(req).then((networkResponse) => {
          if (networkResponse && networkResponse.status === 200) {
            const copy = networkResponse.clone();
            caches.open(CACHE_NAME).then((cache) => cache.put(req, copy));
          }
          return networkResponse;
        });
      }),
    );
    return;
  }

  // For all other requests (HTML navigation, JS chunks, CSS): Network-First
  event.respondWith(
    fetch(req)
      .then((networkResponse) => {
        return networkResponse;
      })
      .catch(() => {
        return caches.match(req).then((cached) => {
          return cached || new Response("Offline", { status: 503 });
        });
      }),
  );
});
