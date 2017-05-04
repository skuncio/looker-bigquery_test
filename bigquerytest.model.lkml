connection: "bigquery_testdb"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=4.10
# NOTE: for BigQuery specific considerations

explore: contentview {
  label: "1) Content Views Detail (67 days by time)"
  view_label: "All Content Views"
  }

explore: view_aggregate {
  label: "2) Content Summary by Users (67 days by day)."
  view_label: "Content & Users"
  }

explore: page_pdt {
  label: "3) Page Views (67 days by time)"
  view_label: "Page Views"
  }

explore: video_pdt {
  label: "4) Video Views (67 days by time)"
  view_label: "Video Views"
}

explore: t8001_user_crossref {}

explore: t8002_contentview {}
