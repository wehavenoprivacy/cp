# Password Policy

## Viewing Password Policy
    net accounts

Sample output:

    C:\Windows\System32>net accounts
    Force user logoff how long after time expires?:       Never
    Minimum password age (days):                          0
    Maximum password age (days):                          42
    Minimum password length:                              0
    Length of password history maintained:                None
    Lockout threshold:                                    Never
    Lockout duration (minutes):                           30
    Lockout observation window (minutes):                 30
    Computer role:                                        WORKSTATION
    The command completed successfully.

    C:\Windows\System32>

## Updating the Password Policy

### Force Logoff
Sets the number of minutes a user has before being fored to log off when the account expires or valid logon hours expire.
    net accounts /forcelogoff:60

### Minimum password length
    net accounts /minpwlen:8

### Password Age
Sets the minimum number of days that must pass before a user can change a password.

    net accounts /minpwage:0
    
Sets the maximum number of days that a password is valid. No limit is specified by using `UNLIMITED`. `/MAXPWAGE` can't be less than `/MINPWAGE`.

    net accounts /maxpwage:90
    
### Lockout
Sets the maximum number of invalid logon attempts before the user's account is automatically locked out.

    net accounts /lockoutthreshold:5
    
Sets the number of minutes to observe invalid logon attempts.

    net accounts /lockoutwindow:720

Sets the number of minutes for the lockout duration.

    net accounts /lockoutduration:720


