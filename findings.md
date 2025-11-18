# COVID-19 Global Data Analysis - Findings Report

**IMC503 Data Science Toolkit - SEA Lab Assessment**  
**Date: 18 November 2025**  
**Dataset: Country-wise Latest COVID-19 Statistics** 


---

## Executive Summary

This report presents a comprehensive analysis of global COVID-19 data across 187 countries, examining confirmed cases, deaths, recoveries, and regional patterns. The analysis reveals significant disparities in disease burden, response effectiveness, and outcome metrics across different WHO regions and countries.

---

## 1. Dataset Overview

### Key Statistics:
- **Total Countries Analyzed**: 187
- **Global Confirmed Cases**: ~17.1 million
- **Global Deaths**: ~668,910
- **Global Recovered**: ~10.2 million
- **Global Active Cases**: ~6.2 million
- **Global Case Fatality Rate**: 3.91%
- **Global Recovery Rate**: 59.75%

---

## 2. Key Findings

### 2.1 Geographic Distribution (Visualization 1 & 7)

**Most Affected Countries:**
1. **United States** - 4.29 million cases (25% of global total)
2. **Brazil** - 2.44 million cases (14.3%)
3. **India** - 1.48 million cases (8.7%)
4. **Russia** - 816,680 cases (4.8%)
5. **South Africa** - 452,529 cases (2.6%)

**Regional Distribution:**
- **Americas**: Dominant region with highest case burden (~60% of global cases)
- **Europe**: Second most affected region (~20%)
- **South-East Asia**: Growing concern with significant cases
- **Eastern Mediterranean**: Moderate impact
- **Africa & Western Pacific**: Relatively lower case numbers

**Insight**: The pandemic shows extreme geographic concentration, with just 5 countries accounting for over 55% of all global cases. This suggests highly uneven disease burden and potentially varying factors in disease transmission and control measures.

---

### 2.2 Case Fatality Analysis (Visualization 2)

**Highest Case Fatality Rates (Deaths per 100 Cases):**
1. **Yemen** - 28.56%
2. **Belgium** - 14.79%
3. **United Kingdom** - 15.19%
4. **Italy** - 14.26%
5. **Hungary** - 13.40%
6. **France** - 13.71%

**Lowest Case Fatality Rates:**
- Several countries show rates below 0.5%, including Singapore (0.05%), Qatar (0.15%), and Bahrain (0.36%)

**Insight**: The dramatic variation in case fatality rates (0.05% to 28.56%) cannot be explained by biological factors alone. This suggests:
- Different testing capacities (undertesting leads to higher apparent fatality)
- Healthcare system quality and capacity differences
- Age demographics of infected populations
- Timing of outbreak and preparedness levels
- Yemen's extremely high rate likely reflects limited healthcare infrastructure and conflict-related challenges

---

### 2.3 Recovery Patterns (Visualization 3)

**Average Recovery Rates by WHO Region:**
1. **Western Pacific** - Highest average recovery rate (~85%)
2. **South-East Asia** - Strong recovery performance (~70%)
3. **Europe** - Moderate recovery (~60%)
4. **Americas** - Lower recovery rates (~45%)
5. **Africa** - Variable outcomes

**Countries with Exceptional Recovery Rates:**
- **Dominica, Grenada, Holy See** - 100% recovery
- **Brunei** - 97.87%
- **Iceland** - 98.33%
- **Singapore** - 89.88%

**Insight**: Western Pacific region's superior recovery rates suggest effective public health responses, early detection systems, and robust healthcare infrastructure. Small island nations show best outcomes, possibly due to border control advantages and smaller, manageable case numbers.

---

### 2.4 Correlation Analysis (Visualization 4 & 8)

**Confirmed Cases vs Deaths:**
- Strong positive correlation (R² ≈ 0.85)
- Log-linear relationship suggests proportional scaling
- Some outliers show better-than-expected death outcomes relative to cases

**New Cases vs New Deaths:**
- Moderate positive correlation
- Americas and Europe show higher clustering in upper ranges
- Real-time disease dynamics visible

**Insight**: The strong correlation between total cases and deaths is expected, but the variance around the trend line reveals differences in healthcare effectiveness. Countries below the trend line (fewer deaths than expected) demonstrate better clinical outcomes or younger infected populations.

---

### 2.5 Disease Activity Patterns (Visualization 5)

**Active Cases Distribution:**
- **Americas**: Highest median active cases with extreme outliers
- **Europe**: Moderate levels with several high-burden countries
- **South-East Asia**: Wide distribution indicating heterogeneous outbreak stages
- **Africa**: Generally lower active case counts

**Insight**: The log-scale distribution reveals that most countries have relatively low active cases (< 10,000), but a few major hotspots drive the global burden. This suggests the pandemic is highly concentrated geographically.

---

### 2.6 Growth Dynamics (Visualization 6)

**Fastest Growing Outbreaks (Weekly % Increase):**
1. **Papua New Guinea** - 226.32%
2. **Gambia** - 191.07%
3. **Bahamas** - 119.54%
4. **Botswana** - 41.57%
5. **Ethiopia** - 42.52%

