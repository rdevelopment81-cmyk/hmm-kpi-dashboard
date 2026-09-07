<!-- LOVABLE:BEGIN -->
> [!IMPORTANT]
> This project is connected to [Lovable](https://lovable.dev). Avoid rewriting
> published git history — force pushing, or rebasing/amending/squashing commits
> that are already pushed — as it rewrites history on Lovable's side and the
> user will likely lose their project history.
>
> Commits you push to the connected branch sync back to Lovable and show up in
> the editor, so keep the branch in a working state.
<!-- LOVABLE:END -->

# Workflow Rules
- **Vercel Deployment**: After making code changes, ALWAYS run `git add`, `git commit`, and `git push` automatically. This is required so that the live website on Vercel (and Lovable) is updated in real-time without the user having to explicitly ask for it.
