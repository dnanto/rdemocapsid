#' Render a capsid model.
#'
#' @param h the lattice steps to the next pentamer
#' @param k the lattice steps to the next pentamer (after turning)
#' @param H the lattice steps to the next pentamer
#' @param K the lattice steps to the next pentamer (after turning)
#' @param t the turn direction (`r paste0(sprintf('"%s"', rdemocapsid::options_turn), collapse = ", ")`)
#' @param L the lattice primitive (`r paste0(sprintf('"%s"', rdemocapsid::options_lattice), collapse = ", ")`)
#' @param a the axial symmetry (`r paste0(sprintf('"%s"', rdemocapsid::options_axis), collapse = ", ")`)
#' @param R the circumradius of the lattice primitive
#' @param s the sphericity/cylindricity (percentage normalized from 0 to 1)
#' @param roll the roll angle (in degrees)
#' @param pitch the pitch angle (in degrees)
#' @param yaw the yaw angle (in degrees)
#' @param penton_fiber the flag to toggle penton fibers
#' @param fiber_knob the flag to toggle the fiber knobs
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
#' capsid(5, 5, R = 10, aesthetics = list(line = list(size = 1)))
#' # Enterobacteriophage T4
#' capsid(3, 1, 4, 2, R = 25)
#' }
capsid <- function(
  h = 1, k = 0, H = NULL, K = NULL,
  t = options_turn, L = options_lattice, a = options_axis, R = 100, s = 0,
  roll = -90, pitch = 0, yaw = 0,
  penton_fiber = F, fiber_knob = F, facet_outline = F,
  aesthetics = list(),
  width = NULL, height = NULL
) {
  x <- c(
    h = h, k = k, H = ifelse(is.null(H), h, H), K = ifelse(is.null(K), k, K),
    t = match.arg(t) == "levo", L = match.arg(L), a = as.integer(match.arg(a)), R = R, s = s,
    stats::setNames(c(roll, pitch, yaw), c("\u03C6", "\u03B8", "\u03C8")),
    stats::setNames(c(penton_fiber, fiber_knob, facet_outline), c("penton_fiber_toggle", "knob_toggle", "facet_toggle")),
    map_aesthetics_to_js(aesthetics)
  )

  htmlwidgets::createWidget(
    name = "capsid",
    x,
    width = width,
    height = height,
    package = "rdemocapsid"
  )
}

#' @rdname rdemocapsid-shiny
#' @export
capsidOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "capsid", width, height, package = "rdemocapsid")
}

#' @rdname rdemocapsid-shiny
#' @export
renderCapsid <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, capsidOutput, env, quoted = TRUE)
}

capsid_html <- function(id, style, class, ...) {
  htmltools::tags$canvas(id = id, style = style, class = class, ...)
}
