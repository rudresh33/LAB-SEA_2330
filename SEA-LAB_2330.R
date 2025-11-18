# COVID-19 Global Data Analysis
# IMC503 Data Science Toolkit - SEA Lab Assessment
# Date: 18/11/2025
# Roll number: 2330

# Load required libraries
library(tidyverse)
library(ggplot2)
library(scales)
library(gridExtra)
library(RColorBrewer)

# Read the data
covid_data <- read.csv("C:\\Users\\rudh0\\Downloads\\country_wise_latest.csv")

# Display basic information about the dataset
cat("Dataset Dimensions:", dim(covid_data), "\n")
cat("Column Names:", names(covid_data), "\n\n")

# Summary statistics
summary(covid_data)

# ============================================================================
# VISUALIZATION 1: Top 20 Countries by Confirmed Cases
# ============================================================================
top20_countries <- covid_data %>%
  arrange(desc(Confirmed)) %>%
  head(20)

p1 <- ggplot(top20_countries, aes(x = reorder(Country.Region, Confirmed), y = Confirmed, fill = Country.Region)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  scale_fill_manual(values = colors_20) +
  labs(title = "Top 20 Countries by Confirmed COVID-19 Cases",
       x = "Country",
       y = "Confirmed Cases") +
  scale_y_continuous(labels = comma) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"),
        legend.position = "none")

# ============================================================================
# VISUALIZATION 2: Case Fatality Rate (Deaths per 100 Cases) - Top 20
# ============================================================================
top20_fatality <- covid_data %>%
  filter(Deaths > 50) %>%  # Filter countries with at least 50 deaths
  arrange(desc(Deaths...100.Cases)) %>%
  head(20)

p2 <- ggplot(top20_fatality, aes(x = reorder(Country.Region, Deaths...100.Cases), 
                                 y = Deaths...100.Cases)) +
  geom_bar(stat = "identity", fill = "darkred") +
  coord_flip() +
  labs(title = "Top 20 Countries by Case Fatality Rate",
       subtitle = "(Countries with at least 50 deaths)",
       x = "Country",
       y = "Deaths per 100 Cases") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"),
        plot.subtitle = element_text(hjust = 0.5))

# ============================================================================
# VISUALIZATION 3: Recovery Rate by WHO Region
# ============================================================================
regional_summary <- covid_data %>%
  group_by(WHO.Region) %>%
  summarise(
    Total_Confirmed = sum(Confirmed),
    Total_Deaths = sum(Deaths),
    Total_Recovered = sum(Recovered),
    Avg_Recovery_Rate = mean(Recovered...100.Cases, na.rm = TRUE),
    Countries_Count = n()
  )

p3 <- ggplot(regional_summary, aes(x = reorder(WHO.Region, Avg_Recovery_Rate), 
                                   y = Avg_Recovery_Rate)) +
  geom_bar(stat = "identity", fill = "forestgreen") +
  coord_flip() +
  labs(title = "Average Recovery Rate by WHO Region",
       x = "WHO Region",
       y = "Average Recovery Rate (%)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# ============================================================================
# VISUALIZATION 4: Scatter Plot - Confirmed Cases vs Deaths
# ============================================================================
p4 <- ggplot(covid_data, aes(x = Confirmed, y = Deaths)) +
  geom_point(aes(color = WHO.Region), alpha = 0.6, size = 3) +
  geom_smooth(method = "lm", se = TRUE, color = "black", linetype = "dashed") +
  scale_x_log10(labels = comma) +
  scale_y_log10(labels = comma) +
  labs(title = "Relationship between Confirmed Cases and Deaths",
       subtitle = "Log scale for both axes",
       x = "Confirmed Cases (log scale)",
       y = "Deaths (log scale)",
       color = "WHO Region") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"),
        plot.subtitle = element_text(hjust = 0.5),
        legend.position = "bottom")

# ============================================================================
# VISUALIZATION 5: Active Cases Distribution by Region
# ============================================================================
p5 <- ggplot(covid_data, aes(x = WHO.Region, y = Active, fill = WHO.Region)) +
  geom_boxplot() +
  scale_y_log10(labels = comma) +
  labs(title = "Distribution of Active Cases by WHO Region",
       x = "WHO Region",
       y = "Active Cases (log scale)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"),
        axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none")

