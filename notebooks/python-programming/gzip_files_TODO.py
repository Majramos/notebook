#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# gzip_files.py
#


import gzip
import shutil
from pathlib import Path


CWD = Path(".").resolve()


unzipped = CWD/"unzipped"


def _zip_file(in_path: Path, out_name: Path) -> None:

    with open(in_path, "rb") as f_in, gzip.open(out_name, "wb") as f_out:
        shutil.copyfileobj(f_in, f_out)


def _gen_out_name(in_path: Path) -> Path:
    return Path(str(in_path).replace("unzipped", "zipped"))


def main() -> None:
    
    for p in unzipped.glob("**/*.csv"):
        print(p)
        out_name = Path(str(p).replace("unzipped", "zipped")+".gz")
        out_name.parent.mkdir(parents=True, exist_ok=True)
        _zip_file(p, out_name)


if __name__ == "__main__":
    main()
