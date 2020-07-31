connection: "snowflake-edw"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: performance_fact{
  label: "Facebook"
  access_filter: {
    field:  performance_fact._pid
    user_attribute: djaim_pid
    }
  join: account_dim {
    sql_on: ${account_dim.accountkey} = ${performance_fact.accountkey}  ;;
    relationship: many_to_one
    type: inner
  }
  join: ad_dim {
    sql_on: ${ad_dim.adkey} = ${performance_fact.adkey} ;;
    relationship: many_to_one
    type: inner
  }
  join: adset_dim {
    sql_on: ${adset_dim.adsetkey} = ${performance_fact.adsetkey} ;;
    relationship: many_to_one
    type: inner
  }
  join: campaign_dim {
    sql_on: ${campaign_dim.campaignkey} = ${performance_fact.campaignkey};;
    relationship: many_to_one
    type: inner
  }
  join: date_dim {
    sql_on: ${date_dim.datekey} = ${performance_fact.datekey} ;;
    relationship: many_to_one
    type: inner
  }
  join: device_dim {
    sql_on: ${device_dim.devicekey} = ${performance_fact.devicekey} ;;
    relationship: many_to_one
    type: inner
  }
}
