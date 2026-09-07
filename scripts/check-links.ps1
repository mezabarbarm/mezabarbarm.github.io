param([switch]$External)

$ErrorActionPreference = 'Stop'
$siteRoot = Split-Path $PSScriptRoot -Parent
$pages = @(Get-ChildItem -LiteralPath $siteRoot -Filter '*.html')
$failures = @()
$externalUrls = @{}
$checked = 0

foreach ($page in $pages) {
    $html = [IO.File]::ReadAllText($page.FullName)
    foreach ($match in [regex]::Matches($html, '(?:href|src)="([^"]+)"')) {
        $url = [Net.WebUtility]::HtmlDecode($match.Groups[1].Value)
        if ($url -match '^https?://') {
            # The live site can lag behind this checkout; validate local files below.
            if ($url -notmatch '^https://mezabarbarm\.github\.io/') {
                $externalUrls[$url] = $true
            }
            continue
        }
        if ($url -match '^[a-zA-Z][a-zA-Z0-9+.-]*:' -or $url.StartsWith('//')) { continue }
        $parts = $url.Split('#', 2)
        $relativePath = [Uri]::UnescapeDataString($parts[0].Split('?')[0])
        $target = if ($relativePath) { Join-Path $siteRoot $relativePath } else { $page.FullName }
        $checked++
        if (-not (Test-Path -LiteralPath $target -PathType Leaf)) {
            $failures += "$($page.Name): arquivo ausente: $url"
            continue
        }
        if ($parts.Count -eq 2 -and $parts[1] -and $target -match '\.html$') {
            $fragment = [Uri]::UnescapeDataString($parts[1])
            $ids = @([regex]::Matches([IO.File]::ReadAllText($target), '\bid="([^"]+)"') | ForEach-Object { $_.Groups[1].Value })
            if ($ids -cnotcontains $fragment) { $failures += "$($page.Name): ancora ausente: $url" }
        }
    }
}

Write-Output "$($pages.Count) paginas; $checked referencias locais verificadas."
if ($External) {
    Add-Type -AssemblyName System.Net.Http
    $client = [Net.Http.HttpClient]::new()
    $client.Timeout = [TimeSpan]::FromSeconds(20)
    $client.DefaultRequestHeaders.UserAgent.ParseAdd('AcademicSiteLinkChecker/1.0')
    try {
        foreach ($url in ($externalUrls.Keys | Sort-Object)) {
            try {
                # Read headers only, so linked PDFs are not downloaded in full.
                $response = $client.GetAsync($url, [Net.Http.HttpCompletionOption]::ResponseHeadersRead).GetAwaiter().GetResult()
                $status = [int]$response.StatusCode
                $response.Dispose()
                if ($status -in 404, 410) {
                    $failures += "HTTP ${status}: $url"
                } elseif ($status -ge 400) {
                    Write-Warning "HTTP ${status}, conferir manualmente (pode ser bloqueio de robos): $url"
                } else {
                    Write-Output "HTTP ${status}: $url"
                }
            } catch {
                Write-Warning "Nao foi possivel verificar ${url}: $($_.Exception.Message)"
            }
        }
    } finally {
        $client.Dispose()
    }
}

if ($failures.Count) {
    $failures | ForEach-Object { Write-Output "ERRO: $_" }
    exit 1
}
if ($External) {
    Write-Output 'Nenhum link quebrado confirmado. Eventuais avisos externos precisam de conferencia manual.'
} else {
    Write-Output 'Nenhum link local quebrado. Enderecos externos nao foram consultados.'
}
