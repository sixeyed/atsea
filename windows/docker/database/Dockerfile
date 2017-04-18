# escape=`

# build agent
FROM sixeyed/msbuild:4.5.2-ssdt
COPY dotnet\Docker.AtSea\Docker.AtSea.Database C:\src
RUN C:\src\build.ps1

# db image
FROM microsoft/mssql-server-windows-express:2016-sp1-windowsservercore-10.0.14393.693
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

VOLUME c:\data
ENV sa_password g0rd0n1!

CMD c:\db\init\InitializeDatabase.ps1 -sa_password $env:sa_password -Verbose

HEALTHCHECK --interval=5s `
 CMD powershell -command `
    try { `
     $result = invoke-sqlcmd -Query 'SELECT TOP 1 1 FROM Product' -Database Docker.AtSea.Database; `
     if ($result[0] -eq 1) { return 0} `
     else {return 1}; `
    } catch { return 1 }

COPY --from=0 C:\src\bin\Debug c:\db