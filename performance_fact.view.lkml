view: performance_fact {
    sql_table_name: FACEBOOK.PERFORMANCE_FACT ;;

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension: accountkey {
    type: number
    sql: ${TABLE}."ACCOUNTKEY" ;;
  }

  dimension: adkey {
    type: number
    sql: ${TABLE}."ADKEY" ;;
  }

  dimension: adsetkey {
    type: number
    sql: ${TABLE}."ADSETKEY" ;;
  }

  dimension: campaignkey {
    type: number
    sql: ${TABLE}."CAMPAIGNKEY" ;;
  }

  dimension: devicekey {
    type: number
    sql: ${TABLE}."DEVICEKEY" ;;
  }

  dimension: datekey {
    type: number
    sql: ${TABLE}."DATEKEY" ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}."CLICKS" ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}."CONVERSIONS" ;;
  }

  dimension: cpm {
    type: number
    sql: ${TABLE}."CPM" ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}."CTR" ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}."FREQUENCY" ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}."IMPRESSIONS" ;;
  }

  dimension: inlinelinkclicks {
    type: number
    sql: ${TABLE}."INLINELINKCLICKS" ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}."REACH" ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}."SPEND" ;;
  }

  dimension: cpc {
    type: number
    sql: ${TABLE}."CPC" ;;
  }

  dimension: conversionvalue {
    type: number
    sql: ${TABLE}."CONVERSIONVALUE" ;;
  }

  dimension: performanceid {
    type: number
    primary_key: yes
    sql: ${TABLE}."PERFORMANCEID" ;;
  }

  dimension: _rowversion {
    type: number
    sql: ${TABLE}."_ROWVERSION" ;;
  }

  dimension_group: _timestamp {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."_TIMESTAMP" ;;
  }

  dimension: _registrationid {
    type: number
    sql: ${TABLE}."_REGISTRATIONID" ;;
  }

  dimension: _integrationaccountid {
    type: string
    sql: ${TABLE}."_INTEGRATIONACCOUNTID" ;;
  }

  dimension: _pid {
    type: number
    sql: ${TABLE}."_PID" ;;
  }
############# measures ##############

  measure: accountkey_count {
    type: count_distinct
    sql: ${TABLE}."ACCOUNTKEY" ;;
  }

  measure: adkey_count {
    type: count_distinct
    sql: ${TABLE}."ADKEY" ;;
  }

  measure: adsetkey_count {
    type: count_distinct
    sql: ${TABLE}."ADSETKEY" ;;
  }

  measure: campaignkey_count {
    type: count_distinct
    sql: ${TABLE}."CAMPAIGNKEY" ;;
  }

  measure: devicekey_count {
    type: count_distinct
    sql: ${TABLE}."DEVICEKEY" ;;
  }

  measure: datekey_count {
    type: count_distinct
    sql: ${TABLE}."DATEKEY" ;;
  }

  measure: click_count {
    type: sum
    label: "Clicks"
    sql: ${TABLE}."CLICKS" ;;
  }

  measure: conversion_count {
    type: sum
    label: "Conv"
    description: "Conversions"
    sql: ${TABLE}."CONVERSIONS" ;;
  }

  measure: conversion_rate {
    type: number
    label: "Conv Rate"
    description: "Conversion Rate - Conversion Count/Click Count"
    sql: ${conversion_count}/ nullif(${click_count},0) ;;
    value_format_name: percent_2
     }

  measure: cost_per_conversion {
    label: "Cost / Conv"
    type: number
    sql: ${cost} / nullif(${conversion_count},0) ;;
    value_format_name: usd
  }

  measure: cpms {
    type: average
    label: "CPM"
    description: "Cost per Thousand"
    sql: ${TABLE}."CPM" ;;
    value_format_name: usd
  }

  measure: ctrs {
    type: average
    label: "CTR"
    description: "Click Thru Rate"
    sql: ${TABLE}."CTR" ;;
    value_format: "0.00\%"
  }

  measure: impressions_sum {
    type: sum
    label: "Impressions"
    sql: ${TABLE}."IMPRESSIONS" ;;

  }

  measure: inlinelinkclicks_sum {
    type: sum
    sql: ${TABLE}."INLINELINKCLICKS" ;;
  }

  measure: reach_sum {
    type: sum
    label: "Reach"
    sql: ${TABLE}."REACH" ;;
  }

  measure: cost {
    type: sum
    label: "Ad Spend"
    sql: ${TABLE}."SPEND" ;;
    value_format_name: usd
  }

  measure: cpcs {
    type: average
    label: "CPC"
    description: "Cost per Click"
    sql: ${TABLE}."CPC" ;;
    value_format_name: usd
  }

  measure: conversionvalue_sum {
    type: sum
    label: "Conv Value"
    description: "Converted Revenue from Ads"
    sql: ${TABLE}."CONVERSIONVALUE" ;;
    value_format_name: usd
  }

  measure: ROAS {
   label: "ROAS"
  description: "Return on Ad Spend per Dollar Spent"
    type: number
    sql: ${conversionvalue_sum} / nullif(${cost},0) ;;
    value_format_name: decimal_2
  }

  set: detail {
    fields: [
      accountkey,
      adkey,
      adsetkey,
      campaignkey,
      devicekey,
      datekey,
      clicks,
      cpm,
      ctr,
      frequency,
      impressions,
      inlinelinkclicks,
      reach,
      spend,
      cpc,
      conversionvalue,
      performanceid,
      _rowversion,
      _timestamp_time,
      _registrationid,
      _integrationaccountid,
      _pid
    ]
  }
}
