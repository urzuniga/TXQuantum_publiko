# Hints

1. In SSH, key exchange is configurable from the client side.
2. Search for how to force a specific `KexAlgorithms` value.
3. The classical algorithm you want to compare against is `curve25519-sha256`.
4. The target hybrid PQC algorithm is `mlkem768x25519-sha256`.
