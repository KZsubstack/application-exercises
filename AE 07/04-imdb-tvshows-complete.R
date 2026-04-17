## Scrape popular TV shows from a locally saved IMDB TV Meter page
## COMPLETE SOLUTION
##
## BEFORE YOU RUN THIS SCRIPT — save the HTML page first:
##
##   1. Open https://www.imdb.com/chart/tvmeter in Chrome or Firefox
##   2. Wait for the full page to load (scroll down a bit if needed)
##   3. Press Ctrl+S (Windows/Linux) or Cmd+S (Mac)
##   4. In the Save dialog:
##        - Set "Save as type" to "Webpage, Complete" (Chrome)
##          or "Web Page, complete" (Firefox)
##        - Name the file:  imdb-tvmeter.html
##        - Save it into your AE 07 folder
##   5. Come back here and run the script
##
## Why? IMDB blocks automated requests from cloud environments like JupyterHub.

# Load packages ----------------------------------------------------------------

#library(tidyverse)
#library(rvest)

# Read local html page ---------------------------------------------------------

#page <- read_html("imdb-tvmeter.html")

# Years ------------------------------------------------------------------------

#years_raw <- page %>%
#  html_nodes(".cli-title-metadata-item") %>%
#  html_text()
#
#years <- years_raw[seq(1, length(years_raw), by = 3)] %>%
#  as.numeric()

# Scores -----------------------------------------------------------------------

#scores <- page %>%
#  html_nodes(".ipc-rating-star--rating") %>%
#  html_text() %>%
#  as.numeric()

# Names ------------------------------------------------------------------------

#names <- page %>%
#  html_nodes(".ipc-title-link-wrapper .ipc-title__text") %>%
#  html_text()

# TV shows dataframe -----------------------------------------------------------

#tvshows <- tibble(
#  rank  = 1:length(names),
#  name  = names,
#  year  = years,
#  score = scores
#)

# Add new variables ------------------------------------------------------------

#tvshows <- tvshows %>%
#  mutate(
#    genre     = NA,
#    runtime   = NA,
#    n_episode = NA,
#  )

# Add new info for first show --------------------------------------------------

#tvshows$genre[1]     <- "Drama, Horror, Mystery"
#tvshows$runtime[1]   <- 494
#tvshows$n_episode[1] <- 9

# Add new info for second show -------------------------------------------------

#tvshows$genre[2]     <- "Action, Comedy, Crime"
#tvshows$runtime[2]   <- 60
#tvshows$n_episode[2] <- 17

# Add new info for third show --------------------------------------------------

#tvshows$genre[3]     <- "__"
#tvshows$runtime[3]   <- ___
#tvshows$n_episode[3] <- ___
