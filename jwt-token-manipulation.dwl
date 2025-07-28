%dw 2.0
import fromBase64 from dw::core::Binaries
output application/json

var jwtParts = payload splitBy "."
---
{
    header: read(fromBase64(jwtParts[0]), "application/json"),
    body: read(fromBase64(jwtParts[1]), "application/json"),
    signature: jwtParts[2]
}


%dw 2.0
output application/json
import fromBase64 from dw::core::Binaries
var jwtParts =payload.attributes.headers.Authorization replace "Bearer " with "" splitBy "."
---
{
    header: read(fromBase64(jwtParts[0]), "application/json"),
    body: read(fromBase64(jwtParts[1]), "application/json"),
    signature: jwtParts[2]
}

#[
%dw 2.0
output application/json
import fromBase64 from dw::core::Binaries
var jwtParts = attributes.headers.authorization replace "Bearer " with "" splitBy "."
---
read(fromBase64(jwtParts[1]), "application/json").Source defalt n
]


#[ %dw 2.0 output application/json import fromBase64 from dw::core::Binaries var jwtParts = attributes.headers.authorization replace "Bearer " with "" splitBy "." --- read(fromBase64(jwtParts[1]), "application/json").Source default "UNKNOWN" ]

