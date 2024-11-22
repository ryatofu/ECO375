
* Load the dataset
use "ECO375", clear

* Descriptive statistics
summarize

* Simple Regression: GDP per capita growth vs. Perceived Health
regress gdp_pc_growth per_health
display "Estimated Coefficient:" _b[per_health]
display "Standard Error:" _se[per_health]

* Scatter plot with regression line for simple regression
scatter gdp_pc_growth per_health || lfit gdp_pc_growth per_health, title("Simple Regression: GDP Growth vs. Perceived Health") legend(off)
graph export "simple_regression_plot.png", replace

* Plot residuals vs. fitted values for simple regression
predict fitted_values_simple, xb
predict residuals_simple, residuals
scatter residuals_simple fitted_values_simple, title("Residuals vs. Fitted Values (Simple Regression)") xlabel(, grid) ylabel(, grid)
graph export "simple_residuals_vs_fitted.png", replace

* Multiple Regression: Including socioeconomic controls
regress gdp_pc_growth per_health cap_prod_growth

* Scatter plot with regression line for multiple regression
scatter gdp_pc_growth per_health || lfit gdp_pc_growth per_health, title("Multiple Regression: GDP Growth vs. Perceived Health") legend(off)
graph export "multiple_regression_plot.png", replace

* Plot residuals vs. fitted values for multiple regression
predict fitted_values_multiple, xb
predict residuals_multiple, residuals
scatter residuals_multiple fitted_values_multiple, title("Residuals vs. Fitted Values (Multiple Regression)") xlabel(, grid) ylabel(, grid)
graph export "multiple_residuals_vs_fitted.png", replace

* Subgroup Analysis by Country (Reference_area)
levelsof Reference_area, local(countries)
foreach country in `countries' {
    * Check if there are any observations for the country
    qui count if Reference_area == "`country'"
    if r(N) > 0 {
        regress gdp_pc_growth per_health cap_prod_growth if Reference_area == "`country'"
        display "Results for Country: `country'"

        * Drop any existing variables before generating new ones
        capture drop fitted_values_country residuals_country

        * Generate fitted values and residuals for the country
        predict fitted_values_country, xb
        predict residuals_country, residuals

        * Scatter plot of GDP growth vs. perceived health for the country
        scatter gdp_pc_growth per_health if Reference_area == "`country'", title("GDP Growth vs. Perceived Health for `country'") xlabel(, grid) ylabel(, grid)
        graph export "`country'_scatter_gdp_vs_health.png", replace

        * Plot residuals vs. fitted values for the country
        scatter residuals_country fitted_values_country, title("Residuals vs. Fitted Values for `country'") xlabel(, grid) ylabel(, grid)
        graph export "`country'_residuals_vs_fitted.png", replace
    }
    else {
        display "No data for `country', skipping analysis."
    }
}

* Subgroup Analysis by Year
levelsof Time_period, local(years)
foreach year in `years' {
    * Check if there are any observations for the year
    qui count if Time_period == "`year'"
    if r(N) > 0 {
        regress gdp_pc_growth per_health cap_prod_growth if Time_period == "`year'"
        display "Results for Year: `year'"

        * Drop any existing variables before generating new ones
        capture drop fitted_values_year residuals_year

        * Generate fitted values and residuals for the year
        predict fitted_values_year, xb
        predict residuals_year, residuals

        * Scatter plot of GDP growth vs. perceived health for the year
        scatter gdp_pc_growth per_health if Time_period == "`year'", title("GDP Growth vs. Perceived Health for Year `year'") xlabel(, grid) ylabel(, grid)
        graph export "`year'_scatter_gdp_vs_health.png", replace

        * Plot residuals vs. fitted values for the year
        scatter residuals_year fitted_values_year, title("Residuals vs. Fitted Values for Year `year'") xlabel(, grid) ylabel(, grid)
        graph export "`year'_residuals_vs_fitted.png", replace
    }
    else {
        display "No data for `year', skipping analysis."
    }
}

* Log the results
log using "regression_results.log", replace

