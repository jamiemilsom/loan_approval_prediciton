# Loan Approval Prediciton 
## 2024  <img src="readme/Kaggle_logo.png" alt="Kaggle logo" height = "25" style="vertical-align: middle;"/>  Playground Series Competition


This project is my submission for the Kaggle Playground Series: Loan Approval Prediction competition. The goal is to predict whether an applicant will be approved for a loan, using machine learning techniques on a synthetically-generated dataset based on real-world data.

## Project Overview

This project serves two main purposes:
1. To maintain and enhance my machine learning skills through practical application.
2. To deepen my understanding of financial concepts related to loan approval processes.

## Competition Details

- **Start Date:** October 1, 2024
- **Final Submission Deadline:** October 31, 2024
- **Evaluation Metric:** Area Under the ROC Curve (AUC-ROC)

## Technical Approach

The project utilises several key machine learning techniques:

1. **Feature Engineering:** Custom features are created to capture complex relationships in the data.
2. **Principal Component Analysis (PCA):** Used for dimensionality reduction and feature analysis.
3. **XGBoost:** A gradient boosting framework known for its performance and speed.



## Setup and Installation

1. Clone the repository:
   ```
   git clone https://github.com/jamiemilsom/loan_approval_prediction.git
   ```
2. Install the required packages:
   ```
   pip install -r requirements.txt
   ```
3. To use the sql database to combine more datasets edit the sql setup file and run:
   ``` 
   cd data
   sqlite3 loan_approval.db < database_setup.sql
   ```

## Key Features

- Comprehensive feature engineering pipeline
- XGBoost model with hyperparameter tuning
- PCA for feature importance analysis
- Efforts to gain Model interpretibility

## Results
currently at 0.958 CV score and 0.96006 public score
(To be updated as the competition progresses)

## Future Work

- Experiment with ensemble methods
- Explore deep learning approaches
- Incorporate external financial datasets for enhanced predictions

## Contributing

While this is primarily a personal project for the Kaggle competition, suggestions and discussions are welcome. Feel free to open an issue or submit a pull request if you want to collaborate.

## License

This project is open-source and available under the MIT License.

## Acknowledgements

- Kaggle for hosting the Playground Series and providing such an interesting dataset.
- The open-source community for the tools and libraries used in this project