# Notebook

<div align="center">

[![Built with Material for MkDocs](https://img.shields.io/badge/Material_for_MkDocs-526CFE?style=for-the-badge&logo=MaterialForMkDocs&logoColor=white)](https://squidfunk.github.io/mkdocs-material/)
![Python Badge](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=fff&style=flat)
![Gitlab Pipeline Status](https://gitlab.com/majramos/marcoramos-me/badges/main/pipeline.svg)
![Gitlab Release](https://gitlab.com/majramos/marcoramos-me/-/badges/release.svg)
![Gitlab Coverage](https://gitlab.com/majramos/marcoramos-me/badges/main/coverage.svg)

</div>

My notebooks about (mostly python) programming and data science

For a better description follow to [notebook about page](https://notebook.marcoramos.me/about/)

## Environment Setup
Use the script/jupyter.sh to build an image and run a container with jupyter lab to run the jupyter notebooks
```bash
# build a image
scripts/jupyter.sh build

# run a container using the built image
scripts/jupyter.sh run

# remove both container and image
scripts/jupyter.sh clean
```

### to interact with cloudflare using wrangler
Use the script/jupyter.sh to build an image and run a container with jupyter lab to run the jupyter notebooks
```bash
# same logic as above
scripts/wrangler.sh {build|run|clean}
```

The script is built using podman for container management

## Build the notebook using mkdocs

* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.

## About the notebook

These notebooks were built using [MkDocs-material](https://squidfunk.github.io/mkdocs-material/)
built on top of [MkDocs](https://www.mkdocs.org/)

Using also:
- [mkdocs-jupyter](https://github.com/danielfrg/mkdocs-jupyter) for support for jupyter notebooks
- [mkdocs-minify-plugin](https://github.com/byrnereese/mkdocs-minify-plugin)
- [mkdocs-awesome-pages-plugin](https://github.com/lukasgeiter/mkdocs-awesome-pages-plugin)
