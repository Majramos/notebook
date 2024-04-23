# Convert project page to a user page 
https://<username>.gitlab.io/<projectname>

Update both the project name and path to **<username>.gitlab.io**  
Got to Settings in gitlab for project name and got to the Advanced tab to update the path

## Update local git remote url
```bash
git remote set-url origin git@gitlab.com:<username>/<username>.gitlab.io.git
```

source:
https://soykje.gitlab.io/en/blog/jamstack-gitlab-pages/
