# Machine Learning

??? note "Work in Progress"

    Please note that the notebook you are referring to is currently a work in progress and may continue to be under development for an extended period. This ongoing process ensures that the content remains up-to-date and relevant, reflecting the latest information and research. As such, some sections may be incomplete or subject to change.


## Model Inferencing
model inference is the process of operationalizing a trained machine learning model

### Batch inferencing (offline)
- generates model predictions on a batch of observations.
- high data volumes when processing efficiency is required but response speed is not a top priority
- typically generated on some recurring schedule
- if you don't need an immediate response to a model prediction
- ideal for scenarios where latency is not a concern.
- useful for tasks like data preprocessing, recommendations, and large-scale data analysis
- infrastructure requirements for batch inference are still simpler than those for online inference
- predictions generated during batch inference can also be analyzed and post processed before being seen by stakeholders

### Real-time inferencing (online, dynamic inference)
- predictions are generated on a single observation of data at runtime
- ideal for inference workloads where you have real-time, interactive, low latency requirements
- involves sending individual data points to the deployed model and receiving predictions in real-time. 
- This is suitable for applications that require immediate responses, such as chatbots, fraud detection, and image recognition.
- more complex because of the added tooling and systems required to meet latency requirements
- system needs to retrieve any necessary data to generate predictions, perform inference, validate the model output, return the results over a network

#### Challenges of Online Inference
- process for retreiving features necessary for predictions (need cache data/features)
- machine learning algorithm (may require simpler models)
- model outputs (policy layer that acts as a safeguard)
- web technologies (basic understanding of REST / HTTP / client-server network model)

#### Data Drift
**Data drift** occurs when the statistical properties of the input data change over time. This can happen due to various reasons, such as changes in user behavior, market conditions, or external factors. There are two main types of data drift:
- **Covariate Drift**: Changes in the distribution of the input features (independent variables) while the relationship between the input and output remains the same.
- **Prior Probability Shift**: Changes in the distribution of the target variable (dependent variable) while the relationship between the input and output remains the same.

##### Data Drift Detection
1. **Statistical Tests**: Use statistical tests like the Kolmogorov-Smirnov test, Chi-Square test, or the Jensen-Shannon divergence to compare the distributions of the current and historical data.
2. **Visualization**: Plot histograms, box plots, or scatter plots to visually inspect changes in data distributions over time.
3. **Monitoring Metrics**: Track metrics such as mean, variance, and correlation of features over time to identify significant changes.

##### Handling Data Drift
1. **Retraining**: Regularly retrain the model with the latest data to ensure it adapts to changes in data distribution.
2. **Feature Engineering**: Update or create new features that better capture the current data patterns.
3. **Data Augmentation**: Use techniques like oversampling or undersampling to balance the data distribution.

#### Model Drift
**Model drift**, also known as concept drift, happens when the relationship between the input data and the target variable changes over time. This means that the model's assumptions about the data no longer hold true, leading to a decrease in model performance. Model drift can be caused by:
- **Real Concept Drift**: The actual underlying relationship between input and output changes.
- **Virtual Concept Drift**: The distribution of the input data changes, but the relationship between input and output remains the same.

##### Model Drift Detection
1. **Performance Monitoring**: Continuously monitor model performance metrics like accuracy, precision, recall, and F1 score. A significant drop in these metrics can indicate model drift.
2. **Error Analysis**: Analyze the distribution of prediction errors. An increase in errors or a change in error patterns can signal model drift.
3. **Drift Detection Algorithms**: Implement algorithms like the Page-Hinkley test, ADWIN (Adaptive Windowing), or DDM (Drift Detection Method) to automatically detect changes in the data or model performance.

##### Handling Model Drift
1. **Incremental Learning**: Use algorithms that support incremental learning, allowing the model to update itself with new data without a complete retraining.
2. **Ensemble Methods**: Combine predictions from multiple models trained on different data subsets to improve robustness against drift.
3. **Model Monitoring**: Set up automated monitoring and alerting systems to detect and respond to drift in real-time.

#### Key Differences Data vs Model Drift
- **Nature of Change**: Data drift involves changes in the input data distribution, while model drift involves changes in the relationship between input and output.
- **Impact on Model**: Data drift can lead to model drift if the model is not retrained with the new data. Model drift directly affects the model's accuracy and performance.

#### Example Data vs Model Drift
Imagine a model predicting customer churn for a telecom company:
- **Data Drift**: If the demographics of the customer base change (e.g., more younger customers), the input data distribution changes.
- **Model Drift**: If the reasons for customer churn change (e.g., customers now leave due to poor customer service instead of high prices), the relationship between input features and churn changes.

### Example Workflow Data vs Model Drift
1. **Monitor**: Continuously monitor data and model performance metrics.
2. **Detect**: Use statistical tests and drift detection algorithms to identify drifts.
3. **Respond**: Retrain the model, update features, or implement incremental learning as needed.
