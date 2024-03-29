nationalities <- c("Polish", "Soviet", "Romani", "Hungarian", "French", "German", "Dutch", "Greek", "Belgian", "Yugoslav")

set.seed(2024)

victim_counts <- sample(50:300, length(nationalities), replace = TRUE) * 1000



holocaust_victims <- data.frame(
  
  Nationality = nationalities,
  
  Victims = victim_counts
  
)

write.csv(holocaust_victims, 'simulated_holocaust_victims.csv', row.names = FALSE)


head(holocaust_victims)