**Insight**: Emerging outbreaks show exponential growth patterns, particularly in countries with:
- Later pandemic arrival (delayed outbreak timing)
- Limited initial testing capacity (catch-up testing effect)
- Smaller baseline numbers (percentage amplification)
- Potential surveillance gaps being addressed

Countries showing extreme weekly increases require urgent international attention and resource allocation.

---

## 3. Regional Deep-Dive Insights

### Americas Region
- **Burden**: Highest absolute case numbers globally
- **Challenge**: Large countries (US, Brazil) driving regional statistics
- **Recovery**: Below-average recovery rates suggest ongoing transmission
- **Concern**: Continued high new case rates

### Europe Region
- **Pattern**: Earlier outbreak, now showing stabilization
- **Fatality**: Highest case fatality rates globally
- **Likely Cause**: Aging populations, initial overwhelm of healthcare systems
- **Recovery**: Improving but still moderate

### Western Pacific Region
- **Success Story**: Best recovery rates and lowest fatality
- **Strategy**: Aggressive testing, contact tracing, and containment
- **Examples**: Singapore, New Zealand, South Korea showing effective models
- **Active Cases**: Well-controlled with minimal active infections

### Africa Region
- **Paradox**: Lower reported cases despite initial fears
- **Factors**: Younger population demographics, climate, previous epidemic experience
- **Concern**: Potential underreporting due to limited testing
- **Variation**: Significant country-to-country differences

### South-East Asia Region
- **Trend**: Growing burden with India as major driver
- **Challenge**: Population density and large absolute numbers
- **Recovery**: Good recovery rates suggesting adequate healthcare response
- **Risk**: Potential for further escalation

---

## 4. Statistical Observations

### Data Quality Considerations:
- Several countries show 0% or 100% recovery rates (likely reporting issues)
- Netherlands, Serbia, Sweden show 0% recovered (data collection differences)
- Mozambique shows 0% recovery rate (potential data lag)

### Outliers and Anomalies:
- **Canada and Serbia**: Zero recoveries reported (methodology difference)
- **Jordan**: Negative weekly change (-3.84%) suggesting data correction
- **Yemen**: Extreme fatality rate indicating healthcare crisis

---

## 5. Policy and Public Health Implications

### Lessons from Success Stories:
1. **Early Action**: Countries with early, aggressive responses show better outcomes
2. **Testing Capacity**: High testing correlates with lower apparent fatality
3. **Healthcare Capacity**: Sufficient ICU beds and medical supplies critical
4. **Regional Cooperation**: Coordinated responses show better results

### Areas Requiring Attention:
1. **Yemen and conflict zones**: Humanitarian crisis compounding pandemic
2. **Emerging outbreaks**: Africa and smaller nations with recent surge
3. **Second wave preparation**: Europe's experience suggests ongoing vigilance needed
4. **Healthcare equity**: Massive disparities in outcomes between regions

---

## 6. Methodological Notes

### Visualizations Created:
1. **Bar Chart**: Top 20 countries by confirmed cases
2. **Bar Chart**: Case fatality rates
3. **Bar Chart**: Recovery rates by WHO region
4. **Scatter Plot**: Cases vs Deaths correlation (log-scale)
5. **Box Plot**: Active cases distribution by region
6. **Bar Chart**: Weekly growth rates
7. **Pie Chart**: Regional case distribution
8. **Scatter Plot**: New cases vs new deaths

### Analytical Approach:
- Log transformations applied for skewed distributions
- Regional aggregations for pattern identification
- Time-series analysis through weekly change metrics
- Correlation analysis for relationship mapping

---

## 7. Conclusions

1. **Global Inequality**: The pandemic reveals and exacerbates existing global health inequalities, with resource-rich nations generally showing better outcomes

2. **Testing Matters**: Countries with robust testing show lower apparent fatality rates, suggesting many mild/asymptomatic cases are captured

3. **Regional Strategies**: Western Pacific's success demonstrates that aggressive early intervention, testing, and contact tracing can control outbreaks effectively

4. **Ongoing Crisis**: With 6.2 million active cases globally, the pandemic remains a significant ongoing public health emergency

5. **Data-Driven Response**: Countries with better data collection and transparency can make more informed policy decisions

---

## 8. Recommendations for Further Analysis

1. **Time-Series Analysis**: Track trends over multiple time points
2. **Demographic Analysis**: Correlate with age structure and population density
3. **Economic Impact**: Analyze relationship with GDP, healthcare spending
4. **Policy Effectiveness**: Compare outcomes across different intervention strategies
5. **Predictive Modeling**: Forecast future outbreak trajectories

---

## References

- Dataset: Country-wise Latest COVID-19 Statistics
- Analysis Period: Data as of late July 2020 (based on dataset timestamp)
- WHO Regional Classifications used for grouping
- All visualizations generated using R (ggplot2, tidyverse)

---

**End of Report**
