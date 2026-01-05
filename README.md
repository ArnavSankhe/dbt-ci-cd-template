# dbt CI/CD Template (MVP)

Minimal dbt Core + Snowflake repo with GitHub Actions for CI (PR checks) and CD (deploy on main). The dbt models follow a basic medallion layout: bronze -> silver -> gold.

## What's included
- dbt Core project scaffold with sample seed + models
- GitHub Actions workflows for CI and deploy
- Snowflake setup SQL (warehouse, DB, schemas, role)

## Repo structure
- models/bronze, models/silver, models/gold
- seeds/raw_orders.csv
- .github/workflows/ci.yml (PR checks)
- .github/workflows/deploy.yml (merge to main deploy)
- sql/snowflake_setup.sql

## Snowflake setup (one-time)
1. Open Snowflake and run `sql/snowflake_setup.sql` (edit names if desired).
2. Use the created warehouse/db/schema names in GitHub secrets.

## GitHub secrets
Add these repository secrets (Settings -> Secrets and variables -> Actions):
- SNOWFLAKE_ACCOUNT (e.g. JRGOUWG-NO91931)
- SNOWFLAKE_USER (e.g. ARNAVSANKHE19)
- SNOWFLAKE_PASSWORD
- SNOWFLAKE_ROLE (e.g. DBT_DEV_ROLE or ACCOUNTADMIN for MVP)
- SNOWFLAKE_WAREHOUSE (e.g. DBT_WH)
- SNOWFLAKE_DATABASE (e.g. DBT_DEV)
- SNOWFLAKE_SCHEMA (e.g. BRONZE)

## Local development
1. Install dbt Core + dbt-snowflake
2. Copy `profiles.yml.example` to `~/.dbt/profiles.yml`
3. Export the same env vars used in GitHub secrets
4. Run:
   - dbt seed
   - dbt run
   - dbt test

## CI/CD
- CI runs on pull requests to main
- Deploy runs on merge to main (or manual dispatch)
- PRs should pass dbt seed/run/test before merge

## Notes
- Azure setup is intentionally skipped for this MVP. If you want Azure resources or Key Vault later, we can layer that in.