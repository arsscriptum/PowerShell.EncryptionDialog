
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true,Position=0, HelpMessage="The cipher text")]
        [string]$datastr,
        [Parameter(Mandatory = $false,Position=1, HelpMessage="The password")] 
        [string]$passwd="secret"
    )
    $Result = ''
    $datastr = $datastr.Trim()
    try{
        $Decrypt = $datastr | ConvertTo-SecureString
        $Result = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Decrypt))
    }catch{
        $Result = "<ERROR OCCURED>"
        Write-Error $_
    }
    $Result

