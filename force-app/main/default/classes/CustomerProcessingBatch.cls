global class CustomerProcessingBatch implements Database.Batchable<sobject> {
    global List<String> email = new list<String>{'sajjan7@gmail.com'}; 
        global Database.QueryLocator start (Database.BatchableContext BC) {
           return Database.getQueryLocator('SELECT Id, Name, APEX_Customer_Status__c, APEX_Customer_Description__c FROM APEX_Customer__c WHERE APEX_Active__C = True');                          
                            
        }
    global void execute(Database.BatchableContext BC, List<Sobject> scope) {
        List<Apex_Customer__c> customerList = (List<APEX_Customer__c>) scope;
        List<APEX_Customer__c> updatedCustomerList = new List<APEX_Customer__c>();
        For(APEX_Customer__c cus:customerList) {
            cus.APEX_Customer_Status__c = 'Paid';
            cus.APEX_Customer_Description__c = 'Updated via Batch Job';
            updatedCustomerList.add(cus);
			System.debug('Records to be updated: '+ updatedCustomerList);            
        }
        if(updatedCustomerList.size() > 0 && updatedCustomerList != null) {
            Database.update(updatedCustomerList);
			System.debug('Records updated successfully are '+ updatedCustomerList);            
        }                      
      
    }
    global void finish(Database.BatchableContext BC) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        AsyncApexJob a = [SELECT TotalJobItems, Status, NumberOfErrors, JobType, JobItemsProcessed, ExtendedStatus, CreatedById, CompletedDate
         				  FROM AsyncApexJob 
         			      WHERE Id=:BC.getJobId()];
        System.debug('Job Id'+ BC.getJobId());
        mail.setToAddresses(email);
        mail.setReplyTo('no-reply@no-reply.com');
        mail.setSenderDisplayName('Apex Batch Processing Module');
        mail.setSubject('Batch Processing '+ a.status);
        mail.setPlainTextBody('The Batch Apex Job processed '+ a.TotalJobItems + 'Batches with '+ a.NumberOfErrors + 'failures' + 'Jobs processed are '+ a.JobItemsProcessed);
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mail});    
               
    }
}