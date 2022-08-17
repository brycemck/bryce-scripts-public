# bryce-scripts-public
Public-facing repository with some scripts that I've written over the years to handle various macOS tasks.

## Scripts
* disable_mau.sh - Disables Microsoft Auto Updater by untrusting it, making it only available when manually opened.
* ea_audit_mail_accounts.sh - Built to query the db file that hosts all internet accounts and return the ones owned by Mail.app.
* ea_check_app_store_account.sh - Extension attribute that returns the account that the macOS App Store is signed into.
* ea_check_ntp.sh - Extension attribute that returns the Network Time Server that the macOS device is using.
* ea_get_uptime.sh - Returns a formatted uptime as an extension attribute.
* remove_adobe_override.sh - Looks to see if the Adobe override file exists, and if it does, removes it.
* set_ntp_to_google.sh - Ensures that Network-based time (rather than locally-set time) is enabled, and that the Time Server (NTP) is set to time.google.com.
* uninstall_application.sh - Quits and uninstalls an application by its name and its path. Includes error handling.
* wait_for_setup_completion.sh - Loops until dock is active and logged in user isn't `root` or `_mbsetupuser`. For use with enrollment processes to delay the first policy until the Mac is past the Setup Assistant.