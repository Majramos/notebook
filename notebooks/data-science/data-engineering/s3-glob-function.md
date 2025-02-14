# Glob files in S3

```python
import os

import boto3



class S3:
    def __init__(
        self,
        bucket: str,
        key: str,
        aws_access_key_id: Optional[str] = None,
        aws_secret_access_key: Optional[str] = None,
    ) -> None:
        if not aws_access_key_id and not aws_secret_access_key:
            load_dotenv()  # try load from .env
            aws_access_key_id = os.environ.get("AWS_ACCESS_KEY_ID", None)
            aws_secret_access_key = os.environ.get("AWS_SECRET_ACCESS_KEY", None)

        if aws_access_key_id and aws_secret_access_key:
            self.client = boto3.client(
                "s3",
                aws_access_key_id=aws_access_key_id,
                aws_secret_access_key=aws_secret_access_key,
            )
        else:
            raise Exception("Missing AWS credentials")

        self.BUCKET = bucket

        # check if has access to bucket
        list_of_buckets = [r["Name"] for r in self.client.list_buckets()["Buckets"]]
        if not self.BUCKET in list_of_buckets:
            raise Exception(f"Can't find bucket {self.BUCKET}")

        self.KEY = key

    def glob(
        self,
        pathname: str = "*",
        prefix: Optional[str] = None,
        show_all: bool = False,
    ) -> List[str]:
        """Using JMESPath to query json files and return full path to file
        matching path name.

        example JMESPath query:
            'Contents[?contains(Key, `"foo"`) && contains(Key, `"bar"`)].Key'
        """

        # add to key to further filter the files
        prefix = f"{self.KEY}/{prefix}" if prefix else _key
        paginator = self.client.get_paginator("list_objects_v2")
        pages = paginator.paginate(Bucket=self.BUCKET, Prefix=prefix)

        if pathname == "*":  # return all files
            contains_str = pathname
        else:
            contains_str = " && ".join(
                [f'contains(Key, `"{i}"`)' for i in pathname.split("*")]
            )

        globbed = pages.search(f"Contents[?{contains_str}].Key")

        # if you want to just return files
        if show_all:
            return globbed
        else:
            return [i for i in globbed if i and i[-1] != "/"]
```
