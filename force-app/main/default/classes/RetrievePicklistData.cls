public class RetrievePicklistData {
    public List<SelectOption> getPickNames() {
        List<SelectOption> options = new List<SelectOption>();
        Schema.DescribeFieldResult fieldResult = Schema.SObjectType.Account.Fields.Type.getSobjectField().getDescribe();
        options.add(new SelectOption('--None--','--None--'));
       
        For(PicklistEntry ent: fieldResult.getPicklistValues()) {
            options.add(new SelectOption(ent.getValue(),ent.getLabel()));            
        }
         return options;
    }

}