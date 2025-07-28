%dw 2.0
output application/json
import fromBase64 from dw::core::Binaries
var jwtParts = payload.attributes.headers.authorization replace "Bearer " with "" splitBy "."
---
read(fromBase64(jwtParts[1]), "application/json").Source default "UNKNOWN"

  /***
  {
    "attributes" : {
        "headers" : {
    "authorization" : "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMTIzYmI3ZTJkNTI0ZjkxOGJkYWI5MmIwNTg0MGM3NCIsImp0aSI6ImM1ZDM5ZmI0LTE0NWItNGNlOC1iODllLTYxMmZhZmY2YjdjMiIsImlhdCI6MTc1Mjg0NTAwNiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IjAxMjNiYjdlMmQ1MjRmOTE4YmRhYjkyYjA1ODQwYzc0IiwiQnJhbmNoQ29kZSI6Ijk5OSIsIlNvdXJjZSI6IkVQQVkiLCJUZWxsZXJJZCI6IkVBR0xFUEFZVSIsIk11bGVTb2Z0Q2xpZW50SWQiOiIwMTIzYmI3ZTJkNTI0ZjkxOGJkYWI5MmIwNTg0MGM3NCIsIkVuZFBvaW50QWxpYXMiOlsiQWNjb3VudHNfRlQiLCJBY2NvdW50c19BY2NNYW5kdCIsIlBheW1lbnRzX1RyYW5zUmNwdCIsIlBheW1lbnRzX1BheUZybUZsZCIsIlRlbGNvU2VydmljZXNfRGViV2FsbGV0IiwiRWxldnlfUmVzIiwiR01vbmV5RWxldnlfQ29tcCIsIkVQYXlIVFVfU3ViX1Byb2R1Y3RzIiwiVmlzYV9Ucm5FcW4iLCJWaXNhX1BzaEZuZCJdLCJleHAiOjE3NTM0NDk4MDUsImlzcyI6IjczNWRiMWJiLWNhNTEtNDFlYi1iNGY2LWQ0ODdiNjA0MWYxYyJ9.YBttKt1SOT8L1AoJr9fvFNIFH3Q3rZM2yetz7aa4sq4"
}}}
**/

  /***

"EPAY"

 ***/
