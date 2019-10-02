view: account_dim {
  sql_table_name: facebook.account_dim ;;


  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension: accountkey {
    type: number
    primary_key: yes
    sql: ${TABLE}."ACCOUNTKEY" ;;
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

  dimension: accountid {
    type: string
    sql: ${TABLE}."ACCOUNTID" ;;
  }

  dimension: accountname {
    type: string
    sql: ${TABLE}."ACCOUNTNAME" ;;
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
      accountkey,
      createddate_date,
      accountid,
      accountname,
      agedays,
      _rowversion,
      _timestamp_time,
      _registrationid,
      _integrationaccountid,
      _pid
    ]
  }
}
