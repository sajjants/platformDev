public class OlderAccountsUtility {
    public static void updateOlderAccounts() {        
        List<Account> oldAccounts = [SELECT Id, Description 
                                       FROM Account
                                       ORDER BY CreatedDate ASC
                                       LIMIT 5];
        For(Account acct:oldAccounts) {
            acct.Description = 'Heritage Account';
        }
        Update oldAccounts;
    }
}