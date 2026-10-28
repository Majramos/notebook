# Cloud Tools

??? note "Work in Progress"

    Please note that the notebook you are referring to is currently a work in progress and may continue to be under development for an extended period. This ongoing process ensures that the content remains up-to-date and relevant, reflecting the latest information and research. As such, some sections may be incomplete or subject to change.
    
    
## Cloud Computing
- Trade upfront expense for variable expense
- Stop spending money to run and maintain data centers
- Stop guessing capacity
- Benefit from massive economies of scale
- Increase speed and agility
- Go global in minutes

### Cloud Computing Models
- SaaS (Software-as-a-Service)
- PaaS (Platform-as-a-Service)
- IaaS (Infrastructure-as-a-Service)

### IT Deployment Models
- Cloud
- Hybrid
- On-premises

## AWS

### CDK vs SDK

#### CDK
- framework to model and provision your infrastructure or stack. provides a facility to write code to create an infrastructure in AWS (Iaas)

#### SDK
- code libraries provided by Amazon in various languages (ex: boto3)

### SageMaker
- fully managed machine learning platform, build, train, and deploy machine learning models at scale
- multi-model endpoints enable you to deploy multiple model versions behind a single endpoint
- https://docs.aws.amazon.com/sagemaker/latest/dg/serverless-endpoints.html
- https://docs.aws.amazon.com/sagemaker/latest/dg/deploy-model.html
- sincronos vs assicrono
- batch vs streaming jobs

### DinamoDB
- serverless, NoSQL database service
- Automatic Scaling
- handle large-scale, high-traffic applications and provides features like automatic scaling, backup and restore, and encryption at rest

### apuramento de custos
- Pay for what you use
- Pay less when you reserve
- Pay less with volume-based discounts when you use more

### CDK
- Infrastructure as code (IaC)
- This is for helping to automate CloudFormation as part of an IaC approach to provisioning and deploying resources. It lets you use various popular programming languages to help with the creation, testing, and management of your CF setup
- https://aws.amazon.com/cdk/

### Lambda
- Faas Functiona as a service
- serverless compute service, executes your code in response to events

### S3
- Amazon Simple Storage Service

### Glue
- serverless data integration service / ETL engine

### Athena
- Athena have nearly unbounded execution time
- Athena queries are asynchronous. Your API call starts the query and returns that it's been successfully requested. In order to get the data, you need to poll the query status and then read the results from S3.
- Athena's latency is also comparable high, since it loads your data from S3 into a temporary environment for every query.
- a serverless service

### EMR
- managed cluster platform that simplifies running big data frameworks, such as Apache Hadoop and Apache Spark, on AWS to process and analyze vast amounts of data

### AWS IoT stack
- AWS IoT Stack is a suite of services designed to connect, manage, and analyze data from (IoT) devices
- AWS IoT Core for secure, bi-directional communication between devices and the cloud
c AWS IoT Device Management for organizing and monitoring devices
- AWS IoT Analytics for processing and analyzing IoT data

### Redshift
- cloud data warehouse service that can ingest structured and semi-structured data in multiple data formats, run SQL queries and open analytics on the data, and power dashboards and visualizations to enable data-driven insights
- Amazon Redshift clusters -> one or more compute nodes hosting a query engine and one or more databases
- Don't use redshift, it couples compute and storage.

### EC2
- scalable computing capacity in the cloud. It allows users to launch virtual servers, known as instances, which can be configured with various combinations of CPU, memory, storage, and networking resources

#### Pricing
- On-Demand Instances: short-term, irregular workloads that cannot be interrupted. No upfront costs or minimum contracts apply
- Savings Plans: reduce your compute costs by committing to a consistent amount of compute usage for a 1-year or 3-year term
- Reserved Instances: billing discount applied to the use of On-Demand Instances, Standard Reserved and Convertible Reserved Instances for a 1-year or 3-year term, and Scheduled Reserved Instances for a 1-year term
- Spot Instances: ideal for workloads with flexible start and end times
- Dedicated Hosts: physical servers with Amazon EC2 instance capacity that is fully dedicated to your use

### EKS
Amazon Elastic Kubernetes Service (EKS) is a managed service that simplifies running Kubernetes on AWS. It eliminates the need to install, operate, and maintain your own Kubernetes control plane or nodes. EKS provides a scalable and secure environment for deploying, managing, and scaling containerized applications using Kubernetes¹².

### CloudFormation
"Infrastructure as Code" approach to managing the definition, provisioning and deployment of a bunch of resources across accounts/regions. This is done by using their declarative yaml/json-based template language to define it all

## Snowflake
- Snowflake Cloud Data Warehouse
- Snowflake is an analytic data warehouse provided as **Software-as-a-Service (SaaS)**
- https://learn.snowflake.com/en/
- SQL scripting
- Don't use snowflake, proprietary engine.
- Most comparable with AWS Redshift

## python
- unit testing

## alteryx
- automate analytics tools
- Drag-and-Drop Interface: Users can build workflows by dragging and dropping tools onto a canvas

## snaplogic
- iPaaS - Integration Plataform as a Service
- ETL tool
- cloud-based integration platform that simplifies the process of connecting various data sources, applications, and system
- drag and drop

## Apache Iceberg
- high-performance format for huge analytic tables



### dremio
- self-service analytics and semantic layer for your data lake
- It is not a data warehousing tool but rather a meta-tool that operates as a layer above the organization’s data sources
- It acts as an abstraction layer between data consumers (users, applications) and data sources (data lakes, databases). Dremio provides a logical view of the data, enabling users to access and analyze data across multiple sources as if they were a single source.

### mlflow
- MLflow provides a unified platform to navigate the intricate maze of model development, deployment, and management. MLflow aims to enable innovation in ML solution development by streamlining otherwise cumbersome logging, organization, and lineage concerns that are unique to model development.

### nexus/sonatype container
Using Nexus Container Registry offers several advantages, especially for teams looking to manage their container images efficiently. Here are some key benefits:

1. **Universal Repository Management**: Nexus supports a wide range of package formats, not just Docker images. This makes it a versatile tool for managing various types of artifacts in one place².

2. **Security and Access Control**: Nexus provides robust security features, including role-based access control and support for LDAP, ensuring that only authorized users can access and manage your container images⁵.

3. **Efficient Storage Management**: Nexus offers features like deduplication of image layers and efficient garbage collection, which help in managing storage space effectively².

4. **High Availability and Scalability**: Nexus can be configured for high availability, making it suitable for large-scale deployments where uptime and performance are critical².

5. **Integration with CI/CD Pipelines**: Nexus integrates well with continuous integration and continuous deployment (CI/CD) tools, streamlining the process of building, storing, and deploying container images¹.

6. **Open Source and Cost-Effective**: Nexus Repository OSS is free and open source, making it a cost-effective solution for teams looking to manage their container images without incurring additional costs³.

### Apache airflow
- platform to programmatically author, schedule and monitor workflows

## dremio vs snowflake
- Dremio: Native Execution Engine vs Snowflake: Virtualized Execution
- Dremio: Self-Service Data Integration vs Snowflake: Traditional ETL Pipeline
- Dremio: Data Reflections (in memory) vs Snowflake: Materialized Views (explicit creation)
- Dremio: Interactive Analytics Platform vs Snowflake: Cloud Data Warehouse
- Dremio: Open-Source Core with Enterprise Edition vs Snowflake: Proprietary Data Platform
- Dremio: On-Premises and Cloud Deployment Options vs Snowflake: Cloud-Only Deployment