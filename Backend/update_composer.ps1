$jsonPath = 'composer.json'
$json = Get-Content $jsonPath -Raw | ConvertFrom-Json
$requireHashtable = @{}
$json.require.PSObject.Properties | ForEach-Object { $requireHashtable[$_.Name] = $_.Value }
if (-not $requireHashtable.ContainsKey('laravel/nova')) {
    $requireHashtable['laravel/nova'] = '*'
}
$json.require = $requireHashtable
if (-not $json.PSObject.Properties.Name.Contains('repositories')) {
    $json | Add-Member -MemberType NoteProperty -Name repositories -Value @()
}
$exists = $false
foreach ($repo in $json.repositories) {
    if ($repo.type -eq 'path' -and $repo.url -eq './nova') {
        $exists = $true
        break
    }
}
if (-not $exists) {
    $json.repositories += @{ type = 'path'; url = './nova' }
}
$json | ConvertTo-Json -Depth 10 | Set-Content $jsonPath
