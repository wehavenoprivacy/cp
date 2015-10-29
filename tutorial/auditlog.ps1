
function getDateSince(
    [System.DayOfWeek] $DayOfWeek = $('Monday')
) {
    $today = Get-Date -Hour 0 -Minute 0 -Second 0;
    $delta = $today.DayOfWeek.value__ - $DayOfWeek.value__;
    return $today.AddDays(-1 * $delta);
}

function Get-LogonTime(
    [CmdletBinding()]
    [DateTime] $After = $(getDateSince('Monday'))
) {
    # Event ID for Logon/Logoff: 4624, 4634
    [String] $username = $env:USERNAME.toLower();
    $e = Get-EventLog security -InstanceId 4624 -After:$After `
        | ? {$_.Message.Contains($username)};

    $e `
        | Group-Object {$_.TimeGenerated.ToString('M/dd')} `
        | %{ $_.Group | sort TimeGenerated -desc | select -Last 1};
}

function Get-LogoffTime(
    [CmdletBinding()]
    [DateTime] $After = $(getDateSince('Monday'))
) {
    [String] $username = $env:USERNAME.toLower();
    $e = Get-EventLog security -InstanceId 4634 -After:$After `
        | ? {$_.Message.Contains($username)};

    $e `
        | Group-Object {$_.TimeGenerated.ToString('M/dd')} `
        | %{ $_.Group | sort TimeGenerated | select -Last 1 };
}

