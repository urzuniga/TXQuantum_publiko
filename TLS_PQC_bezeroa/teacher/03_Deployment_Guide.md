# Teacher Deployment Guide

## Quick start
Go into the `deploy/` folder and run:

```bash
./deploy.sh
```

The script will:
- create `.env` from `.env.example` if needed,
- auto-generate a non-default shell password if required,
- build and start the containers,
- run validation,
- print the browser-shell URL and login credentials.

## Access info after deployment
The browser shell will normally be available at:

```text
http://YOUR_HOST:8080
```

Port `8080` is configurable through `.env`.

## Generate the student access card
After deployment:

```bash
./make_access_card.sh
```

This creates a ready-to-share Markdown file with URL, username, and password.

## Lifecycle commands
### Deploy
```bash
./deploy.sh
```

### Check status
```bash
./status.sh
```

### Stop but keep data
```bash
./destroy.sh --keep-data
```

### Remove stack and persistent data
```bash
./destroy.sh
```

## If webshell build needs fallback mode
The Compose file uses `Dockerfile.release` by default because it is the most deterministic path in this package.

If you want to switch to the package-manager version, edit:
```yaml
build:
  context: ./webshell
  dockerfile: Dockerfile.release
```
and change it to:
```yaml
build:
  context: ./webshell
  dockerfile: Dockerfile
```
