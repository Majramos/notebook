# Data Modeling

??? note "Work in Progress"

    Please note that the notebook you are referring to is currently a work in progress and may continue to be under development for an extended period. This ongoing process ensures that the content remains up-to-date and relevant, reflecting the latest information and research. As such, some sections may be incomplete or subject to change.

Data modeling is the process of conceptualizing and visualizing how data will be captured, stored, and used by an organization. The ultimate aim of data modeling is to establish clear data standards for your entire organization.

## Types of Data Models
- **Conceptual Data Model**: These models are designed in an effort to communicate with stakeholders showing relationships between different entities and defining their essential attributes according to the business requirements. It is an abstract version represented by ER or UML diagrams to confirm with the goal and scope of the data project.
- **Logical Data Model**: These models are refined versions of conceptual data models and incorporate the details of cardinality, data types, contraints, validation as proposed by business rules. It can also be defined using ER or UML diagrams.
- **Physical Data Model**: These models are the final version of the logical data model which inlcudes all the technical features and limitations of the storage option you decide upon and is specifically optimized for performance, scalability, security and availability of your data.

## Data modeling techniques
### Dimensional data modeling
Type of data modeling is used for data analytics in data warehouses. Organizing your data into facts (numerical measures of business events - sales, profit) and dimensions (descriptive attributes that provide context about the fact-order, customer).

### Data vault data modeling
Type of data model that enables quick integration of new data sources into existing models. It is an insert only architecture and allows historical record tracking. It consists of 3 components — a hub(a core business entity and unique keys defining it), a link(a relationship between business keys of two or more hubs) and a satellite(houses all contextual data about an entity).

### Graph data modeling
Type of data model made for graph databases that represent data that is the form of networks like social media interactions. It consists of nodes(entities), properties(attributes) and relationships as edges.

## Important data modeling challenges
### Normalization/Denormalization
Normalization is the process of transforming a database to reduce redundancy and increase data integrity and consistency. Apply partitions to a database to make each table simpler with a unique key and clearly defined dependencies to avoid any insert, update or delete errors. Causes poor performance in retrieving queries through complex joins especially with distributed or large databases.

### Slowly changing dimension (SCD)
Dimension that stores and manages both current and previous version over a history of time period in a data warehouse. Types of SCDs:
- Type 1: Update Changes

before
| id  | code | name      | atribute       |
|-----|------|-----------|----------------|
| 123 | abc  | name_code | name_atribute1 |

*after*
| id  | code | name      | atribute       |
|-----|------|-----------|----------------|
| 123 | abc  | name_code | name_atribute2 |

- Type 2: Keep Historical

| id  | code | name      | atribute       | start_date | end_date   |
|-----|------|-----------|----------------|------------|------------|
| 123 | abc  | name_code | name_atribute1 | 01-01-2000 | 31-12-2000 |
| 123 | abc  | name_code | name_atribute2 | 01-01-2001 | null       |

- Type 3: Preserve Limited History

| id  | code | name      | original_attribue | current_attribute | update_date |
|-----|------|-----------|-------------------|-------------------|-------------|
| 123 | abc  | name_code | name_atribute1    | name_atribute2    | 01-01-2001  |

### Change data capture (CDC)
The process of tracking changes in a database and then capturing them in destination systems. It keeps all systems in sync and provides reliable data replication with zero downtime data migrations.
Types of CDCs:
- Log-based;
- Trigger-based;
- Time-bases;

## Types of data models

### Relational
- groups data into tables called “relations” which are organized in rows and columns. Every row or “tuple” contains a series of related data values, and the table name and column names or “attributes” tell us what those values are

#### Components
- Data structure: The set of relations and the set of domains that define how the data can be represented;
- Data manipulation: How you can work with the data in the model to make it easier to read or more structured;
- Data integrity: The rules that define how the data is protected and ensure that stored data is valid;

#### When to use
- data is easily structured into categories, and you can define the relationships between data points
- online transaction processing (OLTP)

