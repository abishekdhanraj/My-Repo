public class soqlDemo {
public static void iterateTwoDimensionalArray() {                  
    // Two Dimensional List by using list of list i.e A list contining another List(Nested List)
    List<List<Account>> accounts = new List<List<Account>>{
        new List<Account>{
            new Account(Name = 'Account 1', Industry = 'Industry 1'),
                new Account(Name = 'Account 2', Industry = 'Industry 2'),
                new Account(Name = 'Account 3', Industry = 'Industry 3')
                },
                    new List<Account>{
                        new Account(Name = 'Account 4', Industry = 'Industry 4'),
                            new Account(Name = 'Account 5', Industry = 'Industry 5'),
                            new Account(Name = 'Account 6', Industry = 'Industry 6')
                            },
                                new List<Account>{
                                    new Account(Name = 'Account 7', Industry = 'Industry 7')
                                        }
    };
        
        System.debug(accounts);
    
    for(Integer i = 0; i < accounts.size(); i++) {
        for(Integer j = 0; j < accounts[i].size(); j++) {
            Account acc = accounts[i][j];
            System.debug('Account Name: ' + acc.Name);
            System.debug('Industry: ' + acc.Industry);
        }
    }
}
public static void twoDimentionalList(){
    /* List<List<Integer>> source = new List<List<Integer>>{new List<Integer>{11,22,33},new List<Integer>{44,55,66},new List<Integer>{77,88,99}};
//this is how you iterate through two dimensional array.
for(Integer i=0;i <source.size()>0;i++){

}
if(!source.isEmpty()){
system.debug(source);
}*/
    List<List<string>> Wdays = new List<List<string>>{new List<String>{'Monday', 'Tuesday', 'Wednesday'},new List<String>{'Thrusday', 'Friday', 'Saturday'},new List<String>{'Sunday'}};
        system.debug(Wdays); 
    //this is how you iterate through two dimensional array.
    for(Integer i=0;i < Wdays.size();i++)
        for(Integer j=0;j < Wdays[i].size();j++)
    {
        String val = Wdays[i][j];
        System.debug(val);                
    }
}
public static void parentToChildRelationShip(){
    
    List<Account> newlst = new List<Account>();
    newlst = [SELECT Id, Name,(SELECT Id, Name, FirstName, LastName From Contacts) FROM Account WHERE Rating = 'Hot']; // Parent to Child Relationshp query
    
    for(Account ac1 : newlst){
        system.debug('the account list is ' + ac1.Name);
        for(Contact con : ac1.Contacts){                // here contracts are used as field 
            system.debug(con.FirstName + '' + con.LastName);
        }
    }
}
public static void loopQuery(){
    List<Account> lstOfAcc = new List<Account>();
    for(Account acc : [SELECT Id, Name FROM Account LIMIT 5 ]){  
        system.debug(acc);
        //SELECT Id, Name,(SELECT Id, Name, FirstName, LastName FROM Contacts) FROM Account WHERE Name LIKE 's%' ---> this is used for parent to child relationship quries
    }
}
public static void likeDemo(){
    String s = 'test';
    s ='%' + s + '%';                                      // '%' used for concatnate the variable and to show the values present in the variable 
    system.debug('the names are' + s);
    List<Account> acclst1 = [SELECT Id, Name FROM Account WHERE Name LIKE : s];
    system.debug('the names are' + s);
    //SELECT COUNT(Name),Id FROM Account WHERE Name LIKE 's%' GROUP BY Id ----> used in Query Editior for grouping the id with name and count the records avaialbe
}
public static void aggDemo(){
    AggregateResult[] groupedResults = [SELECT sum(Amount)amt, Account.Name FROM Opportunity GROUP BY Account.Name];
    system.debug(groupedResults);
    for(AggregateResult ar : groupedResults){
        system.debug('Account Id =' + ar.get('Name')); // 'Name' is used get the Field name  
        system.debug('sum of amount is = ' + ar.get('amt'));  // 'amt' is used to get the value of amount(amt)
    }
}
public static void demosoql(){
    
    Integer amount = 10000000;
    //List<Account> newlst = [SELECT Id, Name, Type, AnnualRevenue FROM Account WHERE AnnualRevenue <=: amount];    // This Sign is Defines --> :(colon)defines Variable name
    // AND <=: Greater than andd Lesser than
    Set<Id> acclst = new Set<Id>();                  // Created a SET
    List<Account> newlst = [SELECT Id FROM Account LIMIT 10];    //List of query
    Map<Id, Account> qlMap = new Map<Id, Account>();
    for(Account acc : newlst){                                   //Loop Display the list of account one by one
        acclst.add(acc.Id);                                      // adding acc id inside set 
        qlMap.put(acc.Id,acc);
    }
    List<Account> sol = [SELECT Id, Name, AnnualRevenue FROM Account WHERE Id IN: qlMap.values()];  // based on the Id list is created 
    if(!sol.isEmpty()){
        for(Id mop : qlMap.keyset()){
            system.debug(mop);
            for(Account nop : qlMap.values()){
                system.debug(nop);
            }
        }
    }
}
public static void mapquery(){
    
    // Populate map from SOQL query
    Map<ID, Account> m = new Map<ID, Account>([SELECT Id, Name FROM Account LIMIT 10]);
    // After populating the map, iterate through the map entries
    for (ID idKey : m.keyset()) {
        Account a = m.get(idKey);
        System.debug(a);
    }
}

}