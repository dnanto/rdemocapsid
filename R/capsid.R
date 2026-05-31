#' capsid
#'
#' description
#'
#' @import htmlwidgets
#'
#' @export
capsid <- function(
  h = 1, k = 0, H = NULL, K = NULL,
  t = capsid_turns, L = capsid_tilings, a = capsid_axes,
  R = 100, s = 0,
  roll = -90, pitch = 0, yaw = 0,
  penton_fiber = F, fiber_knob = F, facet_outline = F,
  aesthetics = list(),
  width = NULL, height = NULL, elementId = NULL
) {
  key1 <- c("color", "alpha", "fiber")
  key2 <- c("color", "alpha", "toggle")
  x <- c(
    h = h, k = k, H = ifelse(is.null(H), h, H), K = ifelse(is.null(K), k, K),
    t = as.integer(match.arg(t) == "levo"), L = match.arg(L), a = as.integer(match.arg(a)), R = R, s = s,
    setNames(c(roll, pitch, yaw), c("φ", "θ", "ψ")),
    setNames(c(penton_fiber, fiber_knob, facet_outline), c("penton_fiber_toggle", "knob_toggle", "facet_toggle")),
    with(
      modifyList(capsid_aesthetics, aesthetics),
      c(
        setNames(line, paste0("line_", names(line))),
        setNames(fiber, paste0("fiber_", names(fiber))),
        setNames(knob, paste0("knob_", names(knob))),
        setNames(pentamer$unit1[key1], paste("mer", key2, "1", sep = "_")),
        setNames(pentamer$unit2[key1], paste("mer", key2, "2", sep = "_")),
        setNames(pentamer$unit3[key1], paste("mer", key2, "3", sep = "_")),
        setNames(hexamer$unit1[key1], paste("mer", key2, "4", sep = "_")),
        setNames(hexamer$unit2[key1], paste("mer", key2, "5", sep = "_")),
        setNames(hexamer$unit3[key1], paste("mer", key2, "6", sep = "_"))
      )
    )
  )
  htmlwidgets::createWidget(
    name = "capsid",
    x,
    width = width,
    height = height,
    package = "rdemocapsid",
    elementId = elementId
  )
}

capsid_html <- function(id, style, class, ...) {
  htmltools::tags$canvas(id = id, style = style, class = class, ...)
}
