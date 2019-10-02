view: date_comparison {
  extension: required

  filter: primary_period_filter {
    group_label: "Period Over Period"
    type: date
  }

  #   PERIOD OVER PERIOD SELECTION

  parameter: comparison_period_granularity {
    label: "Previous Period Granularity"
    type: unquoted
    allowed_value: { label: "Previous Period" value: "previous_period" }
    allowed_value: { label: "Week Over Week" value: "WEEK" }
    allowed_value: { label: "Month Over Month" value: "MONTH" }
    allowed_value: { label: "Quarter Over Quarter" value: "QUARTER" }
    allowed_value: { label: "Year Over Year" value: "YEAR" }
  }

  #   COMMON DIMENSIONS

#   dimension: _data {
#     sql: TIMESTAMP(${TABLE}._data_date) ;;
#     hidden: yes
#   }


  dimension: date_compare_date {
    hidden: yes
    sql: ${date_dim.date_date}

    ;;
  }

  dimension: comparison_period_distance {
    type: number
    hidden: yes
    sql:
      {% if comparison_period_granularity._parameter_value == 'WEEK' %}
        CASE
          WHEN CAST((${primary_num_days}/7) AS BIGINT) >= 1
            THEN CAST(CEIL(${primary_num_days}/7) AS BIGINT)
          ELSE 1
        END
      {% elsif comparison_period_granularity._parameter_value == 'MONTH' %}
        CASE
          WHEN CAST((${primary_num_days}/30) AS BIGINT) >= 1
            THEN CAST(CEIL(${primary_num_days}/30) AS BIGINT)
          ELSE 1
        END
      {% elsif comparison_period_granularity._parameter_value == 'QUARTER' %}
        CASE
          WHEN CAST((${primary_num_days}/90) AS BIGINT) >= 1
            THEN CAST(CEIL(${primary_num_days}/90) AS BIGINT)
          ELSE 1
        END
      {% elsif comparison_period_granularity._parameter_value == 'YEAR' %}
        CASE
          WHEN CAST((${primary_num_days}/365) AS BIGINT) >= 1
            THEN CAST(CEIL(${primary_num_days}/365) AS BIGINT)
          ELSE 1
        END
      {% else %}
        NULL
      {% endif %}
    ;;
  }

  dimension: current_period_start_date {
    type: date
    hidden: yes
    sql:  {% date_start primary_period_filter %} ;;
  }

  dimension: current_period_end_date {
    type: date
    hidden: yes
    sql:  DATEADD(DAY,-1,{% date_end primary_period_filter %}) ;;
  }

  dimension: current_period_date_range {
    type: string
    hidden: yes
    group_label: "Period Over Period"
    sql: concat(CAST(FORMAT_DATE('%x',${current_period_start_date}) AS STRING),' - ',CAST(FORMAT_DATE('%x',${current_period_end_date}) AS STRING)) ;;
  }

  dimension: previous_period_start_date {
    group_label: "Period Over Period"
    hidden: yes
    type: date
    sql:
    {% if comparison_period_granularity._parameter_value == 'previous_period' %}
      DATEADD(DAY,(-(${primary_num_days}*2)),CAST({% date_end primary_period_filter %} AS DATE))
    {% else %}
      DATEADD({% parameter comparison_period_granularity %},-${comparison_period_distance},CAST({% date_start primary_period_filter %} AS DATE))
    {% endif %}
    ;;
  }

  dimension: previous_period_end_date {
    group_label: "Period Over Period"
    hidden: yes
    type: date
    sql:
    {% if comparison_period_granularity._parameter_value == 'previous_period' %}
      DATEADD(DAY, -1, CAST({% date_start primary_period_filter %} AS DATE))
    {% else %}
      DATEADD(DAY,-1,DATEADD({% parameter comparison_period_granularity %},-${comparison_period_distance},CAST({% date_end primary_period_filter %} AS DATE)))
    {% endif %}
    ;;
  }

  dimension: previous_period_date_range {
    hidden: yes
    type: string
    group_label: "Period Over Period"
    sql: concat(CAST(TO_DATE( ${previous_period_start_date},'MM/DD/YYYY') AS STRING),' - ',CAST(TO_DATE( ${previous_period_end_date},'MM/DD/YYYY') AS STRING)) ;;
  }

  dimension: days_from_primary_start {
    group_label: "Period Over Period"
    hidden: yes
    type: number
    sql: DATEDIFF(DAY,CAST({% date_start primary_period_filter %} AS DATE),${date_compare_date}) ;;
  }

  dimension: days_from_previous_start {
    group_label: "Period Over Period"
    hidden: yes
    type: number
    sql: DATEDIFF(DAY,CAST(${previous_period_start_date} AS DATE),${date_compare_date}) ;;
  }

  dimension: primary_num_days {
    group_label: "Period Over Period"
    hidden: yes
    type: number
    sql: DATEDIFF(DAY, CAST({% date_start primary_period_filter %} AS DATE), CAST({% date_end primary_period_filter %} AS DATE)) ;;
  }

  dimension: days_from_first_period {
    group_label: "Period Over Period"
    type: number
    hidden: yes
    sql:
      CASE
        WHEN ${days_from_primary_start} >= 0 and ${days_from_primary_start} < ${primary_num_days}
         THEN ${days_from_primary_start}
        WHEN ${days_from_previous_start} >= 0 and ${days_from_previous_start} < ${primary_num_days}
         THEN ${days_from_previous_start}
      END
    ;;
  }

  dimension: period_selection {
    group_label: "Period Over Period"
    type: string
    sql:
      CASE
        WHEN ${date_compare_date} >= CAST({% date_start primary_period_filter %} AS DATE)
        AND ${date_compare_date} < CAST({% date_end primary_period_filter %} AS DATE)
        THEN 'Current Period'
        WHEN ${date_compare_date} >= CAST(${previous_period_start_date} AS DATE)
        AND ${date_compare_date} <= CAST(${previous_period_end_date} AS DATE)
        THEN 'Previous Period'
      END
    ;;
  }
}
