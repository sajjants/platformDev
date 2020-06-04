global class LeadProcessor implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id, LeadSource FROM Lead';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope) {
        List<Lead> toUpdate = new List<Lead>();
        For(Lead l: scope) {
            l.LeadSource = 'Dreamforce';
            toUpdate.add(l);
        }
        Update toUpdate;
    }
    global void finish(Database.BatchableContext bc) {
        
    }       

}