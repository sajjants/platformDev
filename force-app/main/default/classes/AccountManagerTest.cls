@IsTest
private class AccountManagerTest {
    @isTest static void testGetAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        Request.requestUri = 'https://ap15.salesforce.com/services/apexrest/Accounts/'+recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test Account', thisAccount.Name);
    }
    static Id createTestRecord() {
        // Create test record
        Account accTest = new Account(Name='Test Account');
        insert accTest;
        Contact TestCon= new Contact(LastName='Test', AccountId = accTest.id);
        insert TestCon;
        return accTest.Id;
    }          
}