view: view_aggregate {
  # Or, you could make this view a derived table, like this :
  derived_table: {
    #    sql_trigger_value: select date(convert_timezone('hkt', getdate()))
    #    persist_for: 72 hours
    #    sql: |
    #        SELECT
    #        DATE(CONVERT_TIMEZONE('UTC', 'Hongkong', contentview.c8002_datetime)) as "c8002_datetime",
    #        contentview.c8002_artid ,
    #        ORDER BY 1,2,3,4,5,6,7,8,9 ASC
    #    sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from convert_timezone('HKT',GETDATE())) - 60*60*4)/(60*60*24))

    sql: SELECT
      DATE(contentview.c8002_datetime) as c8002_datetime,
      contentview.c8002_product ,
      contentview.c8002_region ,
      contentview.c8002_platform ,
      contentview.c8002_source ,
      contentview.c8002_app_version,
      contentview.c8002_category,
      contentview.c8002_channel,
      contentview.c8002_section ,
      contentview.c8002_news ,
      contentview.c8002_action,
      contentview.c8002_auto,
      contentview.c8002_cid ,
      contentview.c8002_nxtu_or_did ,
      COUNT(CASE WHEN (contentview.c8002_action = 'PAGEVIEW') THEN 1 ELSE NULL END) AS total_page_views,
      COUNT(CASE WHEN (contentview.c8002_action = 'VIDEOVIEW') THEN 1 ELSE NULL END) AS total_video_views,
      AVG(CASE WHEN (contentview.c8002_action = 'VIDEOVIEW')
      THEN contentview.c8002_video_duration ELSE NULL END ) AS average_duration
      FROM Testing_BQ.t8002_contentview AS contentview
      GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14
       ;;
    sql_trigger_value: SELECT 1 ;;
    # persist_for: "6 hours"
    # ìndexes: ["c8002_datetime" , "c8002_cid" ]
    # distribution: "c8002_cid"
  }

  dimension: view_type {
    description: "PAGEVIEW or VIDEOVIEW"
    alias: [action]
    type: string
    sql: ${TABLE}.c8002_action ;;
  }

  #  - dimension: browser
  #    type: string
  #    sql: ${TABLE}.c8002_br

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
    drill_fields: [channel, section, news]
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.c8002_channel ;;
    drill_fields: [category, section, news]
  }

  dimension: content_id {
    #    view_label: Content
    type: string
    sql: ${TABLE}.c8002_cid ;;
  }

  dimension_group: view {
    type: time
    timeframes: [time, date, week, month, year]
    convert_tz: no
    sql: ${TABLE}.c8002_datetime ;;
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
    drill_fields: [region, platform]
  }

  dimension: region {
    type: string
    sql: ${TABLE}.c8002_region ;;
    drill_fields: [product, platform]
  }

  dimension: section {
    type: string
    sql: ${TABLE}.c8002_section ;;
    drill_fields: [channel, news]
  }

  #  - dimension: site
  #    type: string
  #    sql: ${TABLE}.c8002_site

  dimension: source {
    type: string
    sql: ${TABLE}.c8002_source ;;
  }

  #  - dimension: title
  #    view_label: Content
  #    type: string
  #    sql: ${TABLE}.c8002_title

  dimension: user_id {
    hidden: yes
    #    view_label: User
    type: string
    sql: ${TABLE}.c8002_nxtu_or_did ;;
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

  measure: average_duration {
    type: average
    value_format: "#,##0"
    sql: ${avg_video_duration} ;;
  }

  measure: count {
    type: count
   # approximate: yes
    drill_fields: []
  }

  measure: distinct_users {
    #    view_label: User
    type: count_distinct
    sql: ${user_id} ;;
    # approximate: yes
  }

  measure: distinct_content {
    #    view_label: Content
    type: count_distinct
    sql: ${content_id} ;;
    # approximate: yes
  }
}
