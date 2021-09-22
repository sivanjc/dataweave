%dw 2.0
import * from dw::core::Arrays
output application/json

---
payload.Notes splitBy (/[,\/]/) map ((item, index) ->
 
        item splitBy (/[:\/]/) 
    ) map ((item, index) ->
    {
       (item[0]): item[1]
    }

) reduce ((item, accumulator) -> accumulator ++ item)

/* Split a String and convert to a collection for lookup

input

{
        
            "Notes": "NOTES: ,MEMBER TYPE: S,EXPIRY DATE: 2022-08-01,MEMBER STATUS: A"
      
}

ouptut

{
  "NOTES": " ",
  "MEMBER TYPE": " S",
  "EXPIRY DATE": " 2022-08-01",
  "MEMBER STATUS": " A"
}

*/
