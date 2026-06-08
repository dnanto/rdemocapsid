#' Render the facets for a capsid model.
#'
#' @param h the lattice steps to the next pentamer
#' @param k the lattice steps to the next pentamer (after turning)
#' @param H the lattice steps to the next pentamer
#' @param K the lattice steps to the next pentamer (after turning)
#' @param t the turn direction (`r paste0(sprintf('"%s"', rdemocapsid::options_turn), collapse = ", ")`)
#' @param L the lattice primitive (`r paste0(sprintf('"%s"', rdemocapsid::options_lattice), collapse = ", ")`)
#' @param a the axial symmetry (`r paste0(sprintf('"%s"', rdemocapsid::options_axis), collapse = ", ")`)
#' @param R the circumradius of the lattice primitive
#' @param facet_outline the flag to toggle the facet outline
#' @param aesthetics the aesthetic configuration
#' @param width the width of the output element
#' @param height the height of the output element
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Adenovirus
#' facets(5, 5, R = 10, aesthetics = list(line = list(size = 1)))
#' # Enterobacteriophage T4
#' facets(3, 1, 4, 2, R = 25)
#' }
facets <- function(
  h = 1, k = 0, H = NULL, K = NULL,
  t = options_turn, L = options_lattice, a = options_axis, R = 100,
  facet_outline = F,
  aesthetics = list(),
  width = NULL, height = NULL
) {
  x <- c(
    h = h, k = k, H = ifelse(is.null(H), h, H), K = ifelse(is.null(K), k, K),
    t = as.integer(match.arg(t) == "levo"), L = match.arg(L), a = as.integer(match.arg(a)), R = R,
    facet_toggle = facet_outline,
    map_aesthetics_to_js(aesthetics)
  )
  htmlwidgets::createWidget(
    name = "facets",
    x,
    width = width,
    height = height,
    package = "rdemocapsid"
  )
}

#' @rdname rdemocapsid-shiny
#' @export
facetsOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "facets", width, height, package = "rdemocapsid")
}

#' @rdname rdemocapsid-shiny
#' @export
renderFacets <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, facetsOutput, env, quoted = TRUE)
}

facets_html <- function(id, style, class, ...) {
  htmltools::tags$canvas(id = id, style = style, class = class, ...)
}
