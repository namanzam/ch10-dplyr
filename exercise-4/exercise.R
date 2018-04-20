# Exercise 4: practicing with dplyr

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
library(nycflights13)

# The data.frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# Use `??flights` to search for documentation on the data set (for what the 
# columns represent)
View(flights)
cols <- ncol(flights)
rows <- nrow(flights)

# Use `dplyr` to give the data frame a new column that is the amount of time
# gained in the air
flights <- flights %>%
  mutate(time_gained = arr_delay - dep_delay)

# Use `dplyr` to sort your data frame in descending order by the column you just
# created. Remember to save this as a variable (or in the same one!)
flights <- flights %>%
  arrange(-time_gained)

# For practice, repeat the last 2 steps in a single statement using the pipe
# operator. You can clear your environmental variables and reload the library 
# to "reset" it.


# Make a histogram of the amount of time gained using the `hist()` function
hist(x = flights$time_gained)

# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation
avg_time <- mean(x = flights$time_gained, na.rm = TRUE) < 0 

# Create a data.frame of flights headed to SeaTac ('SEA'), only including the
# origin, destination, and the "gain" column you just created
sea <- select(flights, origin, dest) %>%
  filter(dest == "SEA")

# On average, did flights to SeaTac gain or loose time?


# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement
# (without showing any other data)!

