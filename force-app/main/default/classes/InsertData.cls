public class InsertData {
    
    public static ID oppData(String name, String Rating){
        Account opp1 = new Account();
        opp1.Name = name;
        opp1.Rating = Rating;
        system.debug('data inserted' + opp1);
        insert opp1;    // Record Inserted/Created in Org
        return opp1.Id;
    }
    public static void prodData(){
        Id opp2;
        opp2 = oppData('sami','hot');
        Contact con = new Contact(FirstName = 'jill', LastName = 'jack');
        con.AccountId = opp2;
        insert con;
    }
    public static void insertContactWithOpp(String name, String StageName){
        Account opp1 = new Account();
        opp1.Name = name;
        opp1.Rating = StageName;
        system.debug('data inserted' + opp1);
        insert opp1;
        
        Contact con = new Contact(FirstName = 'jill', LastName = 'jack');
        con.AccountId = opp1.id;
        insert con;
        
        Opportunity ops = new Opportunity();
        ops.Name ='sanioyo';
        ops.CloseDate = system.today();
        ops.StageName = 'Prospecting';
        ops.AccountId = opp1.id;
        insert ops;
        
        Case case1 = new Case();
        case1.Status = 'Working';
        case1.AccountId = opp1.id;
        insert case1;
    }
    
}