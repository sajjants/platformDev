public class ObjectRetrieveData {
    public List<SelectOption> getObjNames() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('None','None'));
        List<Schema.SobjectType> gd = Schema.getGlobalDescribe().values();
        For(Schema.SobjectType obj:gd) {
            options.add(new SelectOption(obj.getDescribe().getName(),obj.getDescribe().getName()));
        }
        return options;
        
    }

}