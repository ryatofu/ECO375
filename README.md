# ECO375
Here’s a sample `README` file for your Stata code:

---

# README for Stata Code: Analyzing GDP per Capita Growth and Perceived Health Status

## Overview

This Stata code performs an analysis of the relationship between GDP per capita growth and perceived health status using data from OECD countries. The analysis includes both simple and multiple regression models, as well as residual analysis. The code also includes subgroup analyses by country and by year, generating visualizations for each step. The results are logged and saved as text files, and relevant plots are exported as PNG images.

## Purpose

The goal of this analysis is to explore how perceived health status impacts economic growth (measured by GDP per capita growth) across OECD countries. By analyzing the data using regression techniques and residual diagnostics, this study aims to uncover insights into the relationship between health and economic outcomes.

## Code Breakdown

1. **Load the Dataset:**
   - The dataset is loaded using the `use` command: `use "ECO375", clear`.

2. **Descriptive Statistics:**
   - The `summarize` command provides basic descriptive statistics for the variables in the dataset.

3. **Simple Regression:**
   - A simple regression analysis is performed with GDP per capita growth (`gdp_pc_growth`) as the dependent variable and perceived health status (`per_health`) as the independent variable.
   - The estimated coefficient and standard error for perceived health are displayed.
   - A scatter plot with a regression line is created, and the plot is exported as `simple_regression_plot.png`.

4. **Residuals Analysis for Simple Regression:**
   - Predicted values and residuals are generated for the simple regression model.
   - A residuals vs. fitted values plot is created and exported as `simple_residuals_vs_fitted.png`.

5. **Multiple Regression:**
   - A multiple regression analysis is performed, including the additional control variable `cap_prod_growth` (capital productivity growth).
   - A scatter plot with a regression line for the multiple regression is created and exported as `multiple_regression_plot.png`.

6. **Residuals Analysis for Multiple Regression:**
   - Predicted values and residuals are generated for the multiple regression model.
   - A residuals vs. fitted values plot is created and exported as `multiple_residuals_vs_fitted.png`.

7. **Subgroup Analysis by Country:**
   - The code loops over each country in the dataset (identified by `Reference_area`) and performs a separate regression for each country.
   - Scatter plots and residuals vs. fitted values plots are generated and exported for each country (e.g., `country_scatter_gdp_vs_health.png`, `country_residuals_vs_fitted.png`).

8. **Subgroup Analysis by Year:**
   - The code loops over each year in the dataset (identified by `Time_period`) and performs a separate regression for each year.
   - Scatter plots and residuals vs. fitted values plots are generated and exported for each year (e.g., `year_scatter_gdp_vs_health.png`, `year_residuals_vs_fitted.png`).

9. **Log the Results:**
   - The results of the regression analyses are logged and saved to a file called `regression_results.log`.

## Outputs

- **Regression Results Log:**
  - The log file `regression_results.log` contains the regression outputs, including coefficients, standard errors, and other regression statistics.

- **Plots:**
  - Scatter plots with regression lines for both simple and multiple regressions.
  - Residuals vs. fitted values plots for both simple and multiple regressions.
  - Country-specific and year-specific scatter plots and residuals vs. fitted values plots.

  All plots are exported as PNG files with appropriate names (e.g., `simple_regression_plot.png`, `multiple_residuals_vs_fitted.png`).

## Requirements

- Stata software
- The dataset `"ECO375"` must be available and contain the following key variables:
  - `gdp_pc_growth` (GDP per capita growth)
  - `per_health` (perceived health status)
  - `cap_prod_growth` (capital productivity growth)
  - `Reference_area` (country/region identifiers)
  - `Time_period` (year)

## How to Use

1. Place the dataset file (`ECO375.dta`) in your working directory.
2. Copy and paste the Stata code into your Stata do-file editor.
3. Run the code in Stata.
4. The results will be displayed in the Stata Results window and logged to the `regression_results.log` file.
5. The scatter plots and residuals plots will be saved as PNG images in your working directory.

## Notes

- Ensure that your Stata session is set to a working directory where the necessary dataset and code files are located.
- You can modify the file paths in the code to adjust the location of the output files (e.g., for saving plots or logs).
- If there are any missing or incomplete data points for specific countries or years, those analyses will be skipped, and a message will be displayed.

## License

This code is for academic and research purposes only. Please credit the original source of the dataset when using this code for your research.
