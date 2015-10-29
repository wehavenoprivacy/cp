# Shares
## Listing and Removing via CMD
    net share
    net share $SHARENAME_GOES_HERE /delete

## Listing and Removing via PowerShell
    $shares = gwmi win32_share | ? {$_.Name -NotIn 'ADMIN$','C$', 'IPC$'}
    $shares | % {$_.Delete()}
