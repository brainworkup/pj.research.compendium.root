#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param data PARAM_DESCRIPTION
#' @param x PARAM_DESCRIPTION
#' @param y PARAM_DESCRIPTION
#' @param ... PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[ggplot2]{ggplot}}, \code{\link[ggplot2]{geom_segment}}, \code{\link[ggplot2]{aes}}, \code{\link[ggplot2]{geom_point}}, \code{\link[ggplot2]{theme}}, \code{\link[ggplot2]{margin}}
#'  \code{\link[stats]{reorder.default}}
#'  \code{\link[ggthemes]{theme_fivethirtyeight}}
#' @rdname dotplot
#' @export 
#' @importFrom ggplot2 ggplot geom_segment aes geom_point theme element_rect
#' @importFrom stats reorder
#' @importFrom ggthemes theme_fivethirtyeight
dotplot <- function(data, x, y, ...) {
  ggplot2::ggplot() +
    ggplot2::geom_segment(
      data = data,
      ggplot2::aes(
        x = x,
        y = stats::reorder(y, x),
        xend = 0,
        yend = y
      ),
      size = 0.5
    ) +
    ggplot2::geom_point(
      data = data,
      ggplot2::aes(x = x, y = stats::reorder(y, x)),
      shape = 21,
      size = 6,
      color = "black",
      fill = "orange"
    ) +
    ggthemes::theme_fivethirtyeight() +
    ggplot2::theme(panel.background = ggplot2::element_rect(fill = "white")) +
    ggplot2::theme(plot.background = ggplot2::element_rect(fill = "white")) +
    ggplot2::theme(panel.border = ggplot2::element_rect(color = "white"))
}


