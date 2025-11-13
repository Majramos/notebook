# Spark/Pyspark Utilites

```python
from pyspark.sql import SparkSession
import pyspark.sql.functions as f

spark = (
    SparkSession
    .builder
    .master("spark://127.0.0.1:7077")
    .getOrCreate()
)

df = spark.read.parquet("<path to parquet file>.parquet")

# get number of partitions
df.rdd.getNumPartitions()

# get number of lines by partition
(
    df
    .withColumn("partition_id", f.spark_partition_id())
    .groupBy("partition_id")
    .count()
    .orderBy(f.col("partition_id").desc())
)
```

