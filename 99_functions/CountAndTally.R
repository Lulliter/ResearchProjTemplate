# tally() is short-hand for summarise()
mtcars %>% tally()
# count() is a short-hand for group_by() + tally()
mtcars %>% count(cyl)

# add_tally() is short-hand for mutate()
mtcars %>% add_tally()
# add_count() is a short-hand for group_by() + add_tally()
mtcars %>% add_count(cyl)

# count and tally are designed so that you can call
# them repeatedly, each time rolling up a level of detail
species <- starwars %>% count(species, homeworld, sort = TRUE)
species
species %>% count(species, sort = TRUE)

# add_count() is useful for groupwise filtering
# e.g.: show only species that have a single member
starwars %>%
  add_count(species) %>%
  filter(n == 1)

glimpse(starwars)
