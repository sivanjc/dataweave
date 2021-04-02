%dw 2.0
output application/json
/*
arrays with the empty values, we can check if the filtered arrays are empty. If they are, it means that there are no empty values in “arr.”
*/
fun containsEmptyValues(arr) = isEmpty(arr filter isEmpty($))

---
{
   three: containsEmptyValues([""]), //false
   four: containsEmptyValues([null]), //false
   five: containsEmptyValues(["abc", "", "def", ""]), //false
   six: containsEmptyValues([null, "abc", "def", null]), //false
   seven: containsEmptyValues(["abc", null, ""]), //false
   eight: containsEmptyValues(["abc", "def"]) //true
}
