-- Update division code from MEDIA to MEDPUB
UPDATE public.divisions 
SET code = 'MEDPUB', name = 'MEDPUB' 
WHERE code = 'MEDIA' OR name = 'Media & Publication' OR name = 'Media';
