# ----- Packages -----
library(trend)
library(ggplot2)
library(dplyr)

# ----- Data -----
data <- read.csv("new.csv", check.names = FALSE)
data <- data %>% arrange(Year)

# ----- Pettitt's test -----
pettitt_result <- pettitt.test(data$Mean..mm.yr.)

# Extract change-point
change_point_index <- pettitt_result$estimate
change_point_year <- data$Year[change_point_index]

# Label periods
data$Period <- ifelse(data$Year <= change_point_year, "Before Change", "After Change")

# ----- Plot -----
rain_plot <- ggplot(data, aes(x = Year, y = Mean..mm.yr.)) +
  geom_line(size = 1, color = "steelblue") +
  geom_point(aes(color = Period), size = 3) +
  geom_vline(xintercept = change_point_year, linetype = "dashed", color = "red", size = 1) +
  annotate("text",
           x = change_point_year + 0.5,
           y = max(data$Mean..mm.yr., na.rm = TRUE),
           label = paste("Change Point:\n", change_point_year),
           hjust = 0, vjust = 1.2, size = 4.5) +
  scale_color_manual(values = c("Before Change" = "darkgreen", "After Change" = "purple")) +
  labs(title = "Annual Rainfall and Pettitt Change Point",
       x = "Year", y = "Average Annual Rainfall (mm)", color = "Period") +
  theme_minimal(base_size = 14) +
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 45, hjust = 1))

print(rain_plot)

# Save plot for README
dir.create("images", showWarnings = FALSE)
ggsave("images/pettitt_plot.png", plot = rain_plot, width = 8, height = 5, dpi = 300)

# Print test results
print(pettitt_result)
cat("Change point year:", change_point_year, "\n")
