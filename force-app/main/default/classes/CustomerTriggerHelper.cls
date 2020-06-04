public class CustomerTriggerHelper {
    public static void isAfterUpdateCall(List<APEX_Customer__c> customerList, Map<Id, APEX_Customer__c> oldMapCustomer) {
        createInvoiceRecords(customerList, oldMapCustomer);
        updateInvoiceDesc(customerList);           
    }
    public static void createInvoiceRecords(List<APEX_Customer__c> customerList, Map<Id, APEX_Customer__c> oldMapCustomer) {
        List<APEX_Invoice__c> invoiceList = new List<APEX_Invoice__c>();
        For(APEX_Customer__c cus:CustomerList) {
            if(cus.APEX_Customer_Status__c == 'Active' && OldMapCustomer.get(cus.Id).APEX_Customer_Status__c == 'Inactive') {
                APEX_Invoice__c inv = new APEX_Invoice__c();
                inv.APEX_Status__c = 'Unpaid';
                inv.APEX_Customer__c = cus.Id;
                invoiceList.add(inv);                
            }
        }
        Insert invoiceList;
    }
    public static void updateInvoiceDesc(List<APEX_Customer__c> customerList) {
        List<APEX_Invoice__c> updateInvoices = new List<APEX_Invoice__c>();
        List<APEX_Invoice__c> invoices = [SELECT Id, Name, APEX_Description__c
                                          FROM APEX_Invoice__c
                                          WHERE APEX_Customer__c IN: customerList];
        For(APEX_Invoice__c invoice:invoices) {
                invoice.APEX_Description__c = 'Updated through the trigger';
                updateInvoices.add(invoice);
            }
        Update updateInvoices;
        }   
              
    }