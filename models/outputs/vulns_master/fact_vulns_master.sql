select
    count(distinct "project_name_str") as projects,
    count(distinct "uuid str") as vulns,
    count(distinct "finding id str") as findings,
    sum("cvss_temporal") as total_cvss
from {{ ref('dim_vulns_master') }}