%dw 2.0
output application/json

var inputArray =  [
  "97,75,47,61,53",
  "61,29,13",
  "97,75,47,29,13"
]

---

(inputArray map(value, index) -> (
    { "original" : value } 
) ) map {
    test: $.original
}
