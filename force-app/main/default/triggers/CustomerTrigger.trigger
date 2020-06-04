trigger CustomerTrigger on APEX_Customer__c (after update) {
    If(trigger.isAfter) {
        CustomerTriggerHelper.isAfterUpdateCall(Trigger.new, Trigger.OldMap);        
    }                       
 }