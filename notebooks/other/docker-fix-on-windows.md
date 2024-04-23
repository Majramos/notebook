# Fix Docker on Windows

## docker desktop not starting

when docker desktop app is not running
or when running `docker version` one gets the following message:
> error during connect: This error may indicate that the docker daemon is not running.: 
> Get "http://%2F%2F.%2Fpipe%2Fdocker_engine/v1.24/version": 
> open //./pipe/docker_engine: The system cannot find the file specified.


remove thecontent of the following folders
- %USERPROFILE%\AppData\Roaming\Docker
- %USERPROFILE%\AppData\Roaming\Docker Desktop



## docker service starting

```bash
C:\Program Files\Docker\Docker> ./DockerCli.exe -SwitchDaemon
```



## docker update stuck

```bash
Get-BitsTransfer -Name "Docker Desktop Update" | Remove-BitsTransfer
```
