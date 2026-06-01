#' facets
#'
#' description
#'
#' @import htmlwidgets
#'
#' @export
facets <- function(
  h = 1, k = 0, H = NULL, K = NULL,
  t = capsid_turns, L = capsid_tilings, a = capsid_axes,
  R = 100, s = 0,
  facet_outline = F,
  aesthetics = list(),
  width = NULL, height = NULL, elementId = NULL
) {
  x <- c(
    h = h, k = k, H = ifelse(is.null(H), h, H), K = ifelse(is.null(K), k, K),
    t = as.integer(match.arg(t) == "levo"), L = match.arg(L), a = as.integer(match.arg(a)),
    R = R, s = s,
    facet_toggle = facet_outline,
    map_aesthetics_to_js(aesthetics)
  )
  htmlwidgets::createWidget(
    name = "facets",
    x,
    width = width,
    height = height,
    package = "rdemocapsid",
    elementId = elementId
  )
}

facets_html <- function(id, style, class, ...) {
  htmltools::tags$canvas(id = id, style = style, class = class, ...)
}
