# Model Deployment, Feedback and Evaluation

## Deployment

### Are stackholders familiar with the new tool?
While a data science model will provide an answer, the key to making the answer relevant and useful to address the initial question, involves getting the stakeholders familiar with the tool produced.
In a business scenario, stakeholders have different specialties that will help make this happen, such as the solution owner, marketing, application developers, and IT administration.

Once the model is evaluated and the data scientist is confident it will work, it is deployed and put to the ultimate test. Depending on the purpose of the model, it may be rolled out to a limited group of users or in a test environment, to build up confidence in applying the outcome for use across the board.

### Case study
In preparation for solution deployment, the next step was to assimilate the knowledge for the business group who would be designing and managing the intervention program to reduce readmission risk. In this scenario, the business people translated the model results so that the clinical staff could understand how to identify high-risk patients and design suitable intervention actions. The goal, of course, was to reduce the likelihood that these patients would be readmitted within 30 days after discharge.

During the business requirements stage, the Intervention Program Director and her team had wanted an application that would provide automated, near real-time risk assessments of congestive heart failure. It also had to be easy for clinical staff to use, and preferably through browser-based application on a tablet, that each staff member could carry around. This patient data was generated throughout the hospital stay. It would be automatically prepared in a format needed by the model and each patient would be scored near the time of discharge. Clinicians would then have the most up-to-date risk assessment for each patient, helping them to select which patients to target for intervention after discharge.

As part of solution deployment, the Intervention team would develop and deliver training for the clinical staff. Also, processes for tracking and monitoring patients receiving the intervention would have to be developed in collaboration with IT developers and database administrators, so that the results could go through the feedback stage and the model could be refined over time. 

Example of a solution deployed through a Cognos application. In this case, the case study was hospitalization risk for patients with juvenile diabetes. Like the congestive heart failure use case, this one used decision tree classification to create a risk model that would serve as the foundation for this application. The map gives an overview of hospitalization risk nationwide, with an interactive analysis of predicted risk by a variety of patient conditions and other characteristics. This slide shows an interactive summary report of risk by patient population within a given node of the model, so that clinicians could understand the combination of conditions for this subgroup of patients. And this report gives a detailed summary on an individual patient, including the patient's predicted risk and details about the clinical history, giving a concise summary for the doctor.

## Feedback

### Problem solved?
Once in play, feedback from the users will help to refine the model and assess it for performance and impact. The value of the model will be dependent on successfully incorporating feedback and making adjustments for as long as the solution is required.

Throughout the Data Science Methodology, each step sets the stage for the next. Making the methodology cyclical, ensures refinement at each stage in the game. The feedback process is rooted in the notion that, the more you know, the more that you'll want to know. That's the way John Rollins sees it and hopefully you do too.

Once the model is evaluated and the data scientist is confident it'll work, it is deployed and put to the ultimate test: actual, real-time use in the field. 

### Case study
The plan for the feedback stage included these steps:
- First, the review process would be defined and put into place, with overall responsibility for measuring the results of a "flying to risk" model of the congestive heart failure risk population. Clinical management executives would have overall responsibility for the review process.
- Second, congestive heart failure patients receiving intervention would be tracked and their re-admission outcomes recorded.
- Third, the intervention would then be measured to determine how effective it was in reducing re-admissions. For ethical reasons, congestive heart failure patients would not be split into controlled and treatment groups. Instead, readmission rates would be compared before and after the implementation of the model to measure its impact.

After the deployment and feedback stages, the impact of the intervention program on re-admission rates would be reviewed after the first year of its implementation. Then the model would be refined, based on all of the data compiled after model implementation and the knowledge gained throughout these stages. Other refinements included: 
- Incorporating information about participation in the intervention program,
- possibly refining the model to incorporate detailed pharmaceutical data.
If you recall, data collection was initially deferred because the pharmaceutical data was not readily available at the time. But after feedback and practical experience with the model, it might be determined that adding that data could be worth the investment of effort and time. We also have to allow for the possibility that other refinements might present themselves during the feedback stage. Also, the intervention actions and processes would be reviewed and very likely refined as well, based on the experience and knowledge gained through initial deployment and feedback. Finally, the refined model and intervention actions would be redeployed, with the feedback process continued throughout the life of the Intervention program.

## Storytelling (talks)

The role of storytelling in a data analyst's life cannot be overstated. It's supercritical to get really good at storytelling with data. I think humans naturally understand the world through stories. If you're trying to convince anyone to do anything with data, the first thing you have to do is tell a clear, a concise, compelling story. I also think it can be really useful for the data analyst to develop a story anytime they're working with a dataset to help themselves better understand the underlying dataset and what it's doing. There's always going to be a **balance** between telling a clear, coherent, simple story, and making sure you're conveying all the complexities that you might find within the data. I think finding that balance can be really challenging, but it is really critical.

