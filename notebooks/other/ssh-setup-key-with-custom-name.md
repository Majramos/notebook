# Setup ssh with a key path/name diferent

to test connection
```
ssh -vvvT git@gitlab.com
```

ssh will try to read the keys with the common name and fail
```
...

debug3: Failed to open file:C:/Users/<username>/.ssh/id_dsa error:2
debug3: Failed to open file:C:/Users/<username>/.ssh/id_dsa.pub error:2
...
```

you need to tell ssh to open the file with the correct name
create file `~/ssh/config` with:
```
Host gitlab.com
	Preferredauthentications publickey
	Hostname gitlab.com
	User <username>@<emailaddress.com>
	IdentityFile C:\Users\<username>\.ssh\id_ed25519_gitlab
```