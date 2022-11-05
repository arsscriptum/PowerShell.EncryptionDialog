
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True,Position=0, HelpMessage="The cipher")]
        [string]$plainText,
        [Parameter(Mandatory = $false,Position=1, HelpMessage="The password")] 
        [string]$passwd="secret"
    )
    $seed = 0
    $plainText = $plainText.replace("`n",", ").replace("`r",", ")
    ForEach($p in $passwd.ToCharArray()){$seed += [int]$p}
    $seed = $seed % 20
    $plainTextArray = $plainText.ToCharArray()
    [string]$result=''
    foreach($char in $plainTextArray){
        [int]$charValue = $char
        if ([char]::IsUpper($char)){
            $charValue = $charValue - $seed - 65;
            $charValue = $charValue  % 26 + 65
            $result += [char]($charValue);
        }
        # Encrypt Lowercase letters
        else{
            $charValue = $charValue - $seed - 97;
            $charValue = $charValue % 26 + 97
            $result += [char]($charValue);  
        }
    }
    $result 



