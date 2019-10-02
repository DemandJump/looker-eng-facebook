view: campaign_dim {
    sql_table_name: FACEBOOK.CAMPAIGN_DIM ;;


  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension: campaignkey {
    type: number
    primary_key: yes
    sql: ${TABLE}."CAMPAIGNKEY" ;;
  }

  dimension_group: createddate {
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
    sql: ${TABLE}."CREATEDDATE" ;;
  }

  dimension: campaignid {
    type: string
    sql: ${TABLE}."CAMPAIGNID" ;;
  }

  dimension: accountid {
    type: string
    sql: ${TABLE}."ACCOUNTID" ;;
  }

  dimension: campaignname {
    type: string
    label: "Campaign Name"
    sql: ${TABLE}."CAMPAIGNNAME" ;;
  }

  dimension: agedays {
    type: number
    sql: ${TABLE}."AGEDAYS" ;;
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

  set: detail {
    fields: [
      campaignkey,
      createddate_date,
      campaignid,
      accountid,
      campaignname,
      agedays,
      _rowversion,
      _timestamp_time,
      _registrationid,
      _integrationaccountid,
      _pid
    ]
  }
}
