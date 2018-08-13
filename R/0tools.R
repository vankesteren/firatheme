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

#' @importFrom grDevices windowsFonts
fontsReady <- function() {
  if (.Platform$OS.type == "windows") {
    if ("Fira Sans" %in% grDevices::windowsFonts()) return(TRUE)
  } else {
    if ("Fira Sans" %in% extrafont::fonts()) return(TRUE)
  }
  return(FALSE)
}

setupGhostScript <- function() {
  # Setup ghostscript for pdf output
  if (.Platform$OS.type == "windows") {
    binpath <- "bin/gswin64c.exe"
    basepath <- "C:/Program Files/gs"
    gsdirs <- list.dirs(basepath, recursive = FALSE)
    matches <- regexpr("[0-9].[0-9]*$", gsdirs)
    potentials <- matches > 0
    nmatches <- sum(potentials)

    if (nmatches == 1) {
      # only one version is installed
      Sys.setenv(R_GSCMD = file.path(gsdirs[potentials], binpath))
    } else if (nmatches > 1) {
      # find newest version
      versions <- numeric(nmatches)
      for (i in 1:nmatches) {
        m <- matches[potentials][i]
        mlen <- attr(matches, "match.length")[potentials][i]
        gsdir <- gsdirs[potentials][i]
        versions[i] <- as.numeric(gsub("\\.", "", substr(gsdir, m, m+mlen)))
      }
      Sys.setenv(R_GSCMD = file.path(gsdirs[potentials][which.max(versions)],
                                     binpath))
    } else {
      stop("64-bit GhostScript could not be found. Install 64-bit GhostScript",
           " or run the following with the _correct_ location",
           " to the installed GhostScript Binary:\n Sys.setenv(R_GSCMD =",
           ' "C:/Program Files/gs/gs<version.number>/bin/gswin64c.exe")')
    }
  } else {
    stop("Non-windows platforms currently not automatically supported.",
         " Run the following with the _correct_ location",
         " to the installed GhostScript Binary:\n Sys.setenv(R_GSCMD =",
         ' "bin/gs/gs9.23/binaryname")')
  }
}
