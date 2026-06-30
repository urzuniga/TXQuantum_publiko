Zer lortzen dugu ariekta honekin? 
Ikasleak saiatzen badira TLS handshake-a PQC gabe negoziatzen, ez du funtzionatuko: 
openssl s_client -connect pqc-gateway:4433 -tls1_3 -groups X25519
Aldiz, talde hibridoa erabilita, bai: 
openssl s_client -connect pqc-gateway:4433 -tls1_3 -groups X25519MLKEM768
