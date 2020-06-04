trigger SimpleTrigger on Account (after insert) {
    List<Contact> cons = new List<Contact>();
    For(Account a:Trigger.new) {
        Contact c = new contact();
        c.LastName = a.Name;
        c.AccountId = a.Id;
        cons.add(c);
    }
Insert cons;
}