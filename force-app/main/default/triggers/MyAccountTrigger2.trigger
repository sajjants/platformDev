trigger MyAccountTrigger2 on Account (before insert) {
    If(Trigger.isInsert) {
        For (Account a:Trigger.new) {
            System.assertEquals('MyTutorialRack', a.Name);
            System.assertEquals('12345678', a.AccountNumber);
            System.assertEquals(100, a.NumberOfEmployees);
            System.assertEquals(200, a.AnnualRevenue);
        }
    }

}