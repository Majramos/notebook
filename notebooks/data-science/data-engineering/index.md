# Data Engineering

??? note "Work in Progress"

    Please note that the notebook you are referring to is currently a work in progress and may continue to be under development for an extended period. This ongoing process ensures that the content remains up-to-date and relevant, reflecting the latest information and research. As such, some sections may be incomplete or subject to change.

## Types Databases

### SQL (Structured data) / Relational databases
- ability to maintain data integrity, data is consistent and accurate by enforcing constraints such as primary keys, foreign keys, and unique constraints
- allow businesses to conduct workloads that require specificity and accuracy
- rigid structure that can make it difficult to accommodate changes to the data schema
- vertical scalling

### NoSQL / Non-relational databases
- ability to handle large volumes of data and high traffic loads efficiently
- do not enforce constraints or rules on the data, which can lead to inconsistent data, incorrect insights, and bad decisions
- lack the standard and well-defined structure of relational databases, which can make it difficult to perform complex queries and transactions
- horizontal scaling
- store user-generated content

## Types Data Storages

### data lake
is a data repository that can store large amounts of structured, semi-structured, and unstructured data in their native format

### data warehouse
is a central repository of data integrated from multiple sources. Data warehouses serve as the single source of truth—storing current and historical data that has been cleansed, conformed, and categorized

### data mart
is a sub-section of the data warehouse, built specifically for a particular business function, purpose, or community of users

### data lakehouse (new platform)
store and query both structured and unstructured data in one platform
- Easier administration (doesn't require you to manage separate databases for different types of data)
- Reduced costs for data storage (reduces costs by storing data in its native format)

### data mesh (new culture)
- keep data in your source systems, access it in real time, and connect it across different systems
- breaking up monolithic services into independent microservices
- creating API integrations between these different microservices
- high-code approach requiring developer expertise and time
- API integrations are distributed across systems, so you only see the patterns people have already created with the data mesh

### data fabric (new architecture)
- data mesh with a virtualization layer / logical data warehouse


## OLAP vs OLTP
- the two primary data processing systems used in data science.
- database management systems for storing and processing data in large volumes

### OLTP
- Online Transaction Processing
- process database transactions, process orders, update inventory, and manage customer accounts
- unidimensional and focus on one data aspect.
- prioritizes data write operations, for write-heavy workloads and can update high-frequency, high-volume transactional data without compromising data integrity
- databases manage database updates in real time
- compute requirements are high, storage not so much since data can then ve loaded into a OLAP data warehouse

### OLAP
- Online Analytical Processing
- analyze aggregated data generate reports, perform complex data analysis, and identify trends
- multidimensional data models, cube format
- prioritizes data read over data write operations, efficiently perform complex queries on large volumes of data
- periodically process data in large batches then upload the batch to the system all at once
- high storage requirements, data reads can also be compute-intensive

### Normalization in OLTP and OLAP
- OLTP, where data is both read and written frequently, you typically normalize the data to 3NF.
- In analytical OLAP systems, where users primarily read data, databases prioritize read performance over write integrity. Hence, the data may have undergone some denormalization

## Types of SQL Statements (DDL vs. DML)
- **Data Definition Language (or DDL)** statements are used to define, change, or drop database objects such as tables.
- **Data Manipulation Language (or DML)** statements are used to read and modify data in tables. **CRUD** operations.