The art of storytelling is significant in the life of a data analyst. It doesn't matter how much or what wonderful information you've come up with. If you can't find a way to communicate that to your audience, whether it's the consumer or a director level or executive level person, then it's for naught. You have to find a way to communicate that and it's usually best to do it in a visual or through telling a story, so that they understand how that information can be useful.

I have to say storytelling is essential skill set. It's like the last mile in delivery. A lot of people can handle the technical side through a short period of training. However, the ability to extract value from data and to communicate it is in short supply. If you think about a long-term career, I think it's very critical to know how to tell a compelling story with data.

Storytelling is absolutely crucial to data and analytics. This is how you actually convey your message. Everyone can show numbers, but if you don't have a story around, if you don't have a compelling reason to act, then ultimately what you're presenting isn't going to resonate with your audience. They did a study at Stanford where they had people present their pitches and in that pitch they had simply KPIs, numbers statistics but they also told the story. The audience members were then quizzed after the fact, what they remembered from each of those presentations, and it was those stories that stuck with them. Yes, there were still facts and figures contained within the story, but that is the way that you drive it home. Having that emotional connection to the story, to the understanding, to the data is really how you're going to get people to take the action that you want and need them to take.

## Lesson Summary

### From Deployment to Feedback
- Real-world deployment, feedback and redeployment
Maximizing data science impact through stakeholder engagement and iterative refinement

```
| Stakeholder Engagement  | Deployment & Feedback  |   Iterative Process      | Improvement and Redeployment |
|            1            |            2           |            3             |               4              |
| Making the answer       | Deploy the evaluated   | The cyclical Methodology | Integrate feedback           |
| relevant and useful     | model with data        | refines each stage.      | insights to refine model     |
| involve engaging        | scientist's confidence | Feedback spurs           | and interventions.           |
| stakeholders.           | for real-time          | continuous learning and  | Redeploy refined model       |
| Stakeholders include    | functionality testing. | enhancement. Refinement  | and actions. Loop ensures    |
| solution owners         | User feedback is       | relies on post-          | ongoing improvement          |
| marketing, IT admins,   | critical for refining  | implementation data and  | and impact assessment,       |
| developers. Diverse     | evaluating, and        | knowledge. Further       | especially. Include ethical  |
| specialties ensure      | enhancing model        | improvements can arise   | considerations.              |
| model's applicability   | performance.           | from feedback            |                              |
```

## CRISP-DM
CRISP-DM, which stands for Cross-Industry Standard Process for Data Mining, is an industry-proven way to guide your data mining efforts. CRISP-DM is an iterative data mining mode and is a comprehensive methodology for data mining projects which provides a structured approach to guide data-driven decision making. As a data methodology, a study of the CRISP-DM model includes six data mining stages, their descriptions and provides explanations of the relationships between tasks and stages. And as a process model, CRISP-DM provides high-level insights into the data mining cycle. Like other data mining science methodologies, CRISP-DM requires flexibility at each stage, and communication with peers, management, and stakeholders to keep the project on track. After any of the following six stages, data scientists might need to revisit an earlier stage and make changes. 

The business understanding stage is the most important because this stage sets and outlines the intentions of the data analysis project. This stage is common to both John Rollins data science methodology, and CRISP-DM methodology. This stage requires communication and clarity to overcome stakeholders'differing objectives, biases, and information related modalities. Without a clear concise and complete understanding of the business problem and project goals, the project effort will waste time and resources.

CRISP-DM combines the stages of data requirements, data collection, and data understanding from Johns Rollins methodology outline into a single data understanding stage. During this stage, data scientists decide on data sources and acquire data. Next during the data preparation stage, data scientists transform the collected data into a usable data subset and determine if they need more data. With data collection complete, data scientists select a dataset and address questionable missing or ambiguous data values. 

Data preparation is common to foundational data methodology in CRISP-DM.

The modeling stage fulfills the purpose of data mining and creates data models that reveal patterns and structures within the data. These patterns and structures provide knowledge and insights that address the stated business problem and goals. Data scientists select models based on subsets of the data and adjust the models as needed. Model selection is an art and science. Both foundational methodology and CRISP-DM focus on creating knowledge information that has meaning and utility.

During the evaluation stage, data scientists test the selected model. Data scientists usually prepare a pre-selected test to run the trained model. The test platform sees the data as new and data scientists then assess the model's effectiveness. These testing results determine the model's efficacy and foreshadow the model's role in the next and final stage.

Finally, during the deployment stage, data scientists and stakeholders use the model on new data outside of the scope of the dataset. New interactions during this stage might reveal the new variables and need for a different dataset and model. Remember that the CRISP-DM model is iterative and cyclical, deployment results might initiate revisions to the business needs and actions, the model and data, or any combination of these items.

After completing all six stages, you'll have another business understanding meeting with the stakeholders to discuss the results. In CRISP-DM, the stage is not named. However, in John Rollins Data Science methodology model, the stage is explicitly named the Feedback stage. You'll continue the CRISP-DM process stages until the stakeholders, management, and you agree that the data model and its analysis provide the stakeholder with the answers they need to resolve their business problems and attain their business goals.
