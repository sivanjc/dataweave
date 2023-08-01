%dw 2.0
output application/json
---
payload 
    filter !(namesOf($) contains "failed_products") 
    map ($ ++ {error:""})
++
(payload
    filter (namesOf($) contains "failed_products") 
    flatMap (
        $.failed_products map((item) -> { 
            product_name: "",
            product_id: item.product_id,
            error: valuesOf((item- "product_id") filterObject ($$ as String startsWith  "attribute_")) filter (!isEmpty($)) joinBy " and "
        })
       
    )
)

/* input
[
   {
      "product_name":"A",
      "product_id":"1"
   },
   {
      "product_name":"B",
      "product_id":"2"
   },
   {
      "failed_products":[
         {
            "product_id":"3",
            "attribute_1":"Error in value: attribute_1",
            "attribute_2":""
         },
         {
            "product_id":"4",
            "attribute_1":"Error in value: attribute_1",
            "attribute_2":"Error in value: attribute_2"
         }
      ]
   }
]

*/

/* output
[
   {
      "product_name":"",
      "product_id":"1",
      "error":""
   },
   {
      "product_name":"",
      "product_id":"2",
      "error":""
   },
   {
      "product_name":"",
      "product_id":"3",
      "error":"Error in value: attribute_1"
   },
   {
      "product_name":"",
      "product_id":"2",
      "error":"Error in value: attribute_1 and Error in value: attribute_2"
   }
]
*/
