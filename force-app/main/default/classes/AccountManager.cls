@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the account Id from the end of the URL
        String accId = request.requestURI.substringBetween('Accounts/','/contacts');
        System.debug(accId);
        Account result = [SELECT Id, Name,(SELECT Id, Name FROM Contacts)
                          FROM Account
                          WHERE Id = :accId];
        return result;
    }
}