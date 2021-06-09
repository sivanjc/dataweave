/* Output
{
  "100618692": "0010l00001IOIoWAAX",
  "100618707": "0010l00001IOIoXAAX",
  "100618709": "0010l00001IOIoYAAX",
  "100618726": "0010l00001IOIoZAAX",
  "100618741": "0010l00001IOIoaAAH",
  "100618743": "0010l00001IOIobAAH",
  "100618760": "0010l00001IOIocAAH",
  "100618777": "0010l00001IOIodAAH",
  "100148051": "0010l00001IOIoeAAH",
  "100148836": "0010l00001IOIofAAH"
}

*/

/* Input

[
        {
            "RecordType": {
                "Id": null,
                "type": "RecordType",
                "Name": "Member"
            },
            "Id": "0010l00001IOIoWAAX",
            "Guest_Centrix_Id__c": "100618692",
            "type": "Account",
            "Name": "Josephine Duke"
        },
        {
            "RecordType": {
                "Id": null,
                "type": "RecordType",
                "Name": "Member"
            },
            "Id": "0010l00001IOIoXAAX",
            "Guest_Centrix_Id__c": "100618707",
            "type": "Account",
            "Name": "Andrea caballero"
        },
        {
            "RecordType": {
                "Id": null,
                "type": "RecordType",
                "Name": "Member"
            },
            "Id": "0010l00001IOIoYAAX",
            "Guest_Centrix_Id__c": "100618709",
            "type": "Account",
            "Name": "Helena Orvokki Annala"
        },
        {
            "RecordType": {
                "Id": null,
                "type": "RecordType",
                "Name": "Member"
            },
            "Id": "0010l00001IOIoZAAX",
            "Guest_Centrix_Id__c": "100618726",
            "type": "Account",
            "Name": "Gina Gordon"
        },
        {
            "RecordType": {
                "Id": null,
                "type": "RecordType",
                "Name": "Member"
            },
            "Id": "0010l00001IOIoaAAH",
            "Guest_Centrix_Id__c": "100618741",
            "type": "Account",
            "Name": "Miya Miya"
        },
        {
            "RecordType": {
                "Id": null,
                "type": "RecordType",
                "Name": "Member"
            },
            "Id": "0010l00001IOIobAAH",
            "Guest_Centrix_Id__c": "100618743",
            "type": "Account",
            "Name": "Romane Meerberghs"
        },
        {
            "RecordType": {
                "Id": null,
                "type": "RecordType",
                "Name": "Member"
            },
            "Id": "0010l00001IOIocAAH",
            "Guest_Centrix_Id__c": "100618760",
            "type": "Account",
            "Name": "Ronald Dela Cruz"
        },
        {
            "RecordType": {
                "Id": null,
                "type": "RecordType",
                "Name": "Member"
            },
            "Id": "0010l00001IOIodAAH",
            "Guest_Centrix_Id__c": "100618777",
            "type": "Account",
            "Name": "Kyle Essig"
        },
        {
            "RecordType": {
                "Id": null,
                "type": "RecordType",
                "Name": "Member"
            },
            "Id": "0010l00001IOIoeAAH",
            "Guest_Centrix_Id__c": "100148051",
            "type": "Account",
            "Name": "Grace Kearon"
        },
        {
            "RecordType": {
                "Id": null,
                "type": "RecordType",
                "Name": "Member"
            },
            "Id": "0010l00001IOIofAAH",
            "Guest_Centrix_Id__c": "100148836",
            "type": "Account",
            "Name": "Ainslie Frazer"
        }
    ]
*/

%dw 2.0
output application/json
---
(payload map (item, index) ->  (item.Guest_Centrix_Id__c) : item.Id) reduce ($$ ++ $)
