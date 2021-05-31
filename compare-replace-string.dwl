%dw 2.0
output application/json

fun checkCountry(country) = if (country as String == "NULL" as String) "NO COUNTRY" else country
---
payload map (index, value) -> {
    Nationality__pc : checkCountry(index.CountryName)
}

/*
INput Payload

[{
"EntityType": "GROUP",
"GuestID": "5113311",
"Firstname": "NULL",
"Surname": "The Clontarf Foundation",
"Address1": "48 South Kiama Drive",
"Address2": "NULL",
"Archive": "",
"Date_Of_Birth": "NULL",
"VIP": "",
"VIPLevelID": "NULL",
"E_Mail": "jtoohey@clontarffoundation.com.au",
"BlackList": "",
"City": "KIAMA ",
"CountryName": "NULL",
"For_Review": "",
"Guest_Comments": "",
"LanguageID": "NULL",
"Made_On": "2019-08-02",
"Privacy": "NULL",
"StateProvince": "NSW ",
"MembershipNo": "5113312",
"Member_Type": "A",
"MIA_Code": "2",
"Member_Status": "A",
"Expiry_Date": "2021-10-15",
"Gender": "",
"Self_Segmentation": "NULL",
"Nationality": "NULL",
"OptIn_MemberAnnual": "N",
"OptIn_MemberVoting": "Y",
"OptIn_SignUpDeals": "Y",
"OptIn_SignUpNewsletter": "Y",
"Group_FolioContact": "Josh Toohey",
"Group_FolioName": "The Clontarf Foundation",
"VALUE_OF_STAY": "5040.00",
"NO_OF_NIGHTS": "2"
}]
*/
