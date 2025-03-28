# Setup ssh

```bash
$ ssh-keygen

Output
Generating public/private rsa key pair.
Enter file in which to save the key (/home/<username>/.ssh/id_rsa):/home/<username>/.ssh/id_rsa_<other>
```
view the key
```bash
$ cat ~/.ssh/id_ed25519_<other>.pub
```
make the config
```bash
$ touch ~/.ssh/config
```

## setup with a different key path/name
to test connection
```bash
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

