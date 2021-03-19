$userId = Read-Host "Who are you?"
do
{
    Clear-Host
    [Int16]$isNewChat = Read-Host "Is this a new chat? (Answer: 1=Yes | 2=No)" 
}
While($isNewChat -ne 1 -and $isNewChat -ne 2)

if($isNewChat -eq 1)
{
    $filePath = Read-Host "where would you like to store your new chat"
    New-Item -Path $filePath
}
elseif ($isNewChat -eq 2) 
{
    $filePath = Read-Host "Where is your chat located" 
}

do
{
    Clear-Host
    Get-Content $filePath | Select-Object -Last 10
    $message = Read-Host "Type Message (Enter=Refresh)"
    if($message.Length -gt 0)
    {
        Add-Content -Path $filePath -Value $($userId + " - " + $message)
    }
}
while ($true)
