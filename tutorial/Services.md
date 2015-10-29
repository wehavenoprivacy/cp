# Windows Services

## PowerShell --> Create service baseline
    $baseline = Get-Service;
    $osver = [System.Environment]::OSVersion.Version.ToString();
    $baseline | Export-Clixml "./$osver.clixml";

## PowerShell --> Diff against baseline
    $osver = [System.Environment]::OSVersion.Version.ToString();
    $baseline = Import-Clixml "./$osver.clixml";
    $curr = Get-Service;
    diff $baseline $curr -Property Name,Status;
