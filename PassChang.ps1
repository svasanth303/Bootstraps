# --- 1. Import Module and CSV ---
Import-Module ActiveDirectory
$Resetpassword = Import-Csv "c:\UserList.csv"
 
# --- 2. Process Users ---
foreach ($Account in $Resetpassword) {
    # Convert the plain text password to a secure string for the cmdlet
    $SecurePassword = ConvertTo-SecureString $Account.Password -AsPlainText -Force
    
    # Optional: Display the account currently being processed
    Write-Host "Resetting password for: $($Account.sAMAccountName)"
    
    # Reset the password and use the -Reset parameter for administrative reset
    Set-ADAccountPassword -Identity $Account.sAMAccountName -NewPassword $SecurePassword -Reset
}

# --- 3. Final Output (Corrected Syntax) ---

# Get the total count of users processed from the imported variable
$total = $Resetpassword.Count

Write-Host "`nPasswords changed for $total accounts."
Write-Host "Accounts passwords have been reset successfully." -ForegroundColor Green