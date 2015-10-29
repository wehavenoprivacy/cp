# Installed Applications

## Listing Installed Applications via CMD
    wmic product > out.txt

## Listing Installed Applications via PowerShell
    $apps = gwmi win32_product
    $apps | sort Vendor | ft -a Vendor,Name,Version,InstallDate,InstallSource
  
## Uninstalling an Application
The Win32_Product class exposes an `Uninstall()` method which you may choose to invoke.
  
### Removing All Applications By Vendor
    $vendor = 'Adobe Systems Incorporated';
    $appsToRemove = @($products | ? {$_.Vendor -eq $vendor})
    $appsToRemove | %{$_.Uninstall()}