#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param data PARAM_DESCRIPTION
#' @param patient PARAM_DESCRIPTION, Default: NULL
#' @param mean_z PARAM_DESCRIPTION
#' @param mean_percentile PARAM_DESCRIPTION
#' @param ... PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[tidytable]{group_by}}, \code{\link[tidytable]{summarize}}, \code{\link[tidytable]{mutate}}, \code{\link[tidytable]{case_when}}, \code{\link[tidytable]{arrange}}
#'  \code{\link[desc]{desc}}
#'  \code{\link[tibble]{tibble}}
#'  \code{\link[highcharter]{list_parse}}, \code{\link[highcharter]{tooltip_table}}, \code{\link[highcharter]{highchart}}, \code{\link[highcharter]{hc_title}}, \code{\link[highcharter]{hc_add_series}}, \code{\link[highcharter]{hcaes}}, \code{\link[highcharter]{hc_xAxis}}, \code{\link[highcharter]{hc_yAxis}}, \code{\link[highcharter]{hc_tooltip}}, \code{\link[highcharter]{hc_plotOptions}}, \code{\link[highcharter]{hc_drilldown}}, \code{\link[highcharter]{hc_add_theme}}, \code{\link[highcharter]{hc_theme_sandsignika}}
#' @rdname drilldown
#' @export 
#' @importFrom tidytable group_by summarize mutate case_when arrange
#' @importFrom desc desc
#' @importFrom tibble tibble
#' @importFrom highcharter list_parse tooltip_table highchart hc_title hc_add_series hcaes hc_xAxis hc_yAxis hc_tooltip hc_plotOptions hc_drilldown hc_add_theme hc_theme_sandsignika
drilldown <- function(data, patient = NULL, mean_z, mean_percentile, ...) {

  # Create 4 levels of dataframes for drilldown -----------------------
  ## Level 1 -------------------------------------------------------
  ## Domain scores
  # 1. create mean z-scores for domain
  ncog1 <-
    data %>%
    tidytable::group_by(domain) %>%
    tidytable::summarize(
      mean_z = mean(z),
      mean_percentile = mean(percentile)
    ) %>%
    tidytable::mutate(range = NA)
  ncog1$mean_z <- round(ncog1$mean_z, 2L)
  ncog1$mean_percentile <- round(ncog1$mean_percentile, 0L)
  ncog1 <-
    ncog1 %>%
    tidytable::mutate(
      range = tidytable::case_when(
        mean_percentile >= 98 ~ "Exceptionally High",
        mean_percentile %in% 91:97 ~ "Above Average",
        mean_percentile %in% 75:90 ~ "High Average",
        mean_percentile %in% 25:74 ~ "Average",
        mean_percentile %in% 9:24 ~ "Low Average",
        mean_percentile %in% 2:8 ~ "Below Average",
        mean_percentile < 2 ~ "Exceptionally Low",
        TRUE ~ as.character(range)
      )
    )

  # 2. sort hi to lo
  ncog1 <- tidytable::arrange(ncog1, desc::desc(mean_percentile))

  # 3. create tibble with new column with domain name lowercase
  ncog_level1_status <- tibble::tibble(
    name = ncog1$domain,
    y = ncog1$mean_z,
    y2 = ncog1$mean_percentile,
    range = ncog1$range,
#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param data PARAM_DESCRIPTION
#' @param patient PARAM_DESCRIPTION, Default: NULL
#' @param mean_z PARAM_DESCRIPTION
#' @param mean_percentile PARAM_DESCRIPTION
#' @param ... PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[tidytable]{group_by}}, \code{\link[tidytable]{summarize}}, \code{\link[tidytable]{mutate}}, \code{\link[tidytable]{case_when}}, \code{\link[tidytable]{arrange}}
#'  \code{\link[desc]{desc}}
#'  \code{\link[tibble]{tibble}}
#'  \code{\link[highcharter]{list_parse}}, \code{\link[highcharter]{tooltip_table}}, \code{\link[highcharter]{highchart}}, \code{\link[highcharter]{hc_title}}, \code{\link[highcharter]{hc_add_series}}, \code{\link[highcharter]{hcaes}}, \code{\link[highcharter]{hc_xAxis}}, \code{\link[highcharter]{hc_yAxis}}, \code{\link[highcharter]{hc_tooltip}}, \code{\link[highcharter]{hc_plotOptions}}, \code{\link[highcharter]{hc_drilldown}}, \code{\link[highcharter]{hc_add_theme}}, \code{\link[highcharter]{hc_theme_sandsignika}}
#' @rdname drilldown
#' @export 
#' @importFrom tidytable group_by summarize mutate case_when arrange
#' @importFrom desc desc
#' @importFrom tibble tibble
#' @importFrom highcharter list_parse tooltip_table highchart hc_title hc_add_series hcaes hc_xAxis hc_yAxis hc_tooltip hc_plotOptions hc_drilldown hc_add_theme hc_theme_sandsignika
    drilldown = tolower(name)
  )

  ## Level 2 -------------------------------------------------------
  ## Subdomain scores
  ## function to create second level of drilldown (subdomain scores)
  ncog_level2_drill <-
    lapply(unique(neurocog$domain), function(x_level) {
      ncog2 <- subset(neurocog, neurocog$domain %in% x_level)

      # same as above
      ncog2 <-
        ncog2 %>%
        tidytable::group_by(subdomain) %>%
        tidytable::summarize(
          mean_z = mean(z),
          mean_percentile = mean(percentile)
        ) %>%
        tidytable::mutate(range = NA)

      # round z-score to 1 decimal
      ncog2$mean_z <- round(ncog2$mean_z, 2L)
      ncog2$mean_percentile <- round(ncog2$mean_percentile, 0L)
      ncog2 <-
        ncog2 %>%
        tidytable::mutate(
          range = tidytable::case_when(
            mean_percentile >= 98 ~ "Exceptionally High",
            mean_percentile %in% 91:97 ~ "Above Average",
            mean_percentile %in% 75:90 ~ "High Average",
            mean_percentile %in% 25:74 ~ "Average",
            mean_percentile %in% 9:24 ~ "Low Average",
            mean_percentile %in% 2:8 ~ "Below Average",
            mean_percentile < 2 ~ "Exceptionally Low",
            TRUE ~ as.character(range)
          )
        )

      # 2. sort hi to lo
      ncog2 <- tidytable::arrange(ncog2, desc::desc(mean_percentile))

      # 3. create tibble with new column with domain name lowercase
      ncog_level2_status <- tibble::tibble(
        name = ncog2$subdomain,
        y = ncog2$mean_z,
        y2 = ncog2$mean_percentile,
        range = ncog2$range,
#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param data PARAM_DESCRIPTION
#' @param patient PARAM_DESCRIPTION, Default: NULL
#' @param mean_z PARAM_DESCRIPTION
#' @param mean_percentile PARAM_DESCRIPTION
#' @param ... PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[tidytable]{group_by}}, \code{\link[tidytable]{summarize}}, \code{\link[tidytable]{mutate}}, \code{\link[tidytable]{case_when}}, \code{\link[tidytable]{arrange}}
#'  \code{\link[desc]{desc}}
#'  \code{\link[tibble]{tibble}}
#'  \code{\link[highcharter]{list_parse}}, \code{\link[highcharter]{tooltip_table}}, \code{\link[highcharter]{highchart}}, \code{\link[highcharter]{hc_title}}, \code{\link[highcharter]{hc_add_series}}, \code{\link[highcharter]{hcaes}}, \code{\link[highcharter]{hc_xAxis}}, \code{\link[highcharter]{hc_yAxis}}, \code{\link[highcharter]{hc_tooltip}}, \code{\link[highcharter]{hc_plotOptions}}, \code{\link[highcharter]{hc_drilldown}}, \code{\link[highcharter]{hc_add_theme}}, \code{\link[highcharter]{hc_theme_sandsignika}}
#' @rdname drilldown
#' @export 
#' @importFrom tidytable group_by summarize mutate case_when arrange
#' @importFrom desc desc
#' @importFrom tibble tibble
#' @importFrom highcharter list_parse tooltip_table highchart hc_title hc_add_series hcaes hc_xAxis hc_yAxis hc_tooltip hc_plotOptions hc_drilldown hc_add_theme hc_theme_sandsignika
        drilldown = tolower(paste(x_level, name, sep = "_"))
      )

      list(
        id = tolower(x_level),
        type = "column",
        data = highcharter::list_parse(ncog_level2_status)
      )
    })

  ## Level 3 -------------------------------------------------------
  ## Narrow subdomains
  ## reuse function
  ncog_level3_drill <-
    lapply(unique(neurocog$domain), function(x_level) {
      ncog2 <- subset(neurocog, neurocog$domain %in% x_level)

      # reuse function but with y_level
      lapply(unique(ncog2$subdomain), function(y_level) {
        # 1. create mean z-scores for subdomain
        # ncog3 becomes pronoun for domain
        ncog3 <- subset(ncog2, ncog2$subdomain %in% y_level)

        ncog3 <- ncog3 %>%
          tidytable::group_by(narrow) %>%
          tidytable::summarize(mean_z = mean(z), mean_percentile = mean(percentile)) %>%
          tidytable::mutate(range = NA)

        # round z-score to 1 decimal
        ncog3$mean_z <- round(ncog3$mean_z, 2L)
        ncog3$mean_percentile <- round(ncog3$mean_percentile, 0L)
        ncog3 <-
          ncog3 %>%
          tidytable::mutate(
            range = tidytable::case_when(
              mean_percentile >= 98 ~ "Exceptionally High",
              mean_percentile %in% 91:97 ~ "Above Average",
              mean_percentile %in% 75:90 ~ "High Average",
              mean_percentile %in% 25:74 ~ "Average",
              mean_percentile %in% 9:24 ~ "Low Average",
              mean_percentile %in% 2:8 ~ "Below Average",
              mean_percentile < 2 ~ "Exceptionally Low",
              TRUE ~ as.character(range)
            )
          )

        ncog3 <- tidytable::arrange(ncog3, desc::desc(mean_percentile))

        ncog_level3_status <- tibble::tibble(
          name = ncog3$narrow,
          y = ncog3$mean_z,
          y2 = ncog3$mean_percentile,
          range = ncog3$range,
#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param data PARAM_DESCRIPTION
#' @param patient PARAM_DESCRIPTION, Default: NULL
#' @param mean_z PARAM_DESCRIPTION
#' @param mean_percentile PARAM_DESCRIPTION
#' @param ... PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[tidytable]{group_by}}, \code{\link[tidytable]{summarize}}, \code{\link[tidytable]{mutate}}, \code{\link[tidytable]{case_when}}, \code{\link[tidytable]{arrange}}
#'  \code{\link[desc]{desc}}
#'  \code{\link[tibble]{tibble}}
#'  \code{\link[highcharter]{list_parse}}, \code{\link[highcharter]{tooltip_table}}, \code{\link[highcharter]{highchart}}, \code{\link[highcharter]{hc_title}}, \code{\link[highcharter]{hc_add_series}}, \code{\link[highcharter]{hcaes}}, \code{\link[highcharter]{hc_xAxis}}, \code{\link[highcharter]{hc_yAxis}}, \code{\link[highcharter]{hc_tooltip}}, \code{\link[highcharter]{hc_plotOptions}}, \code{\link[highcharter]{hc_drilldown}}, \code{\link[highcharter]{hc_add_theme}}, \code{\link[highcharter]{hc_theme_sandsignika}}
#' @rdname drilldown
#' @export 
#' @importFrom tidytable group_by summarize mutate case_when arrange
#' @importFrom desc desc
#' @importFrom tibble tibble
#' @importFrom highcharter list_parse tooltip_table highchart hc_title hc_add_series hcaes hc_xAxis hc_yAxis hc_tooltip hc_plotOptions hc_drilldown hc_add_theme hc_theme_sandsignika
          drilldown = tolower(paste(x_level, y_level, name, sep = "_"))
        )

        list(
          id = tolower(paste(x_level, y_level, sep = "_")),
          type = "column",
          data = highcharter::list_parse(ncog_level3_status)
        )
      })
    }) %>% unlist(recursive = FALSE)

  ## Level 4 -------------------------------------------------------
  ## Scale scores
  ## reuse both functions
  ncog_level4_drill <-
    lapply(unique(neurocog$domain), function(x_level) {
      ncog2 <- subset(neurocog, neurocog$domain %in% x_level)

      lapply(unique(ncog2$subdomain), function(y_level) {
        ncog3 <- subset(ncog2, ncog2$subdomain %in% y_level)

        lapply(unique(ncog3$narrow), function(z_level) {
          ncog4 <- subset(ncog3, ncog3$narrow %in% z_level)

          ncog4 <-
            ncog4 %>%
            tidytable::group_by(scale) %>%
            tidytable::summarize(
              mean_z = mean(z),
              mean_percentile = mean(percentile)
            ) %>%
            tidytable::mutate(range = NA)

          # round z-score to 1 decimal
          ncog4$mean_z <- round(ncog4$mean_z, 2L)
          ncog4$mean_percentile <- round(ncog4$mean_percentile, 0L)
          ncog4 <-
            ncog4 %>%
            tidytable::mutate(
              range = tidytable::case_when(
                mean_percentile >= 98 ~ "Exceptionally High",
                mean_percentile %in% 91:97 ~ "Above Average",
                mean_percentile %in% 75:90 ~ "High Average",
                mean_percentile %in% 25:74 ~ "Average",
                mean_percentile %in% 9:24 ~ "Low Average",
                mean_percentile %in% 2:8 ~ "Below Average",
                mean_percentile < 2 ~ "Exceptionally Low",
                TRUE ~ as.character(range)
              )
            )

          ncog4 <- tidytable::arrange(ncog4, desc::desc(mean_percentile))

          ncog_level4_status <- tibble::tibble(
            name = ncog4$scale,
            y = ncog4$mean_z,
            y2 = ncog4$mean_percentile,
            range = ncog4$range
          )

          list(
            id = tolower(paste(x_level, y_level, z_level, sep = "_")),
            type = "column",
            data = highcharter::list_parse(ncog_level4_status)
          )
        })
      }) %>% unlist(recursive = FALSE)
    }) %>% unlist(recursive = FALSE)

  # Create charts ----------------------------------
  # Tooltip
  x <- c("Name", "Score", "Percentile", "Range")
  y <- c("{point.name}", "{point.y}", "{point.y2}", "{point.range}")
  tt <- highcharter::tooltip_table(x, y)

  ## Create drilldown bar plot zscores
  plot <-
    highcharter::highchart() %>%
    highcharter::hc_title(
      text = patient,
      style = list(fontSize = "15px")
    ) %>%
    highcharter::hc_add_series(ncog_level1_status,
      type = "bar",
      name = "Neuropsychological Test Scores",
      highcharter::hcaes(x = name, y = y)
    ) %>%
    highcharter::hc_xAxis(
      type = "category",
      title = list(text = "Scale"),
      categories = .$name
    ) %>%
    highcharter::hc_yAxis(
      title = list(text = "z-score"),
      labels = list(format = "{value}")
    ) %>%
    highcharter::hc_tooltip(
      pointFormat = tt,
      useHTML = TRUE,
      valueDecimals = 1
    ) %>%
    highcharter::hc_plotOptions(series = list(
      colorByPoint = TRUE,
      allowPointSelect = TRUE,
      dataLabels = TRUE
    )) %>%
    highcharter::hc_drilldown(
      allowPointDrilldown = TRUE,
      series = c(ncog_level2_drill, ncog_level3_drill, ncog_level4_drill)
    ) %>%
    highcharter::hc_add_theme(highcharter::hc_theme_sandsignika())
  
  return(plot)
}
