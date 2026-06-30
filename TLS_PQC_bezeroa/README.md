# Operation HARVEST BREAKER — The Quantum Gate

A browser-based introductory PQC challenge for cybersecurity students.

## Why this package exists
This package is designed so that **students do not need Docker knowledge** and **do not run Docker commands**.

- Teachers deploy the lab with Docker Compose.
- Students connect only through a browser-based shell.
- The challenge demonstrates **TLS 1.3 hybrid key exchange with ML-KEM**.
- The flag is generated **dynamically at deployment time**.

## Top-level folders
- `teacher/` — private teacher-only documentation.
- `student/` — student-facing handouts.
- `deploy/` — infrastructure, scripts, and Compose files.

## One-command deployment
From the `deploy/` folder:

```bash
./deploy.sh
```

## What this package includes
- complete challenge story and gamified mission text,
- TLS / PQC theory notes for students,
- teacher rationale and solution guide,
- browser shell deployment,
- validation and lifecycle scripts,
- access-card generation script.

## Important honesty note
This package is built to be as robust as possible, but no static bundle can guarantee success on every host without testing in that exact environment.

What has been done to maximize reliability:
- the challenge target uses a minimal OpenSSL-based service,
- the browser shell uses a dedicated terminal server,
- the package includes validation, status, destroy, and access-card scripts,
- and the webshell build includes a deterministic release-binary path.
