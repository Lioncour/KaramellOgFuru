# Karamell og Furu — lokal forhåndsvisning (fetch til gallery.json krever server)
Set-Location $PSScriptRoot
$port = 5173
Write-Host ""
Write-Host "  Karamell og Furu — http://localhost:$port" -ForegroundColor Cyan
Write-Host "  Ctrl+C for å stoppe." -ForegroundColor DarkGray
Write-Host ""

if (Get-Command py -ErrorAction SilentlyContinue) {
  py -m http.server $port
} elseif (Get-Command python -ErrorAction SilentlyContinue) {
  python -m http.server $port
} elseif (Get-Command npx -ErrorAction SilentlyContinue) {
  npx --yes serve . -l $port
} else {
  Write-Host "Installer Python eller Node.js, eller kjør: npm start" -ForegroundColor Yellow
  exit 1
}
