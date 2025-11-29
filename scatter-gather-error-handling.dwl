// Error map (without until successful in routes) 
// https://blogs.mulesoft.com/dev-guides/preserving-errors-in-parallel-processing-with-mulesoft-scatter-gather/
// as seen in MuleSoft blogs
%dw 2.0
output application/java
var routesMeta = ["Route1", "Route2", "Route3", "Route4", "Route5"]
var routes = error.errorMessage.payload.failures pluck $$
---

{
 failingComponent: error.failingComponent,
 failingRoutes:  routes map (item, index) -> {
  errorRoute: routesMeta[item as Number],
  errorDescription: error.errorMessage.payload.failures[index].exception.message
  }
 }

// Error map (using until successful in routes) 
%dw 2.0

output application/java

var routesMeta = ["Route1", "Route2", "Route3", "Route4", "Route5"]
var routes = error.errorMessage.payload.failures pluck $$
---
{
 failingComponent: error.failingComponent,
 failingRoutes:  routes map (item, index) -> {
  errorRoute: routesMeta[item as Number],
  errorDescription:  error.errorMessage.payload.failures[index].suppressedErrors.description
  }
}

// In the scenario above, a sample DWL to prepare an error message might be: 
%dw 2.0
output application/java
var routesMeta = ["Source Accounts", "Account Details", "Account Hierarchy", "Account Address", "Business Relationship"]

var routes = error.errorMessage.payload.failures pluck $$

---

{
 errorType:   error.errorMessage.payload.failures.suppressedErrors.errorType default { "namespace":"MULE","identifier": "COMPOSITE_ROUTING"},

 description: error.errorMessage.payload.failures.suppressedErrors.description default "An Exception Occured",

 failingComponent: error.failingComponent,

 failingRoutes:  routes map (item, index) -> {
  errorRoute: routesMeta[item as Number],
  errorDescription:  error.errorMessage.payload.failures[index].suppressedErrors.description
  }
 }

// Enhanced error capture in applications
%dw 2.0
output application/java
var firstFailure = error.errorMessage.payload.failures[0] default {}
var firstChildError = firstFailure.childErrors[0] default {}
var firstSuppressedError = firstChildError.suppressedErrors[0] default {}
---
{
 "errorType": firstSuppressedError.errorType
  			default firstChildError.errorType
  			default firstFailure.errorType
  			default { "namespace":"MULE","identifier": "COMPOSITE_ROUTING"} ,


 "description": firstChildError.description
       		default firstSuppressedError.description
       		default firstFailure.description
  			default "An Exception Occurred",


 failingComponent: error.failingComponent
}
