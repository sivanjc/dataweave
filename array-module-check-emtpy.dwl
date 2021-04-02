%dw 2.0
output application/json
import some from dw::core::Arrays

// Array Module

fun containsEmptyValues(arr) = if (isEmpty(arr)) true
   else arr some isEmpty($)
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
