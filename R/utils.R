capsid_turns <- c("levo", "dextro")

capsid_axes <- c("5", "3", "2")

capsid_tilings <- c(
  "hex", "trihex", "snubhex", "rhombitrihex",
  "dualhex", "dualtrihex", "dualsnubhex", "dualrhombitrihex",
  "pinwheel-1", "pinwheel-2"
)

capsid_aesthetics <- list(
  line = list(color = "#000000", alpha = "ff", size = 5.5),
  fiber = list(color = "#eded61", alpha = "ff", size = 6, length = 40),
  knob = list(color = "#ffa500", alpha = "7f", size = 9),
  pentamer = list(
    unit1 = list(color = "#6da59b", alpha = "ff", fiber = F),
    unit2 = list(color = "#aed6d4", alpha = "ff", fiber = F),
    unit3 = list(color = "#8291c2", alpha = "ff", fiber = F)
  ),
  hexamer = list(
    unit1 = list(color = "#92be5f", alpha = "c8", fiber = F),
    unit2 = list(color = "#44782c", alpha = "ff", fiber = F),
    unit3 = list(color = "#3278ad", alpha = "ff", fiber = F)
  )
)

map_aesthetics_to_js <- function(aesthetics) {
  key1 <- c("color", "alpha", "fiber")
  key2 <- c("color", "alpha", "toggle")
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
}
