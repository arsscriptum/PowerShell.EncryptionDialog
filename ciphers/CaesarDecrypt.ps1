<#
#̷𝓍   𝓐𝓡𝓢 𝓢𝓒𝓡𝓘𝓟𝓣𝓤𝓜
#̷𝓍   🇵​​​​​🇴​​​​​🇼​​​​​🇪​​​​​🇷​​​​​🇸​​​​​🇭​​​​​🇪​​​​​🇱​​​​​🇱​​​​​ 🇸​​​​​🇨​​​​​🇷​​​​​🇮​​​​​🇵​​​​​🇹​​​​​ 🇧​​​​​🇾​​​​​ 🇬​​​​​🇺​​​​​🇮​​​​​🇱​​​​​🇱​​​​​🇦​​​​​🇺​​​​​🇲​​​​​🇪​​​​​🇵​​​​​🇱​​​​​🇦​​​​​🇳​​​​​🇹​​​​​🇪​​​​​.🇶​​​​​🇨​​​​​@🇬​​​​​🇲​​​​​🇦​​​​​🇮​​​​​🇱​​​​​.🇨​​​​​🇴​​​​​🇲​​​​​
#>

    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $True,Position=0, HelpMessage="The plain text to encrypt")]
        [string]$Cipher,
        [Parameter(Mandatory = $false,Position=1, HelpMessage="The password")] 
        [string]$Password="secret"
    )
    Write-Verbose "CaesarDecrypt `"$Cipher`" `"$Password`""
    . "$PSScriptRoot\CaesarDefinition.ps1"
    if(-not 'Caesar' -as [Type]){
        Write-Verbose "Add-Type -TypeDefinition Ceasar"
        Add-Type -TypeDefinition $Ceasar
    }

    $Result = [Caesar]::Decrypt($Cipher,$Password)
    $Result



