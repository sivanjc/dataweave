/***
Input
{
  "status": "Raw Processing Data",
  "initialDBRecords": [
    {
      "COUNT(*)": 1
    }
  ],
  "newCSVRecords": 5,
  "finalDBRecords": [
    {
      "COUNT(*)": 5
    }
  ],
  "Delta": [
    5
  ]
}

Expected Output
{
  "status": "Processing Completed",
  "initialDBRecords": 1,
  "newCSVRecords": 5,
  "finalDBRecords": 5,
  "delta": -1
}
**/

%dw 2.0
output application/json
fun calculate () = (payload.finalDBRecords."COUNT(*)"[0] - ( payload.initialDBRecords."COUNT(*)"[0] + payload.newCSVRecords ))
---
{
	status : "Processing Completed",
	initialDBRecords : payload.initialDBRecords."COUNT(*)"[0],
  newCSVRecords: payload.newCSVRecords,
  finalDBRecords: payload.finalDBRecords."COUNT(*)"[0],
  delta : calculate()
}

