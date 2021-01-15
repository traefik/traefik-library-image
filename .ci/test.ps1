$ErrorActionPreference = 'Stop' # Fail if any instruction fails
$version = Get-Content .\version -Raw
$api_opts = ''
if($version.StartsWith('v2')) {
$api_opts='--api.insecure'
}

$platform = 'windows-1809'
$platform_dir = './windows/1809/'

docker build -t traefik:$platform $platform_dir
docker run --name lb -d -p 8080:8080 traefik:$platform --api $api_opts
sleep 2
docker ps
Invoke-WebRequest -Uri http://localhost:8080 -TimeoutSec 60
