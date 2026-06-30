# Teacher Package Overview

## Challenge title
**Reto SSH 1 — Enter the PQ Tunnel**

## Purpose
This challenge mirrors the pedagogical role of the TLS challenge:
- the student is a **client**,
- the service is already migrated,
- the student must observe and prove that classical key exchange fails and hybrid PQC key exchange succeeds.

## Main learning outcomes
1. SSH, like TLS, has a **key exchange** stage that can be migrated before all other components.
2. Hybrid SSH key exchange can be enforced on the server.
3. The student must distinguish between “SSH works” and “SSH works with the required PQC key exchange”.
