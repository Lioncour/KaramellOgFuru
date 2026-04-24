# Karamell og Furu — lokal forhåndsvisning (åpner nettleser)
Set-Location $PSScriptRoot
$port = 5173
$url = "http://localhost:$port"
Write-Host ""
Write-Host "  Karamell og Furu — $url" -ForegroundColor Cyan
Write-Host "  Ctrl+C for å stoppe." -ForegroundColor DarkGray
Write-Host ""

if (Get-Command npx -ErrorAction SilentlyContinue) {
  npx --yes http-server . -p $port -o -c-1
} elseif (Get-Command py -ErrorAction SilentlyContinue) {
  Start-Process $url
  py -m http.server $port
} elseif (Get-Command python -ErrorAction SilentlyContinue) {
  Start-Process $url
  python -m http.server $port
} else {
  Write-Host "Installer Node.js (anbefalt) eller Python." -ForegroundColor Yellow
  exit 1
}
