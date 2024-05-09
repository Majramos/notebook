# Problem to Approach

## Data Science Methodology Overview

### Addressing data science chanllenges
Data science is an influential domain that combined statistical analysis, technological expertise, and domain knowledge to extract valuable insights from extensive data sets. However, despite the recent increase in computing power and easier access to data, we often don't understand the questions being asked or know how to apply the data correctly to address the problem at hand. Using a methodology helps resolve those issues.

### What is a methodology?
A methodology is a system of methods used in a particular area of study.
A methodology is a guideline for the decisions researchers must make during the scientific process.
In the context of data science, data science methodology is a structured approach that guides data scientists and solving complex problems and making data-driven decisions.

### Applying data science methodology
Data science methodology also includes data collection forms, measurement strategies, and comparisons of data analysis methods relative to different research goals and situations.

### Addressing data science challenges
Using a methodology provides the practical guidance needed to conduct scientific research efficiently. There's often a temptation to bypass methodology and jump directly to solutions. However, jumping to solutions hinders our best intentions for solving problems. Next, let's explore methodology as it relates to data science.

### Data Science Methodoloy by John Rollins
The data science methodology discussed in this course is a methodology outlined by John Rollins, a seasoned IBM Senior Data Scientist. This course is built on his professional experience and insights into the importance of following a methodology for successful data science outcomes.

### Data Methodology stages
As a general methodology, data science methodology consists of the following 10 stages. Business understanding, analytic approach, data requirements, data collection, data understanding, data preparation, modeling, evaluation, deployment, and feedback.
Asking questions is the cornerstone of success in data science. Questions drive every stage of data science methodology. Data science methodology aims to answer the following 10 basic questions which align with the data methodology questions.

These first two questions help you define the issue and determine what approach to use.
- You'll ask, what is the problem that you're trying to solve? (Business understanding)
- How can you use data to answer the question? (analytic approach)

You'll use the next four questions to help you get organized around the data. 
- what data do you need to answer the question? (data requirements)
- where's the data source from? (data requirements)
- how will you receive the data? (data collection)
- Does the data you collect represent the problem to be solved? (data understanding)
- what additional work is required to manipulate and work with the data? (data preparation)

Then you'll use these final four questions to validate your approach and final design for ongoing analysis.
- when you apply data visualizations, do you see answers that address the business problem? (modeling)
- Does the data model answer the initial business question or must you adjust the data? (evaluation)
- Can you put the model into practice? (deployment)
- Can you get constructive feedback from the data and the stakeholder to answer the business question? (feedback)


## Business understanding

### The importance of questions
Has this ever happened to you? You've been called into a meeting by your boss, who makes you aware of an important task one with a very tight deadline that absolutely has to be met. You both go back and forth to ensure that all aspects of the task have been considered and the meeting ends with both of you confident that things are on track.
Later that afternoon, however, after you've spent some time examining the various issues at play, you realize that you need to ask several additional questions in order to truly accomplish the task. Unfortunately, the boss won't be available again until tomorrow morning. Now, with the tight deadline still ringing in your ears, you start feeling a sense of uneasiness. So, what do you do? Do you risk moving forward or do you stop and seek clarification.

### From understanding to approach
Data science methodology begins with spending the time to seek clarification, to attain what can be referred to as a business understanding. Having this understanding is placed at the beginning of the methodology because getting clarity around the problem to be solved, allows you to determine which data will be used to answer the core question. Rollins suggests that having a clearly defined question is vital because it ultimately directs the analytic approach that will be needed to address the question. All too often, much effort is put into answering what people THINK is the question, and while the methods used to address that question might be sound, they don't help to solve the actual problem. 

### What's the goal?
Establishing a clearly defined question starts with understanding the GOAL of the person who is asking the question. For example, if a business owner asks: "How can we reduce the costs of performing an activity?" We need to understand, is the goal to improve the efficiency of the activity? Or is it to increase the businesses profitability? Once the goal is clarified, the next piece of the puzzle is to figure out the objectives that are in support of the goal.
By breaking down the objectives, structured discussions can take place where priorities can be identified in a way that can lead to organizing and planning on how to tackle the problem.

### Getting stakeholder buy-in and support
Depending on the problem, different stakeholders will need to be engaged in the discussion to help determine requirements and clarify questions.

### Case study
In the case study, the question being asked is: What is the best way to allocate the limited healthcare budget to maximize its use in providing quality care? This question is one that became a hot topic for an American healthcare insurance provider. As public funding for readmissions was decreasing, this insurance company was at risk of having to make up for the cost difference,which could potentially increase rates for its customers. Knowing that raising insurance rates was not going to be a popular move, the insurance company sat down with the health care authorities in its region and brought in IBM data scientists to see how data science could be applied to the question at hand.

