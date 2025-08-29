# IBM-Telco-Churn-Dash-Regression
A project using IBM's mock telecommunications business data focussed on customer churn. I created a dashboard in Power BI to visualise the datasets and present a the results of a logistic regression model that was created in R.

# Dashboard and Analysis in Power BI 
The overview page was built to give a general look at the churn numbers as well as the financial impacts of customers churning, their satisfaction and location. The dates for churns were randomly generated to give more detailed timeseries analysis as the original data was at the quarter level. This does impact the analysis somewhat as timeseries analysis is more or less useless. This was somewhat of an oversight but did provide opportunity to learn some random generation stuff in R.

The churn risk page gives an overview of the statistics created in the R script. The main graph on this page shows the predicted risk of customers against their CLTV score (Customer Lifetime Value, the higher the score the higher the value) to monitor the most valuable customers for churn risk. A lower, but significant, proportion of high CLTV customers were predicted to churn based on the model.

The services and demographics pages were meant to be able to provide information on a wide range of parameters. Power BI's parameter feature was use to increase the interactivity of this page with a category tree to allow users to explore how different parameters interact with each other.

The County page uses a county selection (counties were matched with ZIP codes provided in the IBM dataset using R and a ZIP to county file) mainly due to the fact my laptop couldn't handle displaying all of the zip codes at once. Selection can be through the county map or a list of the county names and then the individual zip codes will be displayed with their churn ratio as a legend.

Analysis
Using the top variables impacting churn likelihood to monitor those with high CLTV scores would be key in maintaining a manageable churn ratio. Using the regression model on additional data would help improve understanding of the model's performance and allow for monitoring for customers at risk of leaving.

County Page
- LA county has the highest number of churns by a large margin (365 with a ratio of 26.32%) with the next highest being San Diego (138, 29.36%)
- The number of churns generally follows population dynamics
- Del Norte county has the highest churn ratio (50%) but also a low number of churns (8).
Reasons for churns in LA and San Diego: 
- Predictions for LA are less variable than the total dataset having a more even distribution of predicted churn across CLTV. Actual churn ratio was 26.3% slightly below the average (26.5%).
- Based on the regression model, San Diego has a higher proportion of high CLTV customers with a high number of predicted churns and high actual churn ratio (29.4%).
- The number of customers in the predictions for Del Norte were too small to be used (only 2 customers). Looking at the services page shows customers in Del Norte that churned are more likely to be on month-to-month contracts (this follows the general trend) but also that customers using credit cards as payment methods are more likely to churn which goes against the overall trend.

Future Additions
In hindsight I would have developed the dashboard to look more at high CLTV customers with high risk rather than attempting to visualise all of the data provided. I would reduce the number of visuals and focus purely on finding the customers most at risk of high value churn. I spent most of my time developing the regression script and this is partly why the dashboard and actual analysis took a little bit of a backseat.

# Logistic Regression in R
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
