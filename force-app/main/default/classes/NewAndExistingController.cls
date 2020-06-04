public class NewAndExistingController {
    public Account account{get; set;}
    public NewAndExistingController() {
        Id Id = ApexPages.CurrentPage().getParameters().get('Id');
        account = (Id==null)? new Account():[SELECT Name, Phone, Industry
                                             FROM Account
                                             WHERE Id=:Id];
     }
    public PageReference save() {
        try{
            upsert(account);
           }
        catch(System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
           }
        PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
        return redirectSuccess;
    }
}