# IBM-Telco-Churn-Dash-Regression
Dashboard visualising IBMs mock churn data, using Logistic Regression in R to understand churn predictors. Using R for visualisations, shapefile changes and regression. Using Power BI to display the information in dashboard format.

Dashboard and Analysis in Power BI
Analysis



Dashboard


Logistic Regression in R
I attempted to find the best predictors for customer churn. Datasets were prepared for binary logistic regression by: 
- Joining datasets containing parameters and removing redundant columns. 
- Multinomial text columns were converted to numeric values.
- Columns with near zero variance were removed
- Correlation between variables was calculated and variables with high correlation were removed
- Data was split 75/25 training/testing.
- Values were scaled to minimise bias

LASSO regularisation was used to prevent overfitting of the model and improve reliability outside of the training data. It was also used for parameter selection, removing any redundant parameters from the model.

Results of LASSO model showed that "Satisfaction Score" has a high negative correlation (-4.52) to a customer churning (as satisfaction score increases the chance of a customer churning decreases) this was the strongest predictive parameter. "Internet type" (-2.11), "Number of Dependents" (-1.07) and "Age" (0.82) were other top factors for correlation.

Predictions were completed on a subset of the original data with an accuracy of 0.8375 and an AUC of 0.906. The threshold for the confusion matrix was adjusted to optimum to reduce false positives and false negatives.

A selection of the results were exported for use in Power BI.
