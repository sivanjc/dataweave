%dw 2.0
output application/json
import some from dw::core::Arrays

// Function overloading

fun containsEmptyValues(value: Null) = true //first overloaded function
fun containsEmptyValues(arr: Array) = ( //second overloaded function
   if (arr == []) true
   else arr some isEmpty($)
)
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
