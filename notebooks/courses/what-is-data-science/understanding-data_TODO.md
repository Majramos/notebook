# Understanding Data

## Understanding Data

Data is unorganized information that is processed to make it meaningful. Generally, data comprises of facts, observations, perceptions, numbers, characters, symbols, and images that can be interpreted to derive meaning.
One of the ways in which data can be categorized is by its structure. Data can be: Structured; Semi-structured, or Unstructured.

- Structured data
has a **well-defined structure or adheres to a specified data model**, can be **stored in well-defined schemas** such as databases, and in many cases can be **represented in a tabular manner** with rows and columns. Structured data is objective facts and numbers that can be collected, exported, stored, and organized in typical databases. Some of the sources of structured data could include: SQL Databases and Online Transaction Processing (or OLTP) Systems that focus on business transactions, Spreadsheets such as Excel and Google Spreadsheets, Online forms, Sensors such as Global Positioning Systems (or GPS) and Radio Frequency Identification (or RFID) tags; and Network and Web server logs. You can typically store structured data in relational or SQL databases. You can also easily examine structured data with standard data analysis methods and tools.

- Semi-structured data
is data that has some **organizational properties but lacks a fixed or rigid schema**. Semi-structured data cannot be stored in the form of rows and columns as in databases. It **contains tags and elements, or metadata**, which is used to group data and organize it in a hierarchy. Some of the sources of semi-structured data could include: E-mails, XML, and other markup languages, Binary executables, TCP/IP packets, Zipped files, Integration of data from different sources. XML and JSON allow users to define tags and attributes to store data in a hierarchical form and are used widely to store and exchange semi-structured data.

- Unstructured data
is data that does **not have an easily identifiable structure** and, therefore, cannot be organized in a mainstream relational database in the form of rows and columns. It does **not follow any particular format, sequence, semantics, or rules**. Unstructured data can deal with the heterogeneity of sources and has a variety of business intelligence and analytics applications. Some of the sources of unstructured data could include: Web pages, Social media feeds, Images in varied file formats (such as JPEG, GIF, and PNG), video and audio files, documents and PDF files, PowerPoint presentations, media logs; and surveys. Unstructured data can be stored in files and documents (such as a Word doc) for manual analysis or in NoSQL databases that have their own analysis tools for examining this type of data.

To summarize, structured data is data that is well organized in formats that can be stored in databases and lends itself to standard data analysis methods and tools; Semi-structured data is data that is somewhat organized and relies on meta tags for grouping and hierarchy; and Unstructured data is data that is not conventionally organized in the form of rows and columns in a particular format In the next video, we will learn about the different types of file structures.


## Data Sources

Common sources such as Relational Databases; Flatfiles and XML Datasets APIs and Web Services; Web Scraping; Data Streams and Feeds.

Typically, organizations have internal applications to support them in managing their day to day business activities, customer transactions, human resource activities, and their workflows. These systems use **relational databases** such as SQL Server, Oracle, MySQL, and IBM DB2, to **store data in a structured way**. Data stored in databases and data warehouses can be used as a source for analysis. For example, data from a retail transactions system can be used to analyze sales in different regions, and data from a customer relationship management system can be used for making sales projections. External to the organization, there are other publicly and privately available datasets. For example, government organizations releasing demographic and economic datasets on an ongoing basis. Then there are companies that sell specific data, for example, Point-of-Sale data or Financial data, or Weather data, which businesses can use to define strategy, predict demand, and make decisions related to distribution or marketing promotions, among other things. Such data sets are typically made available as flat files, spreadsheet files, or XML documents.

**Flat files**, store data in plain text format, with one record or row per line, and each value separated by delimiters such as commas, semi-colons, or tabs. Data in a flat file maps to a single table, unlike relational databases that contain multiple tables. One of the most common flat-file format is CSV in which values are separated by commas.

**Spreadsheet files** are a special type of flat files, that also organize data in a tabular format–rows and columns. But a spreadsheet can contain multiple worksheets, and each worksheet can map to a different table. Although data in spreadsheets is in plain text, the files can be stored in custom formats and include additional information such as formatting, formulas, etc. Microsoft Excel, which stores data in .XLS or .XLSX format is probably the most common spreadsheet. Others include Google sheets, Apple Numbers, and LibreOffice.

