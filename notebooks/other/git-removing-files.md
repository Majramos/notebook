# Remove files from git commit history
Using [git-filter-repo](https://github.com/newren/git-filter-repo)

## remove file(s) locally

Remove file from local git 
```
git filter-repo --path <path/to/file.ext> --invert-paths
```

### if using LFS
also if file is in lfs, it requires file pruning from lfs.
list files in lfs to check 
```
git lfs ls-files -sa
```
run with `--dry-run` first to check that files deleted are ok
```
git lfs prune --verbose
```

## push new commit history to remote
After rewriting one need to add origin again
```
git remote add origin git@<vsc url>:<username>/<project>.git
```
May require force push the branch again to a existing remote
```
git push --set-upstream origin development --force
```

## notes on gitlab
requeries extra step to go to
> GitLab → Project Repository Settings → General → Advanced and click on ‘Prune unreachable objects’ 
to prune them now manually.
