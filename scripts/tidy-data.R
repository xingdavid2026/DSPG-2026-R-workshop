## Tidying Data -----

library(tidyverse)

interviews <- read_csv(file = "data-raw/SAFI_clean.csv", na = "NULL")

# Mean Number of Members and the Minimum Number of Members per Village and Member Association without NA's (missing values) in Member Association ----

interviews |> 
  filter(!is.na(memb_assoc)) |> 
  group_by(village, memb_assoc) |> 
  summarize(mean_no_membrs = mean(no_membrs), min_no_membrs = min(no_membrs)) |>
  ungroup()

interviews |> 
  filter(is.na(memb_assoc) == FALSE) |> 
  group_by(village, memb_assoc) |> 
  summarize(mean_no_membrs = mean(no_membrs), min_no_membrs = min(no_membrs))

interviews |> 
  filter(!is.na(memb_assoc)) |> 
  group_by(village, memb_assoc) |> 
  summarize(mean_no_membrs = mean(no_membrs), min_no_membrs = min(no_membrs),
            households = n()) |>
  ungroup()

interviews |> 
  count(village, memb_assoc)

interviews |> 
  count(village, memb_assoc, sort = TRUE)

interviews |> 
  filter(!is.na(memb_assoc)) |> 
  group_by(village, memb_assoc) |> 
  summarize(mean_no_membrs = mean(no_membrs), min_no_membrs = min(no_membrs),
            households = n()) |>
  arrange(desc(households))

## More Practice -----

interviews |> 
  filter_out(is.na(memb_assoc)) |> 
  mutate(per_room = no_membrs / rooms) |> 
  summarize(mean_per_room = mean(per_room), min_rooms = min(rooms), 
            households = n(), .by = c(village, memb_assoc)) |> 
  arrange(desc(households))

# TIDY data ----

interviews_items_owned <- interviews |> 
  separate_longer_delim(cols = items_owned, delim = ";") |> 
  replace_na(list(items_owned = "no_listed_items")) |> 
  mutate(items_logical = TRUE) |> 
  group_by(key_ID) |> 
  mutate(number_items = if_else(
    items_owned == "no_listed_items", 0, n())) |> 
  pivot_wider(names_from = items_owned, 
              values_from = items_logical,
              values_fill = list(items_logical = FALSE))
  
interviews_plotting <- interviews_items_owned |> 
  separate_longer_delim(cols = months_lack_food, delim = ";") |> 
  group_by(key_ID) |> # keep grouped by key_ID
  mutate(months_logical = TRUE, 
         number_months_lack_food = if_else(
           months_lack_food == "none", 0, n())) |> 
  pivot_wider(names_from = months_lack_food, 
              values_from = months_logical,
              values_fill = list(months_logical = FALSE))
  

# Save the Data -----------------------------------------------------------

write_csv(interviews_plotting, file = "data/interviews-plotting.csv")








