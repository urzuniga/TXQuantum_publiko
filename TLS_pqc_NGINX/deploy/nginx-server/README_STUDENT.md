# What the student must change

Open `nginx.conf` and change:

```nginx
ssl_ecdh_curve X25519;
```

to:

```nginx
ssl_ecdh_curve X25519MLKEM768;
```

Then rebuild:

```bash
docker compose up -d --build nginx-server
```
