/* Input

<users>
    <user>
        <personal_information>
            <first_name>Emiliano</first_name>
            <middle_name>Romoaldo</middle_name>
            <last_name>Lesende</last_name>
            <ssn>001-08-84382</ssn>
        </personal_information>
        <login_information>
            <username>3miliano</username>
            <password>mypassword1234</password>
        </login_information>
    </user>
    <user>
        <personal_information>
            <first_name>Mariano</first_name>
            <middle_name>Toribio</middle_name>
            <last_name>de Achaval</last_name>
            <ssn>002-05-34738</ssn>
        </personal_information>
        <login_information>
            <username>machaval</username>
            <password>mypassword4321</password>
        </login_information>
    </user>
</users>

*/

/* Output

<?xml version="1.0" encoding="UTF-8"?>
<users>
  <user>
    <personal_information>
      <first_name>Emiliano</first_name>
      <middle_name>Romoaldo</middle_name>
      <last_name>Lesende</last_name>
    </personal_information>
    <login_information>
      <username>3miliano</username>
    </login_information>
  </user>
  <user>
    <personal_information>
      <first_name>Mariano</first_name>
      <middle_name>Toribio</middle_name>
      <last_name>de Achaval</last_name>
    </personal_information>
    <login_information>
      <username>machaval</username>
    </login_information>
  </user>
</users>

*/

%dw 2.0
output application/xml
---
users: {
      (payload.users mapObject {
        user: {
        personal_information: $.personal_information - "ssn",
        login_information: $.login_information - "password"
        }
      })
}



