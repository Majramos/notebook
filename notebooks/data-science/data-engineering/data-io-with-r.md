# Data IO Operations With R
Functions related with input/output data from/to AWS S3, using the packages `arrow` and `aws.s3`


## Required libraries

```Rscript
library(aws.s3)  # connect to aws S3
library(arrow)  # read/write parquet files

# work with data sets
library(dplyr)
library(tidyr)

library(dotenv)  # read .env file
```

## Check and import enviroment variables

```Rscript
AWS_S3_BUCKET <- Sys.getenv("AWS_S3_BUCKET", NA)
AWS_ACCESS_KEY_ID <- Sys.getenv("AWS_ACCESS_KEY_ID", NA)
AWS_SECRET_ACCESS_KEY <- Sys.getenv("AWS_SECRET_ACCESS_KEY", NA)
AWS_DEFAULT_REGION <- Sys.getenv("AWS_DEFAULT_REGION", NA)

# make sure all keys are available
if(anyNA(c(
    AWS_S3_BUCKET,
    AWS_ACCESS_KEY_ID,
    AWS_SECRET_ACCESS_KEY,
    AWS_DEFAULT_REGION
))){
    print("missing environment variable")
    quit(status = 1)
} else {
    OPTS_MODE <- list(
        key = AWS_ACCESS_KEY_ID,
        secret = AWS_SECRET_ACCESS_KEY,
        region = AWS_DEFAULT_REGION
    )
}
```

## Read parquet files

```Rscript
read_pq_s3 <- function(file_key){
    #' read a parquet file from AWS S3
    #' expects a path string `s3://<bucket>/<path>/<to>/<file>`

    out <- tryCatch(
        {
            aws.s3::s3read_using(
                arrow::read_parquet,
                object = file_key,
                bucket = AWS_S3_BUCKET,
                opts = OPTS_MODE
            )
        },
        error = function(e){
            print(paste("failed to load file:", file_key))
            quit(status = 1)
        }
    )
    return(out)
}

read_part_pq_s3 <- function(folder_key){
    #' read partitioned files from AWS S3
    #' expects a path a string `s3://<bucket>/<path>/<to>/<file>`

    out <- tryCatch(
        {
            arrow::open_dataset(
                sources = folder_key,
                format = "parquet"
            ) %>% collect
        },
        error = function(e){
            print(paste("Failed to load dataset:", folder_key))
            quit(status = 1)
       }
    )
    return(out)
}
```

## Write parquet files

```Rscript
upload_table_s3 <- function(data_table, file_key){
    #' write a parquet file to AWS S3
    #' expects a path string of s3://<bucket>/<path>/<to>/<file>

    tryCatch(
        {
            aws.s3::s3write_using(
                data_table,
                FUN = arrow::write_parquet,
                object = file_key,
                bucket = AWS_S3_BUCKET,
                opts = OPTS_MODE
            )
        },
        error = function(e){
            print(paste("Failed to upload file:", file_key))
        }
    )
}
```