**XML files**, contain data values that are identified or marked up using tags. While data in flat files is “flat” or maps to a single table, XML files can support more complex data structures, such as hierarchical. Some common uses of XML include data from online surveys, bank statements, and other unstructured data sets.

Many data providers and websites provide **APIs**, or Application Program Interfaces, and Web Services, which multiple users or applications can interact with and obtain data for processing or analysis. APIs and Web Services typically listen for incoming requests, which can be in the form of web requests from users or network requests from applications, and return data in plain text, XML, HTML, JSON, or media files. Let’s look at some popular examples of APIs being used as a data source for data analytics: The use of Twitter and Facebook APIs to source data from tweets and posts for performing tasks such as opinion mining or sentiment analysis—which is to summarize the amount of appreciation and criticism on a given subject, such as policies of a government, a product, a service, or customer satisfaction in general. Stock Market APIs used for pulling data such as share and commodity prices, earnings per share, and historical prices, for trading and analysis. Data Lookup and Validation APIs, which can be very useful for Data Analysts for cleaning and preparing data, as well as for co-relating data—for example, to check which city or state a postal or zip code belongs to. APIs are also used for pulling data from database sources, within and external to the organization.

**Web Scraping** is used to extract relevant data from unstructured sources. Also known as screen scraping, web harvesting, and web data extraction, web scraping makes it possible to download specific data from web pages based on defined parameters. Web scrapers can, among other things, extract text, contact information, images, videos, product items, and much more from a website. Some popular uses of web scraping include collecting product details from retailers, manufacturers, and eCommerce websites to provide price comparisons; generating sales leads through public data sources; extracting data from posts and authors on various forums and communities; and collecting training and testing datasets for machine learning models Some of the popular web scraping tools include BeautifulSoup, Scrapy, Pandas, and Selenium.

**Data streams** are another widely used source for aggregating constant streams of data flowing from sources such as instruments, IoT devices, and applications, GPS data from cars, computer programs, websites, and social media posts. This data is generally timestamped and also geo-taggedfor geographical identification. Some of the data streams and ways in which they can be leveraged include: stock and market tickers for financial trading; retail transaction streams for predicting demand and supply chain management; surveillance and video feeds for threat detection; social media feeds for sentiment analysis, sensor data feeds for monitoring industrial or farming machinery; web click feeds for monitoring web performanceand improving design; and real-time flight events for rebooking and rescheduling. Some popular applications used to process data streams include Apache Kafka, Apache Spark Streaming, and Apache Storm.

**RSS (or Really Simple Syndication)** feeds, are another popular data source. These are typically used for capturing updated data from online forums and news sites where data is refreshed on an ongoing basis. Using a feed reader, which is an interface that converts RSS text files into a stream of updated data, updates are streamed to user devices.


## Viewpoints: Working with Varied Data Sources and Types

I tend to be a relational database fan. And so I spend a lot of time with SQL and using the power of SQL to deal with moving data from one place to another, to deal with structuring of data, to deal with all the security details around data. But obviously that doesn't apply to every scenario and even when we're dealing entirely in relational databases we're often moving data from one relational database to another. And especially when we're talking about one vendor to another that can be challenging. The things that also get in the way tend to be the versioning. So sometimes the feature of something that you want is in a version two levels above where you are, or it doesn't work the same way as it did two versions ago. So **working with multiple data sources is about flexibility**. It's about finding the function that works and works with the performance you need. Moving data one time is usually not all that hard as long as we're sub-terabyte. But moving data consistently and continually, and in a performant way can cause cause us to evaluate a lot of different solutions. So we really need to be open to new ideas and looking for new solutions that meet the requirements that we have.

Mostly I work with relational databases. They are extremely flexible and withstood the test of time. However, with the evolution of unstructured data such as logs, documents, XML, and JSON, their reputation as a cure for all of your data problems came under intense scrutiny. And most of data intensive applications such as IoT on social media applications started to look elsewhere. For example, Google released a white paper back in 2006 called Google BigTable. That idea quickly caught fire. For example, Cassandra and HBase came out of the same architectural model as the Google BigTable. And they became widely popular databases to solve some of the problems that relational databases failed to solve. For example, relational databases struggle a little bit with heavy write intensive applications such as IoT or sensor data, social media data because the B-tree data structures that drive, or power, these relational databases slows down due to their nature of the random reads and random writes for the heavy write applications.

