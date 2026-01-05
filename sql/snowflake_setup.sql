-- Minimal Snowflake setup for dbt Core MVP
-- Adjust names as needed before running.

use role accountadmin;

create warehouse if not exists DBT_WH
  warehouse_size = 'XSMALL'
  auto_suspend = 60
  auto_resume = true
  initially_suspended = true;

create database if not exists DBT_DEV;

create schema if not exists DBT_DEV.BRONZE;
create schema if not exists DBT_DEV.SILVER;
create schema if not exists DBT_DEV.GOLD;

create role if not exists DBT_DEV_ROLE;

grant usage on warehouse DBT_WH to role DBT_DEV_ROLE;
grant usage on database DBT_DEV to role DBT_DEV_ROLE;
grant usage on schema DBT_DEV.BRONZE to role DBT_DEV_ROLE;
grant usage on schema DBT_DEV.SILVER to role DBT_DEV_ROLE;
grant usage on schema DBT_DEV.GOLD to role DBT_DEV_ROLE;

grant create table on schema DBT_DEV.BRONZE to role DBT_DEV_ROLE;
grant create view on schema DBT_DEV.BRONZE to role DBT_DEV_ROLE;
grant create table on schema DBT_DEV.SILVER to role DBT_DEV_ROLE;
grant create view on schema DBT_DEV.SILVER to role DBT_DEV_ROLE;
grant create table on schema DBT_DEV.GOLD to role DBT_DEV_ROLE;
grant create view on schema DBT_DEV.GOLD to role DBT_DEV_ROLE;

-- Replace with your Snowflake login user
-- grant role DBT_DEV_ROLE to user ARNAVSANKHE19;