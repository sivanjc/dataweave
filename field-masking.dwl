%dw 2.0
output application/json
fun recursiveFieldMask(inputPayload, keyName, fieldsToMask) = 
  inputPayload match {
    case is Array  -> inputPayload map recursiveFieldMask($, null, fieldsToMask)
    case is Object -> inputPayload mapObject {($$): recursiveFieldMask($, $$, fieldsToMask)}
    else           -> if(fieldsToMask contains(keyName as String)) "****" else inputPayload
  }
---
recursiveFieldMask(payload, null, ["firstName","lastName","Currency","Type","number"])

/***
{
  "customer": {
    "personalDetails": {
      "firstName": "Jane",
      "lastName": "Smith",
      "socialSecurityNumber": "987-65-4321",
      "dateOfBirth": "1990-05-15",
      "identification": {
        "passportNumber": "A12345678",
        "driversLicense": "DL987654321"
      }
    },
    "contactInformation": {
      "email": "jane.smith@bankexample.com",
      "phoneNumbers": [
        {
          "type": "mobile",
          "number": "+1-555-123-4567"
        },
        {
          "type": "home",
          "number": "+1-555-987-6543"
        }
      ],
      "address": {
        "street": "456 Elm Street",
        "city": "Metropolis",
        "state": "NY",
        "zipCode": "10001",
        "country": "USA"
      }
    },
    "financialAccounts": [
      {
        "accountId": "ACC-001-23456789",
        "accountType": "checking",
        "balance": 2500.75,
        "currency": "USD",
        "transactions": [
          {
            "transactionId": "TXN-123456",
            "date": "2025-07-15T14:30:00Z",
            "amount": -150,
            "description": "ATM Withdrawal",
            "beneficiary": {
              "name": "Self",
              "accountNumber": "N/A"
            }
          },
          {
            "transactionId": "TXN-789012",
            "date": "2025-07-20T09:45:00Z",
            "amount": 500,
            "description": "Salary Deposit",
            "beneficiary": {
              "name": "Employer Corp",
              "accountNumber": "EMP-456789"
            }
          }
        ]
      },
      {
        "accountId": "ACC-002-34567890",
        "accountType": "savings",
        "balance": 15000,
        "currency": "USD",
        "transactions": [
          {
            "transactionId": "TXN-345678",
            "date": "2025-06-30T10:15:00Z",
            "amount": 1000,
            "description": "Interest Credit",
            "beneficiary": {
              "name": "Bank Internal",
              "accountNumber": "INT-001"
            }
          }
        ]
      },
      {
        "accountId": "ACC-003-45678901",
        "accountType": "loan",
        "balance": -50000,
        "currency": "USD",
        "transactions": [
          {
            "transactionId": "TXN-901234",
            "date": "2025-07-01T11:00:00Z",
            "amount": -500,
            "description": "Monthly Payment",
            "beneficiary": {
              "name": "Bank Loan Dept",
              "accountNumber": "LOAN-789"
            }
          }
        ]
      }
    ]
  }
}
***/
