# Pyarrow Snipets

## Create a filesystem for connecting to S3

```python
import os

from pyarrow import fs as pafs

AWS_ACCESS_KEY_ID = os.environ.get("AWS_ACCESS_KEY_ID", None)
AWS_SECRET_ACCESS_KEY = os.environ.get("AWS_SECRET_ACCESS_KEY", None)

try:
    pas3fs = pafs.S3FileSystem(
        access_key=AWS_ACCESS_KEY_ID,
        secret_key=AWS_SECRET_ACCESS_KEY,
        region='eu-west-1'
    )
except Exception as e:
    # logger.info(str(e))
    raise e
```

## Read with pyarrow

### Read parquet

```python
def read_pa_pq_s3(s3_path: str, file_name: str, schema=None) -> pa.Table:
    """Read a parquet file from S3 with pyarrow. Requires that the
    AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY are set as environment
    variables.

    Parameters
    ----------
    s3_path: string
        s3 path with the bucket and directory were to store the folder
        this can't have the prefix 's3://'
    file_name: string
        name of the file

    Returns
    -------
    pyarrow table
    """

    # TODO: make sure for extras/missing '/' betwen path and filename
    s3_filepath = s3_path.replace("s3://", "") + file_name

    return pq.ParquetDataset(s3_filepath, filesystem=pas3fs, schema=schema).read()
```

### Read CSV

```python
import pyarrow as pa
from pyarrow import dataset as pads
from pyarrow import csv as pacsv

raw_dataset = pads.dataset(
    target_files, # list of S3 paths of files
    filesystem=pas3fs,
    partitioning=["date_refresh"], # name of the column of the partitioning
    partition_base_dir=table_raw_loc, # the common path before partitioning
    format=pads.CsvFileFormat(
        # skipping lines with errors
        parse_options=pacsv.ParseOptions(invalid_row_handler=lambda x: 'skip'),
        # enforce data types
        convert_options=pacsv.ConvertOptions(column_types=schema),
    )
)

# need to convert ´datset´ to pyarrow table
rfn_dataset = raw_dataset.to_table(columns=schema.names+["date_refresh"])

(
    rfn_dataset
    .set_column( # add a calculated column
        rfn_dataset.schema.get_field_index("date_refresh"),
        "date_refresh",
        pa.compute.strptime(
            pa.compute.cast(rfn_dataset["date_refresh"], pa.string()),
            format="%Y%m%d", unit="s"
        ).cast(pa.date32())
    )
)
```

## Write parquet pyarrow

```python
def upload_pa_table_s3(table: pa.Table, s3_path: str, file_name: str) -> None:
    """Function to save pyarrow into a parquet file and upload to
    aws S3

    Parameters
    ----------
    table: pyarrow table
    s3_path: string
        s3 path with the bucket and directory were to store the folder
    file_name: string
        name of the file
    """

    # TODO: make sure for extras/missing '/' betwen path and filename
    s3_filepath = s3_path.replace("s3://", "") + file_name

    pq.write_table(
        table=table,
        where=s3_filepath,
        filesystem=pas3fs,
        compression="snappy",
    )
```
