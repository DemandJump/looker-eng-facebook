include: "date_comparison.view.lkml"

view: date_dim {
    extends: [date_comparison]
    sql_table_name: FACEBOOK.DATE_DIM ;;

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension: datekey {
    type: number
    primary_key: yes
    sql: ${TABLE}."DATEKEY" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATE" ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}."YEAR" ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: monthname {
    type: string
    sql: ${TABLE}."MONTHNAME" ;;
  }

  dimension: day {
    type: number
    sql: ${TABLE}."DAY" ;;
  }

  dimension: dayofweek {
    type: number
    sql: ${TABLE}."DAYOFWEEK" ;;
  }

  dimension: dayname {
    type: string
    sql: ${TABLE}."DAYNAME" ;;
  }

  dimension: weekofyear {
    type: number
    sql: ${TABLE}."WEEKOFYEAR" ;;
  }

  dimension: dayofyear {
    type: number
    sql: ${TABLE}."DAYOFYEAR" ;;
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: isweekend {
    type: string
    sql: ${TABLE}."ISWEEKEND" ;;
  }

  dimension: previousmonth {
    type: string
    sql: ${TABLE}."PREVIOUSMONTH" ;;
  }

  dimension: currentmonth {
    type: string
    sql: ${TABLE}."CURRENTMONTH" ;;
  }

  dimension: previousquarter {
    type: string
    sql: ${TABLE}."PREVIOUSQUARTER" ;;
  }

  dimension: currentquarter {
    type: string
    sql: ${TABLE}."CURRENTQUARTER" ;;
  }

  dimension: previousyear {
    type: string
    sql: ${TABLE}."PREVIOUSYEAR" ;;
  }

  dimension: currentyear {
    type: string
    sql: ${TABLE}."CURRENTYEAR" ;;
  }

  dimension: previousweek {
    type: string
    sql: ${TABLE}."PREVIOUSWEEK" ;;
  }

  dimension: currentweek {
    type: string
    sql: ${TABLE}."CURRENTWEEK" ;;

  }

  set: detail {
    fields: [
      datekey,
      date_date,
      year,
      month,
      monthname,
      day,
      dayofweek,
      dayname,
      weekofyear,
      dayofyear,
      quarter,
      isweekend,
      previousmonth,
      currentmonth,
      previousquarter,
      currentquarter,
      previousyear,
      currentyear,
      previousweek,
      currentweek
    ]
  }
}
