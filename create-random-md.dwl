%dw 2.0
import dw::Crypto
output application/json
---
Crypto::HMACWith((random() * 1000 )as Binary, "Some value to hash" as Binary, "HmacSHA256")
