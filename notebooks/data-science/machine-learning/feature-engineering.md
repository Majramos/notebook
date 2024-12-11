# Feature Engineering

??? note "Work in Progress"

    Please note that the notebook you are referring to is currently a work in progress and may continue to be under development for an extended period. This ongoing process ensures that the content remains up-to-date and relevant, reflecting the latest information and research. As such, some sections may be incomplete or subject to change.


## Types of Missing Data

### Missing completely at random (MCAR)
- situation in which the data is genuinely missing at random and has no relation to any observed or unobserved variables, following no discernable pattern;
- MCAR has mostly been an unrealistic assumption for missingness;
- Assuming MCAR for missing data is not a sensible assumption unless you know the end-to-end data collection process and/or have domain expertise in;

### Missing at random (MAR)
- MAR is a situation in which the missingness of one feature can be explained by other observed features in the dataset;
- Missingness can be accounted for through appropriate statistical methods with reasonable accuracy;
- A common way to determine MAR is by conditioning on another observed features and noticing any increase in the probability of missingness;
- Techinques to fill missing data: [kNN imputation](https://scikit-learn.org/1.5/modules/generated/sklearn.impute.KNNImputer.html), [MissForest](https://pypi.org/project/MissForest/)

### Missing not at random (MNAR)
- missingness is either attributed to the missing value itself or the feature(s) that we didn’t collect data for;
- there is a definite pattern in missing variables;
- collecting more data/features, domain expertise become extremely important to smartly tackle MNAR and improve the data collection process;
