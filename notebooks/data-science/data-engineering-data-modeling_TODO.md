# Data Engineering: data modeling

## What is Data Modeling?
Data modeling is the process of conceptualizing and visualizing how data will be captured, stored, and used by an organization. The ultimate aim of data modeling is to establish clear data standards for your entire organization.

## Types of Data Models

### Conceptual Data Model:
These models are designed in an effort to communicate with stakeholders showing relationships between different entities and defining their essential attributes according to the business requirements. It is an abstract version represented by ER or UML diagrams to confirm with the goal and scope of the data project.

### Logical Data Model:
These models are refined versions of conceptual data models and incorporate the details of cardinality, data types, contraints, validation as proposed by business rules. It can also be defined using ER or UML diagrams.

### Physical Data Model:
These models are the final version of the logical data model which inlcudes all the technical features and limitations of the storage option you decide upon and is specifically optimized for performance, scalability, security and availability of your data.

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

| id  | code | name      | atribute       |    
|-----|------|-----------|----------------|
| 123 | abc  | name_code | name_atribute1 |

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
