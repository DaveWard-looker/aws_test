# The name of this view in Looker is "Category"
view: category {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.category ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Catdesc" in Explore.

  dimension: catdesc {
    type: string
    sql: ${TABLE}.catdesc ;;
  }

  dimension: catgroup {
    type: string
    sql: ${TABLE}.catgroup ;;
  }

  dimension: catid {
    type: number
    value_format_name: id
    sql: ${TABLE}.catid ;;
  }

  dimension: catname {
    type: string
    sql: ${TABLE}.catname ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [catname]
  }
}

# These sum and average measures are hidden by default.
# If you want them to show up in your explore, remove hidden: yes.