#### Goals & Objectives
Before even starting to collect data, the goals and objectives needed to be defined. After spending time to determine the goals and objectives, the team prioritized "patient readmissions" as an effective area for review.

With the goals and objectives in mind, it was found that approximately 30% of individuals who finish rehab treatment would be readmitted to a rehab center within one year; and that 50% would be readmitted within five years. After reviewing some records, it was discovered that the patients with congestive heart failure were at the top of the readmission list. It was further determined that a decision-tree model could be applied to review this scenario, to determine why this was occurring.

To gain the business understanding that would guide the analytics team in formulating and performing their first project, the IBM Data scientists, proposed and delivered an on-site workshop to kick things off. The key business sponsors involvement throughout the project was critical, in that the sponsor: 
- Set overall direction
- Remained engaged and provided guidance.
- Ensured necessary support, where needed. 

Finally, four business requirements were identified for whatever model would be built. Namely: Predicting readmission outcomes for those patients with Congestive Heart Failure Predicting readmission risk. Understanding the combination of events that led to the predicted outcome Applying an easy-to-understand process to new patients, regarding their readmission risk.

## Analytic Approach

### Which analytic approach to pick?
Selecting the right analytic approach depends on the question being asked. The approach involves seeking clarification from the person who is asking the question, so as to be able to pick the most appropriate path or approach.

### From understanding to approach
Once the problem to be addressed is defined, the appropriate analytic approach for the problem is selected in the context of the business requirements. This is the second stage of the data science methodology. 

### Pick Analytic approach
Once a strong understanding of the question is established, the analytic approach can be selected. This means identifying what type of patterns will be needed to address the question most effectively.

### What are types of questions?
If the question is to determine probabilities of an action, then a predictive model might be used. If the question is to show relationships, a descriptive approach maybe be required. This would be one that would look at clusters of similar activities based on events and preferences. Statistical analysis applies to problems that require counts. For example if the question requires a yes/ no answer, then a classification approach to predicting a response would be suitable.

### Which machine learning will be utilized?
Machine Learning is a field of study that gives computers the ability to learn without being explicitly programmed. Machine Learning can be used to identify relationships and trends in data that might otherwise not be accessible or identified. In the case where the question is to learn about human behaviour, then an appropriate response would be to use Clustering Association approaches. 

### Case study
For the case study, a decision tree classification model was used to identify the combination of conditions leading to each patient's outcome. In this approach, examining the variables in each of the nodes along each path to a leaf, led to a respective threshold value. This means the decision tree classifier provides both the predicted outcome, as well as the likelihood of that outcome, based on the proportion at the dominant outcome, yes or no, in each group. From this information, the analysts can obtain the readmission risk, or the likelihood of a yes for each patient. If the dominant outcome is yes, then the risk is simply the proportion of yes patients in the leaf. If it is no, then the risk is 1 minus the proportion of no patients in the leaf.

A decision tree classification model is easy for non-data scientists to understand and apply, to score new patients for their risk of readmission. Clinicians can readily see what conditions are causing a patient to be scored as high-risk and multiple models can be built and applied at various points during hospital stay. This gives a moving picture of the patient's risk and how it is evolving with the various treatments being applied. For these reasons, the decision tree classification approach was chosen for building the Congestive Heart Failure readmission model.


## Lesson Summary

### Business Understanding
- Understanding the question
Data science methodology begins with seeking clarification and attaining a business understanding

```
|      Define        |       Understand    |      Objectives      |      Engagement       |
|         1          |           2         |          3           |          4            |
| Clearly defining   | Understanding the   | Objectives that      | Engagement of         |
| the question is    | goal of the person  | support the goal     | different             |
| vital as it guides | asking the question | should be identified | stakeholders is vital |
| the analytic       | is crucial in       | to prioritize and    | to determine          |
| approach           | establishing a      | plan for problem     | requirements and      |
					 | clearly defined     | solving              | clarify questions     |
					 | question            |
```

### Analytic Approach
- Determine appropriate Approach
The second stage of the data science methodology involves selecting the analytic approach in the context of business requirements

```
|      Pattern      |         Approach      |     Question Types     |     Machine Learning      |
|         1         |             2         |            3           |             4             |
| Identifying what  | Different types of    | Descriptive:           | Machine Learning          |
| type of patterns  | patterns and          |   Current Status       | enables computers to      |
| will be needed to | relationships in data | Diagnostic:            | learn without explicit    |
| address the       | require different     |   Statistical Analysis | programming and           |
| question most     | approaches to         | Predictive:            | identify patterns in data |
| effectively       | effectively address   |   Forecasting          | that might otherwise not  |
					| the questions being   | Prescriptive:          | be accessible             |
					| asked                 |   Recommendations      |
```
