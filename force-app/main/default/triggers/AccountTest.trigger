trigger AccountTest on Account (before insert, after insert) {
    if(trigger.isAfter){
        list<Account> lstacc = new list<Account>();
        Account acc1 = new Account();
        for(Account acc : trigger.new){
            
            acc1.Name = acc.Name;
            acc1.Id = acc.id;
            
        }
        
            Opportunity opp = new Opportunity();
            opp.Name = acc1.Name;
            opp.StageName = 'Prospecting';
            opp.AccountId = acc1.id;
            opp.CloseDate = date.today();
            insert opp;
    }
}