view: device_dim {
    sql_table_name: FACEBOOK.DEVICE_DIM ;;

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension: devicekey {
    type: number
    primary_key: yes
    sql: ${TABLE}."DEVICEKEY" ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}."DEVICE" ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}."PLATFORM" ;;
  }

  dimension: devicepublisher {
    type: string
    sql: ${TABLE}."DEVICEPUBLISHER" ;;
  }

  dimension: deviceid {
    type: number
    sql: ${TABLE}."DEVICEID" ;;
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

  set: detail {
    fields: [
      devicekey,
      device,
      platform,
      devicepublisher,
      deviceid,
      _rowversion,
      _timestamp_time
    ]
  }
}