It's an inevitable part of a data engineer's job to work with a variety of data. You will need to work with standard formats like CSV, JSON, XML, but also you'll need to work with **proprietary formats**. And you will need to get data in different sources, whether it be relational databases, NoSQL or big data repositories. You will need to work with data at rest, streaming data, or data in motion. And you might not have the skills to work with all of these different types of data sources from day one. But you need to be able to learn as you go and pick up the skills required for the project to work with different datasets, different data formats, and different data sources.

When it comes to the data formats, log data, XML data, JSON, etc., each of them comes with their own challenges. For example, log data is extremely challenging because it's unstructured and you may need to write your own custom tools to parse the data depending on what you want to look at. Whereas XML was widely popular like a decade ago, especially with the SOAP protocol of the web applications. However, soon the web developers and corporations discovered that it can be a resource intensive, especially memory, because it has both the starting and ending tags. So then JSON came into the picture. They got it off the ending tags and just looked like a key-value pairs and it saved some resources. And it is now widely used as part of the RESTful APIs. And then even newer versions of the data format such as Apache Avro are gaining wide popularity because of the efficiency on how they store the data.

One particular situation where we were converting data from a Db2 database into a SQL Server database and it was challenging because the way that each of those expect imports and exports to happen is a little bit different. The data was particularly challenging, and that's where a lot of your challenge might come from in these projects, is from the data itself. In this particular case, the data had a lot of different characters in it. So usually we're looking for a character we can use as a delimiter. Oftentimes that's comma delimited, so we can separate our fields using commas, but we also have to think about situations where we have data that has commas in it. How do we properly separate that data? How do we properly define our fields? And in this particular case we had to use different separators for different tables, because every single special character that we could think of was in one of those tables. And the special characters that weren't were sometimes ones we couldn't use for separation, such as the Bell character.

## Metadata

Metadata is data that provides information about other data.

This is a very broad definintion. Here we will consider the concept of metadata within the context of databases, data warehousing, business intelligence systems, and all kinds of data repositories and platforms.

We'll consider the following three main types of metadata:
- Technical metadata
- Process metadata
- Business metadata

### Technical metadata
Technical metadata is metadata which defines the data structures in data repositories or platforms, primarily from a technical perspective.

For example, technical metadata in a data warehouse includes assets such as:

- Tables that record information about the tables stored in a database, like:
	- each table's name
	- the number of columns and rows each table has
- A data catalog, which is an inventory of tables that contain information, like:
	- the name of each database in the enteprise data warehouse
	- the name of each column present in each database
	- the names of every table that each column is contained in
	- the type of data that each column contains

The technical metadata for relational databases is typically stored in specialized tables in the database called the System Catalog.

### Process metadata
Process metadata describes the processes that operate behind business systems such as data warehouses, accounting systems, or customer relationship management tools.

Many important enterprise systems are responsible for collecting and processing data from various sources. Such critical systems need to be monitored for failures and any performance anomalies that arise. Process metadata for such sytems includes tracking things like:
- process start and end times
- disk usage
- where data was moved from and to, and
- how many users access the system at any given time

This sort of data is invaluable for troubleshooting and optimizing workflows and ad hoc queries.

### Business metadata
Users who want to explore and analyze data within and outside the enterprise are typically interested in data discovery. They need to be able to find data which is meaningful and valuable to them and know where that data can be accessed from. These business-minded users are thus interested in business metadata, which is information about the data described in readily interpretable ways, such as:
- how the data is acquired
- what the data is measuring or describing
- the connection between the data and other data sources
- Business metadata also serves as documentation for the entire data warehouse system.

### Managing metadata
Managing metadata includes developing and administering policies and processes to ensure information can be accessed and integrated from various sources and appropriately shared across the entire enterprise.

Creation of a reliable, user-friendly data catalog is a primary objective of a metadata management model. The data catalog is a core component of a modern metadata management system, serving as the main asset around which metadata management is administered. It serves as the basis by which companies can inventory and efficiently organize their data systems. A modern metadata managment model will include a web-based user interface that enables engineers and business users to easily search for and find information on key attributes such as CustomerName or ProductType. This kind of model is central to any Data Governance initiative.

### Why is metadata management important?
Good metadata management has many valuable benefits. Having access to a well implemented data catalog greatly enhances data discovery, repeatability, governance, and can also facilitate access to data.

