# The name of this view in Looker is "Sales"
view: sales {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.sales ;;
  drill_fields: [salesid]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: salesid {
    primary_key: yes
    type: number
    sql: ${TABLE}.salesid ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Buyerid" in Explore.

  dimension: buyerid {
    type: number
    value_format_name: id
    sql: ${TABLE}.buyerid ;;
  }

  dimension: commission {
    type: number
    sql: ${TABLE}.commission ;;
  }

  dimension: dateid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.dateid ;;
  }

  dimension: eventid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.eventid ;;
  }

  dimension: listid {
    type: number
    value_format_name: id
    sql: ${TABLE}.listid ;;
  }

  dimension: pricepaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.pricepaid ;;
  }

  dimension: qtysold {
    type: number
    sql: ${TABLE}.qtysold ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: saletime {
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
    sql: ${TABLE}.saletime ;;
  }

  dimension: sellerid {
    type: number
    value_format_name: id
    sql: ${TABLE}.sellerid ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [salesid, event.eventname, event.eventid, date.dateid]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_commission {
    type: sum
    hidden: yes
    sql: ${commission} ;;
  }

  measure: average_commission {
    type: average
    hidden: yes
    sql: ${commission} ;;
  }

  measure: total_qtysold {
    type: sum
    hidden: yes
    sql: ${qtysold} ;;
  }

  measure: average_qtysold {
    type: average
    hidden: yes
    sql: ${qtysold} ;;
  }
}
