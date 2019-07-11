#' Fira theme palette
#'
#' This function outputs n colours from the fira ggplot2 theme palette
#'
#' @param n the number of colours to output
#'
#' @seealso \code{\link{firaCols}}
#'
#' @export
firaPalette <- function(n = 5) {
  if (n == 4) return(firaCols[c(1, 3, 4, 5)])
  grDevices::colorRampPalette(firaCols, space = "Lab")(n)
}

#' Fira theme colours
#'
#' This is a vector with 5 colours to be used in palettes and other visual
#' elements.
#'
#' @seealso \code{\link{firaPalette}}
#'
#' @export
firaCols <- c("#00008b", "#dd7373", "#499293", "#234c20", "#e2bd36")

#' Fira discrete colour scales
#'
#' Colour scales belonging to the fira theme
#'
#' @inheritParams ggplot2::scale_colour_hue
#' @param continuous whether the associated variable should be considered
#' continuous. Typically used after "Error: Continuous value supplied to
#' discrete scale"
#'
#' @seealso \code{\link{firaPalette}}
#'
#' @rdname scale_fira
#' @export
scale_fill_fira <- function(..., continuous = FALSE) {
  if (continuous) {
    pal <- grDevices::colorRampPalette(c(firaCols[1], firaCols[5]),
                                       space = "Lab")
    return(ggplot2::scale_fill_gradientn(..., colours = pal(256)))
  }
  ggplot2::discrete_scale("fill", paste0("fira"), firaPalette, ...)
}


#' @rdname scale_fira
#' @export
scale_colour_fira <- function(..., continuous = FALSE) {
  if (continuous) {
    pal <- grDevices::colorRampPalette(c(firaCols[1], firaCols[5]),
                                       space = "Lab")
    return(ggplot2::scale_colour_gradientn(..., colours = pal(256)))
  }
  ggplot2::discrete_scale("colour", paste0("fira"), firaPalette, ...)
}

#' @rdname scale_fira
#' @export
scale_color_fira <- scale_colour_fira