Well managed metadata helps you to understand both the business context associated with the enterprise data and the data lineage, which helps to improve data governance. Data lineage provides information about the origin of the data and how it gets transformed and moved, and thus it facilitates tracing of data errors back to their root cause. Data governance is a data management concept concerning the capability that enables an organization to ensure that high data quality exists throughout the complete lifecycle of the data, and data controls are implemented that support business objectives.

The **key focus areas of data governance** include availability, usability, consistency, data integrity and data security and includes establishing processes to ensure effective data management throughout the enterprise such as accountability for the adverse effects of poor data quality and ensuring that the data which an enterprise has can be used by the entire organization.

### Popular tools for metadata management
Popular metadata management tools include:
- IBM InfoSphere Information Server
- CA Erwin Data Modeler
- Oracle Warehouse Builder
- SAS Data Integration Server
- Talend Data Fabric
- Alation Data Catalog
- SAP Information Steward
- Microsoft Azure Data Catalog
- IBM Watson Knowledge Catalog
- Oracle Enterprise Metadata Management (OEMM)
- Adaptive Metadata Manager
- Unifi Data Catalog
- data.world
- Informatica Enterprise Data Catalog

### Summary
Metadata is data that provides information about other data, and includes three main types: technical, process, and business metadata
The technical metadata for relational databases is typically stored in specialized tables in the database called the system catalog
A primary objective of business metadata management modelling is the creation and maintenance of a reliable, user-friendly data catalog
Having access to a well-implemented data catalog greatly enhances data discovery, repeatability, governance, and can also facilitate access to data
Metadata management tools from IBM include InfoSphere Information Server and Watson Knowledge Catalog

## Lesson Summary

Data is the foundation of data science. To be a successful data scientist, you must understand data in different forms, whether structured, semi-structured, or unstructured. For data to be useful, it must be interpreted to derive meaning. Structured data has a well-defined structure or adheres to a specified data model, can be stored in well-defined schemas such as databases, and in many cases, can be represented in multiple tables with rows and columns. The schema defines the relationships between tables. Semi-structured has some organizational properties, but lacks a fixed or rigid schema. It cannot be stored in rows and columns. It contains tags and elements, or metadata, which is used to organize data in a hierarchy. The metadata provides useful information about this data. Metadata can be categorized as technical, process, or business. Metadata also needs managing to ensure information access and integration from various sources and appropriately shared across an organization, usually in a data catalog. A well-implemented data catalog enhances data discovery, repeatability, governance, and access.

Unstructured data is heterogenous. It comes from a broad range of sources and has a variety of business intelligence and analytics applications. Analyzing unstructured data often requires artificial intelligence to gain insights from it. It is important to know that the data for analysis can be sourced from anything with an electronic footprint, whether it’s generated and stored automatically or through manual efforts. While older records may exist in analog formats like paper, they typically require conversion to electronic formats for effective mining and processing. 

Typically, organizations use internal applications to support their day-to-day management of business activities and workflows. You can use data stored in databases and data warehouses as a source for analysis. You can also find publicly and privately held data sets for analysis. You can even purchase proprietary data sets. These data sets are usually made available as a single flat file such as CSV format or spreadsheets. For a number of years, flat files stored information about their structure in a format called XML. More recently, you see text data exchanged in JSON format, a straightforward format readable by humans and machines. JSON data does not have a predefined schema, so you can easily transfer it between data structures as they evolve. You can usually access the data in modern cloud-based software applications through an application programming interface or API. When dealing with JSON data, applications use what is called a “RESTful API” for data transfer. Many data providers and websites provide APIs for accessing their data. Twitter and Facebook both provide APIs to source data from posts for performing tasks such as opinion mining. This allows you to analyze sentiments on a given subject, such as customer satisfaction.

Usually data gathering and management are typically assigned to data engineers, although as a data scientist, you most often need to transfer data for analysis. This process demands flexibility. As a data scientist, you will frequently work with extensive data sets, sometimes reaching terabytes in size. These continually updating massive data sets stem from sources like IoT applications, sensor data, and the constant influx of social media data collected from millions of users.

Data scientists have a unique relationship with data. You specialize in data, so you must understand it intimately. But before you can analyze it, you’ll need to know the modern-day ecosystem for organizing, storing, manipulating, and retrieving data. This lesson introduced you to some of these ideas.
