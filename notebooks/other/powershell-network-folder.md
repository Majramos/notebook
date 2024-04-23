# Map network folders in powershell


#### old way
```bash
net use \\path\to\network\folder
```

#### new way
```bash
New-PSDrive -Name V -PSProvider FileSystem -Root \\path\to\network\folder
```
- Name = unique drive letter
- PSProvider = set to 'FileSystem' for network shares and folders
- Root = network location to map

extra flags
- Persist = make available outside powershell
- Credential = set credentials to use