#' lattice
#'
#' description
#'
#' @import htmlwidgets
#'
#' @export
lattice <- function(
  h = 1, k = 0, H = NULL, K = NULL,
  t = capsid_turns, L = capsid_tilings, a = capsid_axes,
  R = 100, s = 0,
  aesthetics = list(),
  width = NULL, height = NULL, elementId = NULL
) {
  x <- c(
    h = h, k = k, H = ifelse(is.null(H), h, H), K = ifelse(is.null(K), k, K),
    t = as.integer(match.arg(t) == "levo"), L = match.arg(L), a = as.integer(match.arg(a)),
    R = R, s = s,
    map_aesthetics_to_js(aesthetics)
  )
  htmlwidgets::createWidget(
    name = "lattice",
    x,
    width = width,
    height = height,
    package = "rdemocapsid",
    elementId = elementId
  )
}

lattice_html <- function(id, style, class, ...) {
  htmltools::tags$canvas(id = id, style = style, class = class, ...)
}
