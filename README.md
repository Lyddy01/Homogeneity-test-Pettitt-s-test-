
🌧️ Pettitt’s Test for Rainfall Homogeneity

Pettitt’s test is applied to assess the homogeneity of annual rainfall time series. In climatological and hydrological studies, homogeneity refers to the consistency of a dataset’s statistical properties (e.g., mean, median) over time. A homogeneous series is statistically stable, showing no abrupt shifts or structural breaks during the observation period.Ensuring this consistency is crucial for accurate trend analysis, since undetected change points can distort long-term patterns and lead to misleading conclusions.

📘 About the Test

Pettitt’s test is a non-parametric method designed to detect a single change point in a time series.

Hypotheses (for Pettitt’s test):

  H₀ (Null): The series is homogeneous; all observations come from the same continuous distribution (no change point).
  
  H₁ (Alternative): At least one change point exists, indicating a shift in the distribution.

Decision Rule

   If p > 0.05 → Fail to reject H₀ → the series is considered homogeneous → proceed with trend analyses (Mann–Kendall, Sen’s slope, etc.).

   If p < 0.05 → Reject H₀ → a significant change point exists → data homogenisation or segmentation may be needed before applying trend detection techniques.

⚙️ Implementation in R

This analysis was carried out in R using the following packages:
  -trend
   → Pettitt’s test
  -ggplot2
   → Visualization
  -dplyr
   → Data manipulation

   📊 Example Output
🔹 Rainfall Time Series with Change Point 
![Rainfall Time Series Plot](/images/pettitt_graph.jpeg)

🔹 Pettitt Test Console Result in Rstudio 
![Pettitt Test Console Result](/images/pettitt_result.PNG)

📝 Interpretation  

The test produced a statistic of **U\* = 48** with an associated **p-value of 0.3857**.  

- Since the p-value is **greater than 0.05**, the null hypothesis of homogeneity could not be rejected.  
- Although the test suggested a potential shift around **2016**, this shift is **not statistically significant**.  
- This implies that the rainfall series remains **homogeneous**, and the apparent variation in 2016 is likely due to **natural fluctuations** rather than a fundamental shift in the rainfall regime.  

Therefore, the dataset can be considered statistically stable for subsequent trend analyses (e.g., Mann–Kendall test).
