/**
{
        "documentToSigner": [
          {
            "documentName": "ESRA For aa aa",
            "typeCd": "SIGNATURE",
            "subtypeCd": "CAPTURE",
            "eSignLiveExtension": {
              "extractInd": true
            },
            "documentItemName": "Signature001"
          },
          {
            "documentName": "ODP Agreement",
            "typeCd": "SIGNATURE",
            "subtypeCd": "CAPTURE",
            "eSignLiveExtension": {
              "extractInd": true
            },
            "documentItemName": "Signature002"
          },
          {
            "documentName": "ODP Agreement",
            "typeCd": "INPUT",
            "subtypeCd": "LABEL",
            "eSignLiveExtension": {
              "extractInd": true,
              "autoFieldBindingCd": "{approval.signed}"
            },
            "documentItemName": "SignatureDate002"
          }
        ]
      }

**/

%dw 2.0
output application/json
var requiredVersions = flatten(valuesOf(vars.inputJson)).contentVersion
---
payload filter ((item, index) -> 
    requiredVersions contains item.contentVersion) 
map ((item, index) -> {
    // do the mapping here
})
