@isTest
public class LeadProcessorTest {
    @testSetup
    public static void testDataSetup() {
        List<Lead> leads = new List<Lead>();
        For(Integer i=0; i<200; i++) {
            Lead l = new Lead();
            l.LastName = 'Test '+i;
            l.Company = 'Company '+i;
            leads.add(l);
        }
        Insert leads;
    }
    @isTest
    public static void LeadProcessorTestMethod() {
        Test.startTest();
        LeadProcessor lP = new LeadProcessor();
        Id batchId = Database.executeBatch(lP);
        Test.stopTest();
        For(Lead l:[SELECT Id, LeadSource FROM Lead]) {
            System.assertEquals('Dreamforce', l.LeadSource);
        }
    }     

}