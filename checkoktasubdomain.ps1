Write-Output 'Enter the name of the domain you want to check, for example: test.okta.com, test.oktapreview.com, test.okta-emea.com'
$domain = Read-Host
$answer = resolve-dns $domain | select-object Answers
$countOfRecords =  $answer.Answers.DomainName.Original | ConvertTo-Json | ConvertFrom-Json

if ($domain.EndsWith('.okta.com') -OR $domain.EndsWith('.oktapreview.com') -OR $domain.EndsWith('.okta-emea.com')) {
    if ($countOfRecords.Length -eq 5) {
        Write-Output 'The domain is already used'
    }else {
            Write-Output 'The domain is NOT currenly used'
        }
}else {
    Write-Output 'This is not a supported okta domain, please use *<okta/oktapreview/okta-emea>.com'
}