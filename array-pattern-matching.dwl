%dw 2.0
output application/json
import some from dw::core::Arrays

// Pattern matching (match/case statements)

fun containsEmptyValues(arr) = arr match {
   case [] -> true
   case a is Array -> a some isEmpty($)
   else -> isEmpty(arr)
}
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
