#' EJ theme palette
#'
#' This function outputs n colours from the ej palette
#'
#' @param n the number of colours to output
#'
#' @seealso \code{\link{firaCols}}, \code{\link{valiPalette}}
#'
#' @export
ejPalette <- function(n = 5) {
  if (n == 4) return(ejCols[c(1, 3, 4, 5)])
  return(grDevices::colorRampPalette(ejCols)(n))
}

#' EJ theme colours
#'
#' This is a vector with 5 colours to be used in palettes and other visual
#' elements.
#'
#' @seealso \code{\link{ejPalette}}, \code{\link{valiPalette}}
#'
#' @export
ejCols <- c("#00008b", "#dd7373", "#499293", "#234c20", "#e2bd36")


#' Vali theme palette
#'
#' This function outputs n colours from the Vali palette
#'
#' @param n the number of colours to output
#'
#' @seealso \code{\link{valiCols}}, \code{\link{ejPalette}}
#'
#' @export
valiPalette <- function(n = 5) {
  if (n == 4) return(valiCols[c(1, 2, 4, 5)])
  return(grDevices::colorRampPalette(valiCols)(n))
}

#' Vali theme colours
#'
#' This is a vector with 5 colours to be used in palettes and other visual
#' elements.
#'
#' @seealso \code{\link{valiPalette}}, \code{\link{ejPalette}}
#'
#' @export
valiCols <- c("#961616", "044389", "#57a57c", "#ffe066", "#56203d")


firascale_fill_discrete <- function(..., na.value = "grey50") {

}

firascale_colour_discrete <- function(..., na.value = "grey50") {

}
