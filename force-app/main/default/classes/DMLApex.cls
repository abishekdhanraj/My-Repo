public class DMLApex {
    public static void databaseClass(){                      //database class methods
        List<Contact> conList = new List<Contact>{
            new Contact(FirstName ='lal',LastName = 'Salam',LeadSource = 'web',Phone = '12345'),
                new Contact(FirstName ='rocky',LastName = 'Salam',LeadSource = 'web',Phone = '1245'),       // Inserting set of records
                new Contact(FirstName ='lal',LastName = 'popoye',LeadSource = 'web',Phone = '1345'),
                new Contact()};                                                                      // Inserting a record without required field
                    Database.SaveResult[] con1 = Database.insert(conList, false);                  //database.SaveResult is default database method
        for(Database.SaveResult sr : con1){           // Itreating the list to display one by one
            if(sr.isSuccess()){
                system.debug('Successfully Inserted the records' + sr.getId());  // if it is success it will get the record IDs
            }else{
                for(Database.Error err : sr.getErrors()){                   // It  will display the GET the ERRORS
                    system.debug('The Errors Occured are Follwing');
                    system.debug(err.getStatusCode()+ '' + err.getMessage());      // it will Get the status of the field and message 
                    system.debug('Contact field that affected the errors' + err.getFields());   // it will get the required missing field
                }
            }
        }
        
    }
    
    public static void deleteDemo(){
        List<Account> listofacc = [SELECT Id, Name FROM Account WHERE Name LIKE 'Test upsert%' ALL ROWS];
        system.debug(listofacc);
        /*if(!listofacc.isEmpty()){
delete listofacc;
system.debug('Records deleted :' +listofacc);
}*/
        
        if(listofacc.size()>0){
            undelete listofacc; 
            system.debug('Records deleted :' +listofacc);                   // Method 2 for Validating whether the list is empty or not
        }
    }
    
    public static void upsertDemo(){
        List<Account> acc_lst1 = new List<Account>();
        acc_lst1 = [SELECT Id,Name,Rating FROM Account
                    WHERE Rating = 'Hot'];
        if(!acc_lst1.isEmpty()){
            for(Account test1 : acc_lst1){
                test1.Name = 'sanjay';
                test1.Industry = 'finance';
            }
        }
        for(Integer i= 0; i<5;i++){                           //For Loop to bulify the records
            Account acc2 = new Account();
            acc2.Name='Test upsert' + i;                                   
            acc2.Active__c = 'yes';
            acc_lst1.add(acc2);
        }
        if(!acc_lst1.isEmpty()){
            upsert acc_lst1;
        }
    }
    public static void insertDemo(){
        List<Account> lstOfAcc = new List<Account>();
        for(Integer i= 0; i<10;i++){                           //For Loop to bulify the records
            Account acc = new Account();
            acc.Name='Test' + i;                                   
            acc.Active__c = 'yes';
            lstOfAcc.add(acc);
        }
        Insert lstOfAcc;                                     // DML Operation outside loop 
        lstOfAcc=[SELECT Id,Name,Rating FROM Account
                  WHERE Rating = 'Hot'];
        if(!lstOfAcc.isEmpty()){                            //to check whether the list is empty or not
            for(Account acc_lst : lstOfAcc){                // Itrate the list of accounts
                acc_lst.Industry='Media';                       // by adding the field the value
                system.debug(acc_lst);
            }
        }
        
        update lstOfAcc;                                // update the list of records 
        /*List<Contact> lstOfCon	= new List<Contact>();
Account acc = new Account();
acc.Name='k';
acc.Active__c = 'yes';
lstOfAcc.add(acc);
Insert lstOfAcc;
Contact con = new Contact();
con.LastName ='ravi';
con.LeadSource = 'web';
con.AccountId = lstOfAcc[0].Id;
lstOfCon.add(con);
Insert lstOfCon;
system.debug('Account id is' + acc.Id);
system.debug('Contact id is ' + con.Id);*/
    }
}