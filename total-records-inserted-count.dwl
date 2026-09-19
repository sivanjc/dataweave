/***
Input
{
  "sourceRecordCount": 3,
  "targetInitialRecordCount": [
    {
      "COUNT(*)": 4
    }
  ],
  "targetFinalRecordCount": [
    {
      "COUNT(*)": 7
    }
  ]
}

Expected Output
{
  "status": "Processing Completed",
  "initialDBRecords": 4,
  "finalDBRecords": 7,
  "newCSVRecords": 3,
  "delta": "3 records added",
  "error": "0 records failed"
}
**/

%dw 2.0
fun calculate () = (
 (vars.targetFinalRecordCount."COUNT(*)"[0]+vars.sourceRecordCount) - (vars.targetInitialRecordCount."COUNT(*)"[0] + vars.sourceRecordCount)	
)

fun calculateErrorCount() = (
	// original records + new records - current records
	(vars.targetInitialRecordCount."COUNT(*)"[0] + vars.sourceRecordCount) - (vars.targetFinalRecordCount."COUNT(*)"[0] ) 
)
output application/json
---
{
	status : "Processing Completed",
	initialDBRecords: vars.targetInitialRecordCount."COUNT(*)"[0],
	finalDBRecords: vars.targetFinalRecordCount."COUNT(*)"[0],
	newCSVRecords: vars.sourceRecordCount,
	delta: calculate() ++ " records added",
	error: calculateErrorCount() ++ " records failed"
}

