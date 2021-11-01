# The name of this view in Looker is "Venue"
view: venue {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.venue ;;
  drill_fields: [venueid]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: venueid {
    primary_key: yes
    type: number
    sql: ${TABLE}.venueid ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Venuecity" in Explore.

  dimension: venuecity {
    type: string
    sql: ${TABLE}.venuecity ;;
  }

  dimension: venuename {
    type: string
    sql: ${TABLE}.venuename ;;
  }

  dimension: venueseats {
    type: number
    sql: ${TABLE}.venueseats ;;
  }

  dimension: venuestate {
    type: string
    sql: ${TABLE}.venuestate ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [venueid, venuename, event.count]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_venueseats {
    type: sum
    hidden: yes
    sql: ${venueseats} ;;
  }

  measure: average_venueseats {
    type: average
    hidden: yes
    sql: ${venueseats} ;;
  }
}
