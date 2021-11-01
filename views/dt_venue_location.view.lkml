# If necessary, uncomment the line below to include explore_source.
# include: "aws_test.model.lkml"

view: dt_venue_location {
  derived_table: {
    distribution_style: all
  #   create_process: {
  #     sql_step: set query_group to 'priority' ;;
  # }
    explore_source: event {
      column: venuecity { field: venue.venuecity }
      column: venuestate { field: venue.venuestate }
      column: count { field: venue.count }
    }
    persist_for: "5 minutes"
  }
  dimension: venuecity {}
  dimension: venuestate {}
  dimension: count {
    type: number
  }

}
