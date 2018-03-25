.onAttach <- function(libname, pkgname) {
  ## Load all fonts
  extrafont::loadfonts(quiet = TRUE)
  if (.Platform$OS.type == "windows") {
    extrafont::loadfonts("win", quiet = TRUE)
  }
}

setupFont <- function() {
  # Loadfonts
  if (!"Fira Sans" %in% extrafont::fonts()) {
    extrafont::ttf_import(paths = system.file("font", package = "firatheme"))
  }

  ## Load all fonts
  extrafont::loadfonts("pdf", quiet = TRUE)
  extrafont::loadfonts("postscript", quiet = TRUE)
  if (.Platform$OS.type == "windows") {
    extrafont::loadfonts("win", quiet = TRUE)
  }
}

setupGhostScript <- function() {
  # Setup ghostscript for pdf output
  if (.Platform$OS.type == "windows" &&
      file.exists("C:\\Program Files\\gs\\gs9.22\\bin\\gswin64c.exe")) {
    Sys.setenv(R_GSCMD = "C:\\Program Files\\gs\\gs9.22\\bin\\gswin64c.exe")
  } else {
    stop("Install GhostScript and run the following with the correct location",
         "to the installed GhostScript Binary:\n Sys.setenv(R_GSCMD =",
         '"C:\\Program Files\\gs\\gs9.22\\bin\\gswin64c.exe")')
  }

}

#' @importFrom grDevices windowsFonts
fontsReady <- function() {
  if (.Platform$OS.type == "windows") {
    if ("Fira Sans" %in% grDevices::windowsFonts()) return(TRUE)
  } else {
    if ("Fira Sans" %in% extrafont::fonts()) return(TRUE)
  }
  return(FALSE)
}
