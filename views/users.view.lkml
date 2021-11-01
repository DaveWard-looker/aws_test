# The name of this view in Looker is "Users"
view: users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.users ;;
  drill_fields: [userid]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: userid {
    primary_key: yes
    type: number
    sql: ${TABLE}.userid ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "City" in Explore.

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: likebroadway {
    type: yesno
    sql: ${TABLE}.likebroadway ;;
  }

  dimension: likeclassical {
    type: yesno
    sql: ${TABLE}.likeclassical ;;
  }

  dimension: likeconcerts {
    type: yesno
    sql: ${TABLE}.likeconcerts ;;
  }

  dimension: likejazz {
    type: yesno
    sql: ${TABLE}.likejazz ;;
  }

  dimension: likemusicals {
    type: yesno
    sql: ${TABLE}.likemusicals ;;
  }

  dimension: likeopera {
    type: yesno
    sql: ${TABLE}.likeopera ;;
  }

  dimension: likerock {
    type: yesno
    sql: ${TABLE}.likerock ;;
  }

  dimension: likesports {
    type: yesno
    sql: ${TABLE}.likesports ;;
  }

  dimension: liketheatre {
    type: yesno
    sql: ${TABLE}.liketheatre ;;
  }

  dimension: likevegas {
    type: yesno
    sql: ${TABLE}.likevegas ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [userid, lastname, firstname, username]
  }
}

# These sum and average measures are hidden by default.
# If you want them to show up in your explore, remove hidden: yes.
