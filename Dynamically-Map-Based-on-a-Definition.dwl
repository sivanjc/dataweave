/* Input
<sfdc_users>
    <sfdc_user>
      <sfdc_name>Mariano</sfdc_name>
      <sfdc_last_name>Achaval</sfdc_last_name>
      <sfdc_employee>true</sfdc_employee>
    </sfdc_user>
    <sfdc_user>
      <sfdc_name>Julian</sfdc_name>
      <sfdc_last_name>Esevich</sfdc_last_name>
      <sfdc_employee>true</sfdc_employee>
    </sfdc_user>
    <sfdc_user>
      <sfdc_name>Leandro</sfdc_name>
      <sfdc_last_name>Shokida</sfdc_last_name>
    </sfdc_user>
</sfdc_users>
*/

/* Output

[
  {
    "source": "sfdc_name",
    "target": "name",
    "default": "---"
  },
  {
    "source": "sfdc_last_name",
    "target": "lastName",
    "default": "---"
  },
  {
    "source": "sfdc_employee",
    "target": "user",
    "default": true
  }
]

*/

%dw 2.0
output application/json
var applyMapping = (in, mappingsDef) -> (
   mappingsDef map (def) -> {
    (def.target) : in[def.source] default def."default"
  }
)
---
payload.sfdc_users.*sfdc_user map (user) -> (
        applyMapping(user, vars.mappings)
)
