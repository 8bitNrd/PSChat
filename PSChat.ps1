do
{
    Clear-Host
    $userId = Read-Host "Who are you?"
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
    $filePath = Read-Host "Wher is your chat located" 
}

do
{
    Clear-Host
    Get-Content $filePath | Select-Object -Last 10
    [Int16]$action = Read-Host "Select Action (1=refresh | 2=New Mesage)"
    if($action -eq 1)
    {
        Get-Content $filePath | Select-Object -Last 10
    }
    elseif ($action -eq 2)
    {
        $newMessage =  Read-Host "Type New Message: "
        Add-Content -Path $filePath -Value $($userId + " - " + $newMessage)

    }
    
}
while ($true)
