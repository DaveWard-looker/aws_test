view: derived_query {
  derived_table: {
    sql:
    SELECT sellerid,buyerid,dateid,sum(pricepaid) as price, sum(commission) as commission FROM public.sales
    group by sellerid,buyerid,dateid
    ;;
persist_for: "4 hours"
distribution_style: all
}
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sellerid {
    type: number
    sql: ${TABLE}.sellerid ;;
  }

  dimension: buyerid {
    type: number
    sql: ${TABLE}.buyerid ;;
  }

  dimension: dateid {
    type: number
    sql: ${TABLE}.dateid ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: commission {
    type: number
    sql: ${TABLE}.commission ;;
  }

  set: detail {
    fields: [sellerid, buyerid, dateid, price, commission]
  }
}
