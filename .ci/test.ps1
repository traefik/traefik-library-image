param(
    [Parameter()]
    [String]$target
)

Write-Output 'Test for ' + $target

$ErrorActionPreference = 'Stop' # Fail if any instruction fails
$version = Get-Content .\version -Raw
$api_opts = ''
if($version.StartsWith('v2')) {
$api_opts='--api.insecure'
}
if($version.StartsWith('v3')) {
$api_opts='--api.insecure'
}

$path = $version-replace "\.[0-9a-z\-]+\s*$"

docker build -t traefik:$target $path/windows/$target
docker run --name lb -d -p 8080:8080 traefik:$target --api $api_opts
sleep 2
docker ps
Invoke-WebRequest -Uri http://localhost:8080 -TimeoutSec 60
