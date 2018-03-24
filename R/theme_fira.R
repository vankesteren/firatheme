#' Fira theme
#'
#' This theme uses Mozilla's Fira Sans as its font. Before using it, run the
#' \code{setupFont()} function to make it available for both on-screen graphics
#' and saving to pdf using \code{firaSave()}.
#'
#' @param family Change the font family. Defaults to Fira Sans.
#'
#' @return ggplot theme
#'
#' @examples
#' ggplot(mtcars, aes(x = mpg*0.43, y = wt*0.4535924, colour = cyl)) +
#'   geom_point(size = 2) +
#'   labs(title = "Car weight vs efficiency",
#'        x = "Efficiency (km/l)",
#'        y = "Weight (1000 kg)") +
#'   theme_fira()
#'
#' @seealso \code{\link{setupFont}}, \code{\link{firaCols}},
#' \code{\link{firaPalette}}
#'
#' @export
theme_fira <- function(family = "Fira Sans") {
  if (!"Fira Sans" %in% extrafont::fonts()) setupFont()
  list(ggplot2::`%+replace%`(
    ggplot2::theme_grey(base_size = 11.5, base_family = family),
    ggplot2::theme(
      # add padding to the plot
      plot.margin = unit(rep(0.5, 4), "cm"),

      # remove the plot background and border
      plot.background = element_blank(),
      panel.background = element_blank(),
      panel.border = element_blank(),

      # make the legend and strip background transparent
      legend.background = element_rect(fill = "transparent", colour = NA),
      legend.key = element_rect(fill = "transparent", colour = NA),
      strip.background = element_rect(fill = "transparent", colour = NA),

      # add light, dotted major grid lines only
      panel.grid.major = element_line(linetype = "dotted", colour = "#454545", size = 0.3),
      panel.grid.minor = element_blank(),

      # remove the axis tick marks and hide axis lines
      axis.ticks = element_blank(),
      axis.line = element_line(color = "#454545", size = 0.3),

      # modify the bottom margins of the title and subtitle
      plot.title = element_text(size = 18, colour = "#454545", hjust = 0.5,
                                margin = margin(b = 10)),
      plot.subtitle = element_text(size = 12, colour = "#454545", hjust = 0,
                                   margin = margin(b = 10)),

      # add padding to the caption
      plot.caption = element_text(size = 10, colour = "#212121", hjust = 1,
                                  margin = margin(t = 15)),

      # Adjust text size and axis title position
      axis.title = element_text(size = 13, colour = "#212121", hjust = 0.95),
      axis.text = element_text(size = 10, colour = "#212121"),
      legend.title = element_text(size = 12, colour = "#212121"),
      legend.text = element_text(size = 10, colour = "#212121"),
      strip.text = element_text(size = 12, colour = "#212121")
    )
  ),
  firascale_fill_discrete(),
  firascale_colour_discrete())
}

#' @export
setupFont <- function() {
  if (!file.exists("C:\\Program Files\\gs\\gs9.22\\bin\\gswin64c.exe")) {
    stop("Install GhostScript and run the following with the correct location",
         "to the installed GhostScript Binary:\n Sys.setenv(R_GSCMD =",
         '"C:\\Program Files\\gs\\gs9.22\\bin\\gswin64c.exe")')
  } else {
    Sys.setenv(R_GSCMD = "C:\\Program Files\\gs\\gs9.22\\bin\\gswin64c.exe")
  }
  if (!"Fira Sans" %in% extrafont::fonts()) {
    extrafont::ttf_import(paths = system.file('font', package = 'firatheme'))
  }
  if (.Platform$OS.type == "windows") {
    extrafont::loadfonts(device = "win", quiet = TRUE)
  }
  extrafont::loadfonts(quiet = TRUE)
}


#' @export
firaSave <- function(filename = "plot.pdf", device = "pdf", ...) {
  ggplot2::ggsave(filename = filename, device = device, ...)
  if (device == "pdf") {
    extrafont::embed_fonts(filename)
  }
}

#' @export
firaPalette <- function(n = 5) {
  if (n == 4) return(firaCols[c(1, 2, 3, 5)])
  return(grDevices::colorRampPalette(firaCols)(n))
}

#' @export
firaCols <- c("#00008b", "#499293", "#e2bd36", "#234c20", "#dd7373")


firascale_fill_discrete <- function(..., na.value = "grey50") {
  discrete_scale("fill", "fira", firaPalette, na.value = na.value, ...)
}

firascale_colour_discrete <- function(..., na.value = "grey50") {
  discrete_scale("colour", "fira", firaPalette, na.value = na.value, ...)
}
