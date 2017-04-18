# escape=`

# build agent
FROM sixeyed/msbuild:4.5.2-webdeploy
COPY dotnet\Docker.AtSea C:\src
RUN C:\src\Docker.AtSea.Api\build.ps1

# app image
FROM microsoft/aspnet:windowsservercore-10.0.14393.953
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Set-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ServerPriorityTimeLimit -Value 0 -Type DWord

RUN Remove-Website -Name 'Default Web Site'; `
    New-Item -Path 'C:\web-app' -Type Directory; `
    New-Website -Name 'web-app' -PhysicalPath 'C:\web-app' -Port 8080 -Force

HEALTHCHECK --interval=5s `
 CMD powershell -command `
    try { `
     $response = iwr http://localhost:8080/atsea/utility/containerid -UseBasicParsing; `
     if ($response.StatusCode -eq 200) { return 0} `
     else {return 1}; `
    } catch { return 1 }

COPY --from=0 C:\out\_PublishedWebsites\Docker.AtSea.Api C:\web-app