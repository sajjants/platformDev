@isTest
public class TestCustomerTriggerHelper {
    @isTest static void createInvoicetest() {
        List<APEX_Customer__c> cusList = new List<APEX_Customer__c>();
        For(Integer i=0; i<100; i++) {
            APEX_Customer__c cus = new APEX_Customer__c();
            cus.Name = 'Test Customer '+i;
            cus.APEX_Active__c = True;
            cus.APEX_Customer_Status__c = 'Inactive';
            cusList.add(cus);            
        }
        insert cusList;
        List<APEX_Customer__c> updateCustomers = [SELECT Id, APEX_Customer_Status__c
                                                  FROM APEX_Customer__c
                                                  WHERE Id IN:cusList];
        List<APEX_Customer__c> toUpdateCustomer = new List<APEX_Customer__c>();
        For(APEX_Customer__c c:updateCustomers) {
            c.APEX_Customer_Status__c = 'Active';
            toUpdateCustomer.add(c);
        }
        Test.startTest();
        Update toUpdateCustomer;
        Test.stopTest();
		List<APEX_Invoice__c> invoicesCreated = [SELECT Id, Apex_Customer__c, APEX_Description__c
         										 FROM APEX_Invoice__c
         										 WHERE APEX_Customer__c IN:toUpdateCustomer];
		System.assertEquals(100, invoicesCreated.size());
        For(APEX_Invoice__c Inv:invoicesCreated) {
            System.assertEquals('Updated through the trigger', Inv.APEX_Description__c);
        }       
    }
    @isTest static void createInvoicetest1() {
        List<APEX_Customer__c> cusList = new List<APEX_Customer__c>();
        For(Integer i=0; i<100; i++) {
            APEX_Customer__c cus = new APEX_Customer__c();
            cus.Name = 'Test Customer '+i;
            cus.APEX_Active__c = True;
            cus.APEX_Customer_Status__c = 'Inactive';
            cusList.add(cus);            
        }
        insert cusList;
        List<APEX_Customer__c> updateCustomers = [SELECT Id, APEX_Customer_Status__c
                                                  FROM APEX_Customer__c
                                                  WHERE Id IN:cusList];
        List<APEX_Customer__c> toUpdateCustomer = new List<APEX_Customer__c>();
        For(APEX_Customer__c c:updateCustomers) {
            c.APEX_Customer_Status__c = 'Paid';
            toUpdateCustomer.add(c);
        }
        Test.startTest();
        Update toUpdateCustomer;
        Test.stopTest();
		List<APEX_Invoice__c> invoicesCreated = [SELECT Id, Apex_Customer__c, APEX_Description__c
         										 FROM APEX_Invoice__c
         										 WHERE APEX_Customer__c IN:toUpdateCustomer];
		System.assertEquals(0, invoicesCreated.size());
              
    }
}