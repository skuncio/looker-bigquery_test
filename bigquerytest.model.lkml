connection: "bigquery_testdb"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=4.10
# NOTE: for BigQuery specific considerations

explore: view_aggregate {
  label: "6) Content Summary by Users (2 mths by day)."
  view_label: "Content & Users"
  }

explore: view_aggregate_with_article {
  label: "2) Content Summary by CID (2 mths by day)"
  view_label: "Article & Video Views - Summary"
  }

explore: t8001_user_crossref {}

explore: t8002_contentview {}
