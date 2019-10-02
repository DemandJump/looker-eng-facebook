view: adset_dim {
    sql_table_name: FACEBOOK.ADSET_DIM ;;


  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension: adsetkey {
    type: number
    primary_key: yes
    sql: ${TABLE}."ADSETKEY" ;;
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

  dimension: adsetid {
    type: string
    sql: ${TABLE}."ADSETID" ;;
  }

  dimension: accountid {
    type: string
    sql: ${TABLE}."ACCOUNTID" ;;
  }

  dimension: adsetname {
    type: string
    sql: ${TABLE}."ADSETNAME" ;;
  }

  dimension: campaignname {
    type: string
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
      adsetkey,
      createddate_date,
      adsetid,
      accountid,
      adsetname,
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
