/* input data format
[
   {
       "ID" : 4128506,
       "name": "Ken",
       "age": 30
   },
   {
       "ID" : 1823940,
       "name": "Tomo",
       "age": 70
   },
   {
       "ID": 9086582,
       "name": "Kajika",
       "age": 10
   }
]
*/

%dw 2.0
output application/json
---
payload map ( (user) ->
    user update {
        case name at .name if (name == "Tomo") -> name ++" (Christina)"
        case age at .age-> age + 1
    }

)

/* output
[
  {
    "ID": 4128506,
    "name": "Ken",
    "age": 31
  },
  {
    "ID": 1823940,
    "name": "Tomo (Christina)",
    "age": 71
  },
  {
    "ID": 9086582,
    "name": "Kajika",
    "age": 11
  }
]
*/
