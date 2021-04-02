%dw 2.0
output application/json
fun containsEmptyValues(arr) = arr filter isEmpty($)
---
{
   three: containsEmptyValues([""]), //[""]
   four: containsEmptyValues([null]), //[null]
   five: containsEmptyValues(["abc", "", "def", ""]), //["",""]
   six: containsEmptyValues([null, "abc", "def", null]), //[null,null]
   seven: containsEmptyValues(["abc", null, ""]), //[null,""]
   eight: containsEmptyValues(["abc", "def"]) //[]
}
