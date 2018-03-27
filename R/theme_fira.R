#' Fira theme
#'
#' This theme uses Mozilla's Fira Sans as its font.
#' Save to pdf using \code{firaSave()}.
#'
#' @param family Change the font family. Defaults to Fira Sans.
#' @param colourPalette either the function ejPalette or valiPalette
#' (or any grDevices::colorRampPalette function)
#'
#' @return ggplot theme
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(x = mpg*0.43, y = wt*0.4535924, colour = factor(cyl))) +
#'   geom_point(size = 2) +
#'   labs(title = "Car weight vs efficiency",
#'        subtitle = "Using sensible metrics",
#'        x = "Efficiency (km/l)",
#'        y = "Weight (1000 kg)",
#'        colour = "Cylinders") +
#'   theme_fira()
#'
#' @seealso \code{\link{valiPalette}}, \code{\link{ejPalette}}
#'
#' @export
theme_fira <- function(family = "Fira Sans", colourPalette = ejPalette) {
  if (!fontsReady()) setupFont()
  list(ggplot2::`%+replace%`(
    ggplot2::theme_grey(base_size = 11.5, base_family = family),
    ggplot2::theme(
      # add padding to the plot
      plot.margin = grid::unit(rep(0.5, 4), "cm"),

      # remove the plot background and border
      plot.background = ggplot2::element_blank(),
      panel.background = ggplot2::element_blank(),
      panel.border = ggplot2::element_blank(),

      # make the legend and strip background transparent
      legend.background = ggplot2::element_rect(fill = "transparent",
                                                colour = NA),
      legend.key = ggplot2::element_rect(fill = "transparent",colour = NA),
      strip.background = ggplot2::element_rect(fill = "transparent",
                                               colour = NA),

      # add light, dotted major grid lines only
      panel.grid.major = ggplot2::element_line(linetype = "dotted",
                                               colour = "#454545",
                                               size = 0.3),
      panel.grid.minor = ggplot2::element_blank(),

      # remove the axis tick marks and hide axis lines
      axis.ticks = ggplot2::element_blank(),
      axis.line = ggplot2::element_line(color = "#454545", size = 0.3),

      # modify the bottom margins of the title and subtitle
      plot.title = ggplot2::element_text(size = 18, colour = "#454545",
                                         hjust = 0.5,
                                         margin = ggplot2::margin(b = 10)),
      plot.subtitle = ggplot2::element_text(size = 12, colour = "#454545",
                                            hjust = 0.5,
                                            margin = ggplot2::margin(b = 10)),

      # add padding to the caption
      plot.caption = ggplot2::element_text(size = 10, colour = "#454545",
                                           hjust = 1,
                                           margin = ggplot2::margin(t = 15)),

      # Adjust text size and axis title position
      axis.title = ggplot2::element_text(size = 13, colour = "#454545",
                                         hjust = 0.95),
      axis.text = ggplot2::element_text(size = 10, colour = "#212121"),
      legend.title = ggplot2::element_text(size = 12, colour = "#454545"),
      legend.text = ggplot2::element_text(size = 10, colour = "#212121"),
      strip.text = ggplot2::element_text(size = 12, colour = "#212121")
    )
  ),
  ggplot2::discrete_scale("fill", "fira", colourPalette, na.value = "grey50"),
  ggplot2::discrete_scale("colour", "fira", colourPalette, na.value = "grey50"))
}



#' Save plots that use the fira theme
#'
#' This function behaves like \code{ggsave} but automatically embeds the fira
#' font if the output format requires it. Install 64-bit GhostScript for this
#' functionality. Currently only works automatically on Windows. For other
#' platforms, run the following with the _correct_ location to the installed
#' GhostScript Binary: Sys.setenv(R_GSCMD = "bin/gs/gs9.23/binaryname")
#'
#' @param filename path to a file
#' @param device which type of output device to use
#' @param ... other arguments passed to ggsave
#'
#' @seealso \code{\link[ggplot2]{ggsave}}
#'
#' @export
firaSave <- function(filename = "plot.pdf", device = "pdf", ...) {
  needsFont <- device == "pdf" || device == "eps" || device == "ps"

  # set up ghostscript if needed
  if (Sys.getenv("R_GSCMD") == "" && needsFont) setupGhostScript()

  # save the image
  ggplot2::ggsave(filename = filename, device = device, ...)

  if (needsFont) extrafont::embed_fonts(filename)
}
