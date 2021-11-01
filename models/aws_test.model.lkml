# Define the database connection to be used for this model.
connection: "aws_rs_test"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: aws_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: aws_test_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Aws Test"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.


datagroup: venue_datagroup {

  max_cache_age: "24 hours"
}



explore: derived_query {}

explore: dt_venue_location {}

explore: category {}

explore: date {}

explore: event {
  join: venue {
    type: left_outer
    sql_on: ${event.venueid} = ${venue.venueid} ;;
    relationship: many_to_one
  }

  join: date {
    type: left_outer
    sql_on: ${event.dateid} = ${date.dateid} ;;
    relationship: many_to_one
  }
}

explore: listing {
  join: event {
    type: left_outer
    sql_on: ${listing.eventid} = ${event.eventid} ;;
    relationship: many_to_one
  }

  join: date {
    type: left_outer
    sql_on: ${listing.dateid} = ${date.dateid} ;;
    relationship: many_to_one
  }

  join: venue {
    type: left_outer
    sql_on: ${event.venueid} = ${venue.venueid} ;;
    relationship: many_to_one
  }
}

explore: sales {
  join: event {
    type: left_outer
    sql_on: ${sales.eventid} = ${event.eventid} ;;
    relationship: many_to_one
  }

  join: date {
    type: left_outer
    sql_on: ${sales.dateid} = ${date.dateid} ;;
    relationship: many_to_one
  }

  join: venue {
    type: left_outer
    sql_on: ${event.venueid} = ${venue.venueid} ;;
    relationship: many_to_one
  }
}

explore: users {}

explore: venue {}
