# Forking a repository

forking a repository a repository without using github/gitlab forking capabilities

based on answer from stackoverflow: https://stackoverflow.com/questions/50973048/forking-git-repository-from-github-to-gitlab

1. create empty repository in gitlab

2. add github project as upstream
```bash
git remote add upstream https://github.com/user/repo
```

3. pull changes from upstream

pull all changes
```bash
git pull upstream main
```
or shallow pull
```bash
git pull upstream main --depth=1
```
if need to unshallow (pull everyting after doing a shallow pull)
```bash
git fetch --unshallow upstream
```

may not be able to push a shallow git repo to new origin 
fix to push shallow repo to push to new origin by recreating git repo
```bash
sudo rm -rf .git
git init
git remote add origin <your-new-repo>
```

4. push to own git remote repository
```bash
git push origin main
```
