library(tidyverse)

xx <- read_csv("Participant_List_Formatted (3).csv")
pattern <- "\\n([a-zA-Z0-9.]+@[a-zA-Z0-9.]+(com|edu|org))"

yy <- purrr::map(xx, function(v) {
    str_match(v, pattern)[, 2] %>%
        na.omit()
    })

emails <- do.call(c, yy)
names(emails) <- NULL

paste0(emails, collapse = ", ") %>%
    write(file = "addresses.txt")
