view: ad_dim {
    sql_table_name: FACEBOOK.AD_DIM ;;


  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension: adkey {
    type: number
    primary_key: yes
    sql: ${TABLE}."ADKEY" ;;
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

  dimension: adid {
    type: string
    sql: ${TABLE}."ADID" ;;
  }

  dimension: accountid {
    type: string
    sql: ${TABLE}."ACCOUNTID" ;;
  }

  dimension: adname {
    type: string
    sql: ${TABLE}."ADNAME" ;;
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
      adkey,
      createddate_date,
      adid,
      accountid,
      adname,
      agedays,
      _rowversion,
      _timestamp_time,
      _registrationid,
      _integrationaccountid,
      _pid
    ]
  }
}
