## Scrape the top 25 movies from a locally saved IMDB Top 250 page
##
## NOTE: IMDB blocks live scraping from cloud environments like JupyterHub.
## Instead, we work from a saved copy of the page: imdb-top-250.html
## Make sure imdb-top-250.html is in your AE 07 folder before running this script.

# Load packages ---------------------------------------------------------------

library(tidyverse)
library(rvest)

# Read local html page ---------------------------------------------------------
# Use the saved HTML file instead of the live URL

page <- read_html("AE 07/imdb-top-250.html")   # hint: filename in quotes, e.g. "myfile.html"

# Titles -----------------------------------------------------------------------
# CSS selector: .ipc-title-link-wrapper .ipc-title__text
# This selects title text nested inside a link wrapper (avoids the page heading)

titles <- page %>%
  html_nodes(".ipc-title-link-wrapper .ipc-title__text") %>%
  html_text()

# Years ------------------------------------------------------------------------
# CSS selector: .cli-title-metadata-item
# Each movie has 3 metadata items: year, runtime, rating label
# We want every 3rd item starting from the 1st (index 1, 4, 7, ...)

years_raw <- page %>%
  html_nodes(".cli-title-metadata-item") %>%
  html_text()

years <- years_raw[seq(1, length(years_raw), by = 3)] %>%
  as.numeric()

# Ratings ----------------------------------------------------------------------
# CSS selector: .ipc-rating-star--rating

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