#### Advantages
- Increased scalability (add a new column) and efficiency (only store data relevant to the current task)
- Reliability and integrity (enforces rules, primary keys)

#### Disadvantages
- Inflexible (adding a new column to the table may require you to modify multiple other tables)
- Sometimes slow (process multiple SQL queries to retrieve the desired information)
- Complex (complex data relations, use multiple table joins)

### Hierarchical
- organize data into a hierarchy that looks a bit like a family tree. There is a parent record, called a “root node,” with multiple “child nodes” connecting to it through links. There is only one parent node for each child node

#### When to use
- use a hierarchical data model for data that’s already arranged in a parent-child pattern, with a single root point spanning out into multiple branches

#### Advantages
- Easy to understand and use (mirrors the way we organize information in our minds)
- Offers improved performance (users can access related information with a single operation)
- Easy to maintain (all of the data is stored in a single table)
- Simplifies complex information (breaks down complex information into smaller, more manageable piece, easier to work with large amounts of data)
- Supports multiple views of data (supports multiple views of data, provide different users with alternate views of the same information)

#### Disadvantages
- Limited flexibility (A hierarchical data model is fairly rigid, since the data is organized in a strict tree structure. If you want to add or remove data, you may need to rework the entire structure. This can also make it hard to query, since you need to follow the path through the hierarchy to find the desired information)

- Data redundancy (child nodes often contain duplicate copies of the data stored in their parent nodes, inconsistency in the data)

### Network
- organization of data in a more flexible series of relationships, like a hierarchical data model, but child nodes can have multiple parent node

#### When to use
- natural progression from hierarchical models, more flexibility and complexity in the relationships

