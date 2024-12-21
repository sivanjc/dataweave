do {
  var items = [10, 20, 30, 40, 50]
  var count = sizeOf(items)
  ---
  items match {
    case [first ~ rest] -> [first, avg(rest)]
    case [] -> []
  }
}
