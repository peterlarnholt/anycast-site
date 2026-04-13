# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository

Static marketing site for Anycast by ExCom.ai — AI team members for Telegram group chats. Three standalone HTML pages, no build step, no dependencies beyond Google Fonts (Inter) loaded via CDN.

- `index.html` — main marketing/landing page
- `app-mockup.html` — in-app chat UI mockup
- `privacy.html` — privacy policy

## Architecture

Each HTML file is fully self-contained: inline `<style>` in `<head>` and inline `<script>` (where present) at the bottom. There is no shared CSS/JS, no component system, and no asset pipeline. Changes to shared visuals (colors, fonts, nav) must be applied to each file individually.

A common CSS custom-property palette is redefined in each file's `:root` — keep these in sync when adjusting brand colors:

```
--cyan #4FC3F7   --cyan-dark #0288D1   --cyan-light #B3E5FC
--purple #AB47BC --navy #0F172A        --slate #64748B
--white #FFFFFF  --amber #FBBF24
```

## Development

Open files directly in a browser, or serve locally:

```
python3 -m http.server 8000
```

No lint, test, or build commands exist.
