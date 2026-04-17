## Scrape the top 25 movies from a locally saved IMDB Top 250 page
## COMPLETE SOLUTION
##
## NOTE: IMDB blocks live scraping from cloud environments like JupyterHub.
## We read from imdb-top-250.html (a saved copy of the live page).
## Make sure imdb-top-250.html is in your AE 07 folder before running.

# Load packages ---------------------------------------------------------------

library(tidyverse)
library(rvest)

# Read local html page ---------------------------------------------------------

page <- read_html("imdb-top-250.html")

# Titles -----------------------------------------------------------------------
# .ipc-title-link-wrapper scopes the selector to movie links only,
# avoiding the "IMDb Top 250 Movies" page heading that also uses .ipc-title__text

titles <- page %>%
  html_nodes(".ipc-title-link-wrapper .ipc-title__text") %>%
  html_text()

# Years ------------------------------------------------------------------------
# Each movie row has 3 .cli-title-metadata-item elements: year | runtime | rating label
# seq() with by = 3 grabs every 1st item (the year) across all movies

years_raw <- page %>%
  html_nodes(".cli-title-metadata-item") %>%
  html_text()

years <- years_raw[seq(1, length(years_raw), by = 3)] %>%
  as.numeric()

# Ratings ----------------------------------------------------------------------

ratings <- page %>%
  html_nodes(".ipc-rating-star--rating") %>%
  html_text() %>%
  as.numeric()

# Put it all in a data frame ---------------------------------------------------

imdb_top_25 <- tibble(
  title  = titles,
  rating = ratings,
  year   = years
)

# Add rank ---------------------------------------------------------------------

imdb_top_25 <- imdb_top_25 %>%
  mutate(rank = 1:nrow(imdb_top_25)) %>%
  relocate(rank)

