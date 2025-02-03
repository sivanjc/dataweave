%dw 2.0
output application/json
import * from dw::core::Dates
import * from dw::core::Periods
import * from dw::core::Arrays

var todayDate = |2025-08-09| 
var holidays = [
    "2025-01-01",
    "2025-02-15",
    "2025-08-29",
    "2025-08-28",
    "2025-08-27",
    "2025-12-25",
    "2025-12-26"]

fun lastDayOfMonth(d: Date) = atBeginningOfMonth(d  + |P1M|) - |P1D|

fun getLastWeekdayOfMonth(d: Date) = do {
    var lastDayOfMonth = atBeginningOfMonth(d  + |P1M|) - |P1D|
    var lastDayOfMonth_dOfW = log('lastDayOfMonth_dOfW', lastDayOfMonth.dayOfWeek)
    ---
    if(lastDayOfMonth_dOfW == 6) //Sat, prev day is workday
        lastDayOfMonth - |P1D|
    else if(lastDayOfMonth_dOfW == 7) //Sun, prev 2day is workday
        lastDayOfMonth - |P2D|
    else lastDayOfMonth //workday
}

fun getLastWorkdayOfMonth(d: Date) = do {
    var lastDayOfMonth = getLastWeekdayOfMonth(d)
    var weekBefore = (0 to 6) map (lastDayOfMonth - days($)) //I can change search back to any days before
    ---
    weekBefore firstWith (!isHoliday($) and isWeekday($))
}

fun isHoliday(d: Date) = holidays contains (d as String {format: "yyyy-MM-dd"}) 

fun isWeekday(d: Date) = (1 to 5) contains d.dayOfWeek
---
 {
     today: todayDate,
     lastDayOfMonth: lastDayOfMonth(todayDate),
     getLastWeekdayOfMonth: getLastWeekdayOfMonth(todayDate),
     getLastWorkdayOfMonth: getLastWorkdayOfMonth(todayDate)
 }
