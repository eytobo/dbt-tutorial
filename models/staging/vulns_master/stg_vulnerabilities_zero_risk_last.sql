select
  "uuid str" AS uuid_str,
  "status str" AS "ZR_status"
from {{ source('ftest', 'vulnerabilities_zero_risk_last') }}