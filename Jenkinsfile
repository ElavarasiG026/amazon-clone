pipeline {
    agent any

    stages {
        stage('Serve Website') {
            steps {
                bat '''
powershell -Command "
$listener = New-Object System.Net.HttpListener;
$listener.Prefixes.Add('http://localhost:7070/');
$listener.Start();
Write-Host 'Website running on http://localhost:7070';

while ($true) {
    $context = $listener.GetContext();
    $path = Join-Path (Get-Location) $context.Request.Url.LocalPath.TrimStart('/');
    if (!(Test-Path $path)) {
        $path = 'index.html'
    }
    $bytes = [System.IO.File]::ReadAllBytes($path);
    $context.Response.ContentLength64 = $bytes.Length;
    $context.Response.OutputStream.Write($bytes,0,$bytes.Length);
    $context.Response.OutputStream.Close();
}
"
                '''
            }
        }
    }
}
