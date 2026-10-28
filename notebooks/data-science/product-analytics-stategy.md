# Product Analytics Stategy

??? note "Work in Progress"

    Please note that the notebook you are referring to is currently a work in progress and may continue to be under development for an extended period. This ongoing process ensures that the content remains up-to-date and relevant, reflecting the latest information and research. As such, some sections may be incomplete or subject to change.

## How should you prioritize metrics?
The most important metrics for a company change over time. You should prioritize metrics based on the product lifecycle stages. The metrics you focus on during each stage should help answer the urgent problems that each stage presents. The tactical problems can vary but will derive from the following high level questions:
- Stage 1 — Introduction: Do we have product-market-fit?
- Stage 2 — Growth: How do we scale effectively?
- Stage 3 — Maturity: How can we be profitable?
- Stage 4 — Decline: How do we maintain user interest and slow decline?

## Stage 1 — Introduction: Do we have product-market-fit?
The primary focus is on achieving product-market-fit. At this stage, product owners must determine whether their product meets a genuine market need and resonates with the target audience. Involves assessing if early adopters are using the product and finding value in it.

Analytics/metrics in this stage:
- **Retention**
	Do users find value in the product?
	Example metrics: D30 Retention, Cohort Retention Curves.

- **Active Users**
	How many users does the product have? Is this increasing?
	Example metrics: Daily Active Users (DAU), Monthly Active Users (MAU), Growth Accounting.

- **Stickiness**
	Is the product engaging and used frequently?
	Example metrics: DAU/MAU, Activity Frequency Histogram (sometimes called L28 Histogram).


There are 5 potential scenarios you will fall into:
- **No long-term retention and low user growth (worst case)**
	In this scenario there is no product-market-fit. Users are not returning to use the product and there is a small market. This requires large changes in the product and/or the target market.

- **No long-term retention but high user growth**
	This is the leaky bucket problem. Users are being acquired, using the product for a short period, but all eventually churn. Focus here is on fixing retention and slowing down growth.

- **Long-term retention but low user growth**
	Focus in this scenario is to either adjust the acquisition funnel to improve user growth or, if the market proves to be small, pivot to a larger market.

- **Long-term retention, high user growth, but low stickiness**
	This is a utility product that users find value in, but are using infrequently. Examples include tax preparation apps, travel websites and event ticketing sites. Focus should be exploring new features that make the product more engaging.

- **Long-term retention, high user growth, and high stickiness (ideal state)**
	Users are returning to the product, using it frequently and the user numbers are growing. This shows product-market-fit.

## Stage 2 — Growth: How do we scale effectively?
Where a product has the potential to move from promising to dominant. In this stage, the key question is: how do we scale effectively while maintaining product quality and user satisfaction?

Analytics/metrics in this stage:
- **User Journey Analysis**
	How do we optimize the user experience?
	Example metrics: Conversion Rate, Time to Convert, Funnels.
	When implementing user journey analysis, less is more. Start with just a beginning and end event — these two events will allow you to calculate a conversion rate and a time to convert. Ensure that events capture user segments such as device, operating system and location

- **Experimentation**
	How can we determine whether a change will positively improve key metrics?
	Example methods: A/B Testing, Multivariate Testing.

- **‘Aha’ Analysis**
	What is the moment that causes a step-change in a users retention and stickiness.
	Example metrics: A combination of user journey analysis, experimentation and product-market-fit metrics.
	
## Stage 3 — Maturity: How can we be profitable?
Focus shifts from rapid growth to optimizing for profitability and long-term sustainability.

Analytics/metrics in this stage:
- **Monetization Metrics**
	How can we be profitable while maintaining a high-quality product and satisfied customer base?
	Example metrics: Customer Acquisition Cost (CAC), Customer Lifetime Value (LTV), LTV:CAC Ratio, Monthly Recurring Revenue (MRR).

## Stage 4 — Decline: How do we maintain user interest and slow decline?
Understand the most engaged users and their characteristics. These users are the highest priority to retain, and have the product-usage behavior that would ideally be shared across all users. Investigate into specific problem areas within a mature product.

Analytics/metrics in this stage:
- **Churn Prediction Modelling**
	Can we identify users likely to churn and intervene?
	Example models: Logistic Regression, Tree Models, Neural Networks.
- **Power User Analysis**
	What can we learn from the most engaged users?
	Example metrics: Stickiness, Feature Usage, Transaction Volume.
- **Root Cause Analysis**
	What are the root cause drivers of key metrics?
	Example analysis: Quarterly Business Reviews, Issue Driver Trees.