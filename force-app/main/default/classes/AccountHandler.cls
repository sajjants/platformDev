public class AccountHandler {
    public static void insertAccount(Integer value) {
        List<Account> addAccounts = new List<Account>();
        Integer counter = 1;
        While(counter<=value) {
            Account acc = new account();
			acc.Name = 'Acme Inc '+ counter;
            acc.AccountNumber = 'A000'+counter;
            addAccounts.add(acc);
            counter++;
        }
        Insert addAccounts;
    }

}