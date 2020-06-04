public class AccountCustomerController {

    public PageReference save() {
        update (account);
        return null;
    }
    public Account account;
    public AccountCustomerController() {
        account = [SELECT Id, Name, Site
                   FROM Account
                   WHERE Id=:ApexPages.currentPage().getParameters().get('Id')];
        }
    public Account getAccount() {
        return account;
        }
  }