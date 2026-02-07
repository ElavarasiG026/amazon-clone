$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:7070/")
$listener.Start()

Write-Host "Website running at http://localhost:7070"

while ($true) {
    $context = $listener.GetContext()
    $file = $context.Request.Url.LocalPath.TrimStart('/')

    if ($file -eq "" -or !(Test-Path $file)) {
        $file = "index.html"
    }

    $bytes = [System.IO.File]::ReadAllBytes($file)
    $context.Response.ContentLength64 = $bytes.Length
    $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    $context.Response.OutputStream.Close()
}
