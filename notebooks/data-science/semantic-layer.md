# Data Semantic Layer

## The Ideal Semantic Layer
- Provides a higher level of abstraction than available with SQL, which saves effort, reduces errors, and enables self-serve interfaces.
- The metrics can be decoupled from dimensions, which can be provided during query time instead of hardcoded during development time.
- New metrics can be composed of existing ones — you build on metrics on top of each other.
- Should be join-aware to be able to work on multiple models instead of only one single model

## Classes of Metrics
- Simple aggregation e.g. sum(revenue), avg(price), count(distinct users)
- Combined aggregation with scalar functions e.g. sum(revenue) — sum(cost)
- Metrics that require joins e.g. sum(sales.revenue * conversion_rates.exchange_rate)
- Metrics with window functions e.g. cumulative sum(sales. revenue) over weeks
- Metrics with multiple levels of details e.g. metrics with dynamic grouping
- Multi-fact metrics e.g. metrics that span fact tables without direct relationships
