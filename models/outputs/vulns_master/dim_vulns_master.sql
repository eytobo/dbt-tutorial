with vulns as (
    select * from {{ ref('stg_vulnerabilities') }}
),
findings as (
    select * from {{ ref('stg_findings') }}
),
projects as (
    select * from {{ ref('stg_projects') }}
),
f_and_l_vulns_treatment as (
    select * from {{ ref('stg_f_and_l_vulnerabilities_treatment') }}
),
vulns_zero_risk_last as (
    select * from {{ ref('stg_vulnerabilities_zero_risk_last') }}
)

select * from vulns
  INNER JOIN findings on vulns."finding id str" = findings.id_str
  INNER JOIN projects on findings.group_name = projects.project_name_str
  LEFT JOIN f_and_l_vulns_treatment on vulns."uuid str" = f_and_l_vulns_treatment.uuid
  LEFT JOIN vulns_zero_risk_last on vulns."uuid str" = vulns_zero_risk_last."uuid_str"