# ============================================================================
# VISUALIZATION 6: Weekly Change Analysis - Top 15 Countries
# ============================================================================
top15_growth <- covid_data %>%
  filter(X1.week.change > 0) %>%
  arrange(desc(X1.week...increase)) %>%
  head(15)

p6 <- ggplot(top15_growth, aes(x = reorder(Country.Region, X1.week...increase), 
                               y = X1.week...increase)) +
  geom_bar(stat = "identity", fill = "orange") +
  coord_flip() +
  labs(title = "Top 15 Countries by Weekly Percentage Increase",
       x = "Country",
       y = "1 Week % Increase") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# ============================================================================
# VISUALIZATION 7: Regional Total Cases Pie Chart
# ============================================================================
regional_cases <- covid_data %>%
  group_by(WHO.Region) %>%
  summarise(Total_Cases = sum(Confirmed)) %>%
  arrange(desc(Total_Cases))

p7 <- ggplot(regional_cases, aes(x = "", y = Total_Cases, fill = WHO.Region)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Global COVID-19 Cases Distribution by WHO Region",
       fill = "WHO Region") +
  theme_void() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  geom_text(aes(label = paste0(round(Total_Cases/sum(Total_Cases)*100, 1), "%")),
            position = position_stack(vjust = 0.5))

# ============================================================================
# VISUALIZATION 8: New Cases vs New Deaths
# ============================================================================
covid_filtered <- covid_data %>%
  filter(New.cases > 0 & New.deaths > 0)

p8 <- ggplot(covid_filtered, aes(x = New.cases, y = New.deaths)) +
  geom_point(aes(color = WHO.Region), alpha = 0.6, size = 3) +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  scale_x_log10(labels = comma) +
  scale_y_log10(labels = comma) +
  labs(title = "Correlation between New Cases and New Deaths",
       x = "New Cases (log scale)",
       y = "New Deaths (log scale)",
       color = "WHO Region") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"),
        legend.position = "bottom")

# ============================================================================
# Save all plots
# ============================================================================
ggsave("plot1_top20_confirmed.pdf", plot = p1, width = 10, height = 8)
ggsave("plot2_fatality_rate.pdf", plot = p2, width = 10, height = 8)
ggsave("plot3_recovery_rate_region.pdf", plot = p3, width = 10, height = 8)
ggsave("plot4_cases_vs_deaths.pdf", plot = p4, width = 12, height = 8)
ggsave("plot5_active_cases_distribution.pdf", plot = p5, width = 10, height = 8)
ggsave("plot6_weekly_growth.pdf", plot = p6, width = 10, height = 8)
ggsave("plot7_regional_distribution.pdf", plot = p7, width = 10, height = 8)
ggsave("plot8_new_cases_deaths.pdf", plot = p8, width = 12, height = 8)

# ============================================================================
# Generate Summary Statistics
# ============================================================================
cat("\n========== SUMMARY STATISTICS ==========\n\n")

cat("Global Totals:\n")
cat("Total Confirmed Cases:", format(sum(covid_data$Confirmed), big.mark = ","), "\n")
cat("Total Deaths:", format(sum(covid_data$Deaths), big.mark = ","), "\n")
cat("Total Recovered:", format(sum(covid_data$Recovered), big.mark = ","), "\n")
cat("Total Active Cases:", format(sum(covid_data$Active), big.mark = ","), "\n")
cat("Global Case Fatality Rate:", 
    round(sum(covid_data$Deaths) / sum(covid_data$Confirmed) * 100, 2), "%\n")
cat("Global Recovery Rate:", 
    round(sum(covid_data$Recovered) / sum(covid_data$Confirmed) * 100, 2), "%\n\n")

cat("Top 5 Countries by Confirmed Cases:\n")
print(head(covid_data %>% 
             select(Country.Region, Confirmed, Deaths, Recovered) %>%
             arrange(desc(Confirmed)), 5))

cat("\n\nRegional Summary:\n")
print(regional_summary)

cat("\n\nAnalysis Complete! All plots saved as PDF files.\n")

