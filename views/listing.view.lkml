# The name of this view in Looker is "Listing"
view: listing {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.listing ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Dateid" in Explore.

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

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: listtime {
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
    sql: ${TABLE}.listtime ;;
  }

  dimension: numtickets {
    type: number
    sql: ${TABLE}.numtickets ;;
  }

  dimension: priceperticket {
    type: number
    sql: ${TABLE}.priceperticket ;;
  }

  dimension: sellerid {
    type: number
    value_format_name: id
    sql: ${TABLE}.sellerid ;;
  }

  dimension: totalprice {
    type: number
    sql: ${TABLE}.totalprice ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [event.eventname, event.eventid, date.dateid]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_numtickets {
    type: sum
    hidden: yes
    sql: ${numtickets} ;;
  }

  measure: average_numtickets {
    type: average
    hidden: yes
    sql: ${numtickets} ;;
  }

  measure: total_priceperticket {
    type: sum
    hidden: yes
    sql: ${priceperticket} ;;
  }

  measure: average_priceperticket {
    type: average
    hidden: yes
    sql: ${priceperticket} ;;
  }

  measure: total_totalprice {
    type: sum
    hidden: yes
    sql: ${totalprice} ;;
  }

  measure: average_totalprice {
    type: average
    hidden: yes
    sql: ${totalprice} ;;
  }
}
