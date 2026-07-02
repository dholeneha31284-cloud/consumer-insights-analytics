Sprint 8 – Decision Tree Classification
1. Sprint Objective

The objective of this sprint is to build a Decision Tree Classification model that predicts whether a customer belongs to the High Satisfaction or Low Satisfaction category.

Decision Trees are one of the most widely used supervised machine learning algorithms because they are simple to understand, easy to interpret, and provide clear business rules for decision-making.

At the end of this sprint, we will be able to:

Understand Classification Problems
Build a Decision Tree Model
Create a Binary Target Variable
Train and Test the Model
Evaluate Model Performance
Interpret Feature Importance
Generate Business Recommendations
2. What is Classification?

Classification is a supervised machine learning technique used to predict categorical outcomes.

Unlike Regression, which predicts numerical values, Classification predicts predefined categories.

Examples:

Spam or Not Spam
Fraud or Not Fraud
Customer Churn or Not Churn
High Satisfaction or Low Satisfaction

In this project, customers are classified into:

High Satisfaction
Low Satisfaction
3. Business Problem

A retail company wants to identify customers who are likely to have high customer satisfaction.

Business Questions:

Which customers are highly satisfied?
Which factors influence satisfaction the most?
Which customers require immediate attention?
How can marketing improve customer experience?

Instead of predicting the exact satisfaction score, the business needs a classification model for quick decision-making.

4. Supervised Machine Learning

Decision Trees belong to Supervised Learning.

In supervised learning:

Input variables (Features) are available.
Output variable (Target) is known.
The algorithm learns from historical data.
The trained model predicts outcomes for new data.
5. Target Variable

The original Customer Satisfaction score is converted into a binary target.

Example:

Customer Satisfaction	Target
4 or 5	High Satisfaction (1)
Below 4	Low Satisfaction (0)

This conversion allows us to solve the problem as a classification task.

6. Predictor Variables

The following variables are used to predict customer satisfaction:

Age
Product Quality
Service Quality
Value for Money

These variables represent customer demographics and perceptions of the company's products and services.

7. What is a Decision Tree?

A Decision Tree is a flowchart-like model that repeatedly splits data into smaller groups based on feature values.

Each decision node asks a question.

Example:

Is Product Quality ≥ 4?

Yes

↓

Next Question

No

↓

Low Satisfaction

The process continues until a final prediction is reached.

8. Why Decision Trees?

Decision Trees are popular because they:

Are easy to understand.
Produce interpretable business rules.
Handle both numerical and categorical variables.
Require minimal data preprocessing.
Provide feature importance automatically.
9. Decision Tree Components
Root Node

The first and most important split.

Decision Node

Represents a condition on one feature.

Leaf Node

Represents the final prediction.

Branch

Represents the outcome of a decision.

10. Model Training

The Decision Tree algorithm learns from historical customer data by identifying the best feature splits.

The objective is to maximize the separation between High Satisfaction and Low Satisfaction customers.

The model is trained using:

Training Dataset
Predictor Variables
Binary Target Variable
11. Train-Test Split

The dataset is divided into:

Training Data (80%)
Testing Data (20%)

Training data is used to build the model.

Testing data is used to evaluate model performance on unseen customers.

12. Model Prediction

After training, the model predicts whether each customer belongs to:

High Satisfaction
Low Satisfaction

These predictions are compared with actual customer data.

13. Model Evaluation

Several evaluation metrics are used.

Accuracy

Accuracy measures the percentage of correctly classified customers.

Higher accuracy indicates better performance.

Confusion Matrix

The Confusion Matrix summarizes prediction results.

It contains:

True Positive (TP)
True Negative (TN)
False Positive (FP)
False Negative (FN)

This helps understand where the model makes mistakes.

Precision

Precision measures how many customers predicted as High Satisfaction are actually highly satisfied.

Higher Precision reduces false alarms.

Recall

Recall measures how many actual High Satisfaction customers are correctly identified.

Higher Recall ensures fewer satisfied customers are missed.

F1 Score

The F1 Score balances Precision and Recall.

It is particularly useful when classes are imbalanced.

14. Feature Importance

Decision Trees calculate Feature Importance automatically.

Feature Importance indicates how much each predictor contributes to classification.

Example:

Feature	Importance
Product Quality	0.42
Service Quality	0.31
Value for Money	0.18
Age	0.09

Higher importance indicates greater influence on customer satisfaction.

15. Decision Tree Visualization

The Decision Tree diagram shows how the model makes decisions.

Each node contains:

Splitting Feature
Threshold Value
Number of Samples
Predicted Class

Business users can easily understand these decision rules.

16. Business Insights

The Decision Tree model helps organizations:

Identify the most important drivers of customer satisfaction.
Predict customer satisfaction categories.
Detect customers at risk of low satisfaction.
Prioritize improvement initiatives.
Support proactive customer engagement.
17. Business Recommendations

Based on the Decision Tree model:

Improve Product Quality if it is the most influential feature.
Strengthen Service Quality through employee training.
Increase perceived Value for Money using pricing strategies and promotional offers.
Monitor customers predicted as Low Satisfaction and implement retention campaigns.
Use the model to classify new survey responses and provide proactive customer support.
18. Advantages of Decision Trees
Easy to understand and interpret.
Works with numerical and categorical data.
Minimal preprocessing required.
Automatically identifies important variables.
Produces visual decision rules.
Suitable for business decision-making.
19. Limitations of Decision Trees
Can overfit training data.
Sensitive to small changes in data.
Lower accuracy compared to ensemble models in some cases.
Requires pruning or depth control for better generalization.
20. Sprint Summary

During Sprint 8, a Decision Tree Classification model was developed to classify customers into High Satisfaction and Low Satisfaction groups.

The following concepts were covered:

Classification
Supervised Machine Learning
Binary Target Variable
Decision Tree Algorithm
Train-Test Split
Model Training
Prediction
Accuracy
Confusion Matrix
Precision
Recall
F1 Score
Feature Importance
Decision Tree Visualization
Business Interpretation
Business Recommendations

By completing this sprint, the project advances from customer segmentation to predictive classification. The Decision Tree model enables businesses to identify satisfied and dissatisfied customers, understand the factors driving customer satisfaction, and implement targeted actions to improve customer experience and retention.