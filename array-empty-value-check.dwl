%dw 2.0
output application/json
fun containsEmptyValues(arr) = if (isEmpty(arr)) true
   else not isEmpty(arr filter isEmpty($))
---
{
   one: containsEmptyValues(null), //true
   two: containsEmptyValues([]), //true
   three: containsEmptyValues([""]), //true
   four: containsEmptyValues([null]), //true
   five: containsEmptyValues(["abc", "", "def", ""]), //true
   six: containsEmptyValues([null, "abc", "def", null]), //true
   seven: containsEmptyValues(["abc", null, ""]), //true
   eight: containsEmptyValues(["abc", "def"]) //false
}
