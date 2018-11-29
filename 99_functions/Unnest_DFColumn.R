#https://stackoverflow.com/questions/47224831/using-tidyr-unnest-with-null-values


# data 
input1 <- data.frame(id = c("c", "d", "e"), value = c(7, 8, 9))
input2 <- NULL
input3 <- data.frame(id = c(NA), value = c(NA))

df <- dplyr::tibble(
	a = c(1, 2),
	b = list(a = input1, c = input2)
)  

# 1) If you don't care about those rows with a NULL, you could simply remove them with filter and unnest:
df %>% 
	filter(!map_lgl(b, is.null)) %>% 
	unnest() 
#> # A tibble: 3 x 3
#>       a     id value
#>   <dbl> <fctr> <dbl>
#> 1     1      c     7
#> 2     1      d     8
#> 3     1      e     9


# 2) n case you want to keep those rows, you could bring them back with right_join after unnesting:
df %>% 
	filter(!map_lgl(b, is.null)) %>% 
	unnest() %>% 
	right_join(select(df, a))
#> Joining, by = "a"
#> # A tibble: 4 x 3
#>       a     id value
#>   <dbl> <fctr> <dbl>
#> 1     1      c     7
#> 2     1      d     8
#> 3     1      e     9
#> 4     2   <NA>    NA