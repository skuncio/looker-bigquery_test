view: view_aggregate_with_article {

  derived_table: {
    sql: SELECT
      DATE(c8002_datetime) as c8002_datetime,
      c8002_product ,
      c8002_region ,
      c8002_platform ,
      c8002_source ,
      c8002_app_version,
      c8002_category,
      c8002_channel,
      c8002_section ,
      c8002_issueid,
      c8002_news ,
      c8002_content,
      c8002_edm,
      c8002_action,
      c8002_cid ,
      c8002_artid,
      c8002_title,
      c8002_auto,
      c8002_language ,
      c8002_keyword ,
      COUNT(CASE WHEN (c8002_action = 'PAGEVIEW') THEN 1 ELSE NULL END) AS total_page_views,
      COUNT(CASE WHEN (c8002_action = 'VIDEOVIEW') THEN 1 ELSE NULL END) AS total_video_views,
      AVG(CASE WHEN (c8002_action = 'VIDEOVIEW')
      THEN c8002_video_duration ELSE NULL END ) AS average_duration
      FROM  Testing_BQ.t8002_contentview
      GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
      ORDER BY 1,2,3,4,5 ASC  ;;
   sql_trigger_value: SELECT 3  ;;
  #  sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from convert_timezone('HKT',GETDATE())) - 60*60*4)/(60*60*24))

  }

  dimension: view_type {
    description: "PAGEVIEW or VIDEOVIEW"
    alias: [action]
    type: string
    sql: ${TABLE}.c8002_action ;;
  }

  dimension: app_version {
    type: string
    sql: ${TABLE}.c8002_app_version ;;
  }

  dimension: artid {
    type: string
    sql: ${TABLE}.c8002_artid ;;
  }

  dimension: auto_play {
    type: string
    sql: ${TABLE}.c8002_auto ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.c8002_category ;;
    drill_fields: [section, product]
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.c8002_channel ;;
  }

  dimension: content_id {
    type: string
    sql: ${TABLE}.c8002_cid ;;
  }

  dimension: content_type {
    type: string
    sql: ${TABLE}.c8002_content ;;
  }

  dimension_group: view {
    type: time
    timeframes: [time, date, week, month, year]
    convert_tz: no
    sql: ${TABLE}.c8002_datetime ;;
  }

  dimension: edm {
    type: string
    sql: ${TABLE}.c8002_edm ;;
  }

  dimension: issueid {
    type: string
    sql: ${TABLE}.c8002_issueid ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.c8002_keyword ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.c8002_language ;;
  }

  dimension: news {
    type: string
    sql: ${TABLE}.c8002_news ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.c8002_platform ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.c8002_product ;;
    drill_fields: [section, category]
  }

  dimension: region {
    type: string
    sql: ${TABLE}.c8002_region ;;
  }

  dimension: section {
    type: string
    sql: ${TABLE}.c8002_section ;;
    drill_fields: [product, category]
  }

  #  - dimension: site
  #    type: string
  #    sql: ${TABLE}.c8002_site

  dimension: source {
    type: string
    sql: ${TABLE}.c8002_source ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.c8002_title ;;
  }

  #### measures #############

  dimension: page_views {
    hidden: yes
    type: number
    sql: ${TABLE}.total_page_views ;;
  }

  measure: total_page_views {
    type: sum
    #value_format: '#,##0'
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    sql: ${page_views} ;;
  }

  dimension: video_views {
    hidden: yes
    type: number
    sql: ${TABLE}.total_video_views ;;
  }

  measure: total_video_views {
    type: sum
    #value_format: '#,##0'
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    sql: ${video_views} ;;
  }

  dimension: avg_video_duration {
    hidden: yes
    type: number
    sql: ${TABLE}.average_duration ;;
  }

  measure: average_video_duration {
    type: average
    value_format: "#,##0"
    sql: ${avg_video_duration} ;;
  }

  measure: count {
    type: count
 #   approximate: yes
    drill_fields: []
  }

  measure: distinct_content {
    #    view_label: Content
    type: count_distinct
    sql: ${content_id} ;;
   # approximate: yes
  }
}