#### Advantages
- Can represent simple and complex relationships
- Simplified database design and implementation
- More efficient way to query, update and delete data: Any modifications made to the parent data automatically are reflected in the child data, making it quicker to make changes to batches of data. (However, it’s worth bearing in mind that making structural changes to the model is complex. All the data are so interconnected that if you want to modify a set of data, you’ll also have to track down and change all the data that connects to it too.)
- Improved data retrieval performance (multiple pathways through the relationship between the data points(
- Easy to use and understand (allow designers to quickly and simply capture relationships between data points in an intuitive, logical manner)

#### Disadvantages
- Limited scalability (less scalability than other models because the relationships between data elements can become more complex)
- Difficult to query (relationships between data elements are more complex and difficult to understand)
- Lack of flexibility (harder to make changes to the structure without affecting the overall structure of the database)

### Entity-relationship
- captures the relationships between real-world entities much like the network model but it isn’t as directly tied to the physical structure of the database. Instead, it’s often used for designing a database conceptually.

### Multidimensional
- relational model is optimized for online transaction processing (OLTP)

## Database Schemas

### Snowflake Schema
- one fact table that is connected to many dimension tables, which can be connected to other dimension tables through a many-to-one relationship
- normalized to the third normal form, dimension table represents exactly one level in a hierarchy
- more flexibility to accommodate changing data requirements

### inmon dimension modeling technique
- highly normalized structure and closely aligned with the source system
- Denormalization occurs in the Data Marts adhering more to a Snowflake Schema
- creation of a detailed logical model, which then leads to a physically normalized model with minimized data redundancy

### Star Schema
- single, central fact table that is surrounded by dimension tables
- very simple, efficient  and easy to understand, making it ideal for cloud data warehousing and business intelligence applications
- efficient to query than a snowflake schema, because there are fewer JOINs
- require more storage space than a snowflake schema, because of the denormalized data
- more difficult to update and troubleshoot because of the denormalized data
- flexibe, allows your data to be easily sliced and diced
- extensible you may evolve your star schema in response to business changes
- particularly performant on RDBMSes, as most queries end up being executed using the ‘star join’

### kimbal dimension modeling technique
- method designed by Ralph Kimball for effectively organizing analytics tables within a data warehouse and create a single source of truth for a business
- classifies data models into two types of tables: fact tables and dimension tables

#### Kimbal process
- Pick a business process to model
- Decide on the grain
- Chose the dimensions that apply to each fact table row
- Identify the numeric facts that will populate each fact table row

#### Kimbal Slowly Changing Dimensions (SCD)
- Type 1: update the dimension naively
- Type 2: add a new row to your table, with a new key
- Type 3: add a new column to the dimension table to capture the previous value

#### how do you handle SCDs today?
- many modern data warehouses support a table partitioning feature
- use an ETL tool to create and copy new table partitions as a ‘snapshot’ of all the dimensional data, on a daily or weekly basis
- Storage is cheap, Engineering time is expensive, Dimensional data is small and simple when compared to fact data

#### dimension tables (context)
- contain descriptive attributes
- usually wide, flat tables that are also denormalized
- have a single primary key which exists as a foreign key in a fact table

#### facts tables (measurements)
- tables produced by different events that occur within a business
- contain foreign keys that directly relate to the primary key of a dimension table
- avoid numerical aggregates, as these are to be calculated in the business intelligence

##### Transaction Fact Table
- captures specific measurement events at distinct points in space and time. Each row in the table corresponds to a unique transaction and adheres to a granular level of detail

##### Periodic Snapshot Fact Table
- each row provides a summary of multiple measurement events that transpire during a predefined standard period
- may capture aggregated metrics

##### Accumulating Snapshot Fact Table
- each row serves as a summary of measurement events occurring at specific and predictable stages throughout the duration of a process

##### Factless Fact Table
- captures the relationships between dimensions

### Inmon dimension modeling technique
- approach focuses on building a centralized, integrated data warehouse, also known as the Enterprise Warehouse
- highly normalized data structure to eliminate redundancy and ensure data consistency
- Data from various source systems is transformed and integrated before loading it into the data warehouse
- well-suited for large organizations with complex data needs
- requires a substantial investment in ETL processes

### One Big Table (OBT)
- extension of kimball, denormalized table, like found in a data mart
- Simplifies querying by reducing the need for multiple joins.
- Enhances query response time, notably with column encoding and without joins.
- Challenges arise in managing changing dimensions within OBT.
- Decisions between using the latest dimension values or vs. point-in-time values.
- Adding new dimensional attributes requires backfilling

### Data Vault
- Managing numerous disparate data sources
- Accommodating frequent schema changes (DDL) in source OLTP databases
- well-suited to organizations that are adopting the lakehouse paradigm
- combines aspects of both Inmon and Kimball
- Structured, with flexibility for refactoring
- Extremely scalable, up to PBs volumes
- Uses patterns that support ETL code generation
- Familiar architecture: data layers, ETL, star schemas
- uses a hub-and-spoke architecture, separating business keys (hubs), relationships (links), and attributes (satellites)
- stores raw data without much transformation, allowing for easier traceability and auditability
- minimizes the impact on source systems, making it easier to onboard new data sources

### Comparison Summary
- Flexibility: Data Vault > Kimball > Inmon > OBT
- Ease of Use: Kimball > OBT > Data Vault > Inmon
- Data Integration: Inmon > Data Vault > Kimball > OBT
- Implementation Speed: Kimball > OBT > Data Vault > Inmon
- Performance: Kimball > Inmon > Data Vault > OBT

### Use Case Considerations
- Data Vault: Best for environments with complex, evolving data requirements and a need for historical traceability.
- Kimball: Ideal for user-friendly, quick-to-implement solutions focused on specific business processes.
- Inmon: Suitable for enterprise-wide data consistency and integration and have the resources for extensive ETL processes.
- OBT: Useful for simple, small-scale applications where quick access to all data in one place is needed, but not  recommended for large-scale or complex environments.

## Database Design

### Naming Conventions

| Object Type | Convention | Example |
|-------------|------------|---------|
| Tables | Plural, snake_case | users, order_items |
| Columns | Singular, snake_case | first_name, created_at |
| Primary Keys | id or table_id | id, user_id |
| Foreign Keys | referenced_table_singular_id | user_id, order_id |
| Indexes | table_columns_idx | users_email_idx |
| Functions | verb_noun | calculate_total |
