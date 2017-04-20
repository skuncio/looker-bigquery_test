view: t8002_contentview {
  sql_table_name: Testing_BQ.t8002_contentview ;;

  dimension: c8002_action {
    type: string
    sql: ${TABLE}.c8002_action ;;
  }

  dimension: c8002_adid {
    type: string
    sql: ${TABLE}.c8002_adid ;;
  }

  dimension: c8002_app_version {
    type: string
    sql: ${TABLE}.c8002_app_version ;;
  }

  dimension: c8002_artid {
    type: string
    sql: ${TABLE}.c8002_artid ;;
  }

  dimension: c8002_auth {
    type: string
    sql: ${TABLE}.c8002_auth ;;
  }

  dimension: c8002_auto {
    type: string
    sql: ${TABLE}.c8002_auto ;;
  }

  dimension: c8002_battery {
    type: number
    sql: ${TABLE}.c8002_battery ;;
  }

  dimension: c8002_beacon_id {
    type: string
    sql: ${TABLE}.c8002_beacon_id ;;
  }

  dimension: c8002_beacon_loc {
    type: string
    sql: ${TABLE}.c8002_beacon_loc ;;
  }

  dimension: c8002_bluetooth {
    type: string
    sql: ${TABLE}.c8002_bluetooth ;;
  }

  dimension: c8002_br {
    type: string
    sql: ${TABLE}.c8002_br ;;
  }

  dimension: c8002_bv {
    type: string
    sql: ${TABLE}.c8002_bv ;;
  }

  dimension: c8002_category {
    type: string
    sql: ${TABLE}.c8002_category ;;
  }

  dimension: c8002_channel {
    type: string
    sql: ${TABLE}.c8002_channel ;;
  }

  dimension: c8002_cid {
    type: string
    sql: ${TABLE}.c8002_cid ;;
  }

  dimension: c8002_city {
    type: string
    sql: ${TABLE}.c8002_city ;;
  }

  dimension: c8002_content {
    type: string
    sql: ${TABLE}.c8002_content ;;
  }

  dimension: c8002_country {
    type: string
    sql: ${TABLE}.c8002_country ;;
  }

  dimension: c8002_county {
    type: string
    sql: ${TABLE}.c8002_county ;;
  }

  dimension_group: c8002_datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.c8002_datetime ;;
  }

  dimension: c8002_dcc_id {
    type: string
    sql: ${TABLE}.c8002_dcc_id ;;
  }

  dimension: c8002_depth {
    type: number
    sql: ${TABLE}.c8002_depth ;;
  }

  dimension: c8002_device {
    type: string
    sql: ${TABLE}.c8002_device ;;
  }

  dimension: c8002_did {
    type: string
    sql: ${TABLE}.c8002_did ;;
  }

  dimension: c8002_district_id {
    type: string
    sql: ${TABLE}.c8002_district_id ;;
  }

  dimension: c8002_dma {
    type: string
    sql: ${TABLE}.c8002_dma ;;
  }

  dimension: c8002_edm {
    type: string
    sql: ${TABLE}.c8002_edm ;;
  }

  dimension: c8002_gaid {
    type: string
    sql: ${TABLE}.c8002_gaid ;;
  }

  dimension: c8002_gigyaid {
    type: string
    sql: ${TABLE}.c8002_gigyaid ;;
  }

  dimension: c8002_ip {
    type: string
    sql: ${TABLE}.c8002_ip ;;
  }

  dimension: c8002_issueid {
    type: string
    sql: ${TABLE}.c8002_issueid ;;
  }

  dimension: c8002_keyword {
    type: string
    sql: ${TABLE}.c8002_keyword ;;
  }

  dimension: c8002_language {
    type: string
    sql: ${TABLE}.c8002_language ;;
  }

  dimension: c8002_lat {
    type: number
    sql: ${TABLE}.c8002_lat ;;
  }

  dimension: c8002_limit_ad_track {
    type: string
    sql: ${TABLE}.c8002_limit_ad_track ;;
  }

  dimension: c8002_lon {
    type: number
    sql: ${TABLE}.c8002_lon ;;
  }

  dimension: c8002_menu {
    type: string
    sql: ${TABLE}.c8002_menu ;;
  }

  dimension: c8002_news {
    type: string
    sql: ${TABLE}.c8002_news ;;
  }

  dimension: c8002_ngsid {
    type: string
    sql: ${TABLE}.c8002_ngsid ;;
  }

  dimension: c8002_nudid {
    type: string
    sql: ${TABLE}.c8002_nudid ;;
  }

  dimension: c8002_nxtu {
    type: string
    sql: ${TABLE}.c8002_nxtu ;;
  }

  dimension: c8002_nxtu_or_did {
    type: string
    sql: ${TABLE}.c8002_nxtu_or_did ;;
  }

  dimension: c8002_platform {
    type: string
    sql: ${TABLE}.c8002_platform ;;
  }

  dimension: c8002_postcode {
    type: string
    sql: ${TABLE}.c8002_postcode ;;
  }

  dimension: c8002_product {
    type: string
    sql: ${TABLE}.c8002_product ;;
  }

  dimension: c8002_ref_url {
    type: string
    sql: ${TABLE}.c8002_ref_url ;;
  }

  dimension: c8002_region {
    type: string
    sql: ${TABLE}.c8002_region ;;
  }

  dimension: c8002_section {
    type: string
    sql: ${TABLE}.c8002_section ;;
  }

  dimension: c8002_site {
    type: string
    sql: ${TABLE}.c8002_site ;;
  }

  dimension: c8002_source {
    type: string
    sql: ${TABLE}.c8002_source ;;
  }

  dimension: c8002_state {
    type: string
    sql: ${TABLE}.c8002_state ;;
  }

  dimension: c8002_street_id {
    type: string
    sql: ${TABLE}.c8002_street_id ;;
  }

  dimension: c8002_subsection {
    type: string
    sql: ${TABLE}.c8002_subsection ;;
  }

  dimension: c8002_subsubsection {
    type: string
    sql: ${TABLE}.c8002_subsubsection ;;
  }

  dimension: c8002_sz {
    type: string
    sql: ${TABLE}.c8002_sz ;;
  }

  dimension: c8002_title {
    type: string
    sql: ${TABLE}.c8002_title ;;
  }

  dimension: c8002_ua {
    type: string
    sql: ${TABLE}.c8002_ua ;;
  }

  dimension: c8002_video_duration {
    type: number
    sql: ${TABLE}.c8002_video_duration ;;
  }

  dimension: c8002_wifi {
    type: string
    sql: ${TABLE}.c8002_wifi ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: []
  }
}
