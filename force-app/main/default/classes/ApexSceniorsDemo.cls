public class ApexSceniorsDemo {
    public Static void employeeSceniro(){
        List<Account> emp_Lst = new List<Account>();
        emp_Lst = [SELECT Id, Name,Total_Salary__c,(SELECT Id, Name, Phone__c, Salary__c FROM Employees__r) FROM Account WHERE CreatedDate = THIS_YEAR];
        if(!emp_Lst.isEmpty()){
              /*for(Account at :emp_Lst){
                Decimal total = 0;
                for(Employee__c opp : at.Employees__r){
                    if(opp.Salary__c != null){
                        total = total + opp.Salary__c;
                    }
                    system.debug( at.Name + ' has ' +  total  +  'Salary of Employee' );
                }
                  
            }*/
            list<Account> lstAcc = new  list<Account>();
            integer total;
            
            for(Account acc :[Select id,Name from Account ]){
                Decimal count=0;
            for(Employee__c ep : [Select id,Salary__c from Employee__c where Account__c =: acc.Id]){
                if(ep.Salary__c!=null){
                    count += ep.Salary__c;
                }
            }
               Account temp = new Account();
                temp.Id = acc.Id;
               temp.Total_Salary__c = count;
               lstAcc.add(temp);
            }
            
           update lstAcc;            
            //update emp_Lst;
        }
    }
    public static void apexscenios1(){
        List<Account> account_lst = new List<Account>();
        account_lst =[SELECT Id, Name, CreatedDate ,(SELECT Id, Name FROM Contacts) FROM Account WHERE Phone != null];
        if(!account_lst.isEmpty()){
            for(Account at :account_lst ){
                system.debug( at.Name + ' has ' +  at.Contacts.size()  +  'contacts are related' );
            }
        }
    }
    public static void apexsceniro2(){
        List<Account> relativerecord = [SELECT Id, Name, Phone FROM Account WHERE Phone = '654321'];
        if(!relativerecord.isEmpty()){
            for(Account ac1 : relativerecord){
                ac1.Name = 'sam';
                ac1.Phone = '123456';
            }
        }
        for(Integer i= 0; i<5;i++){                           //For Loop to bulify the records
            Account acc2 = new Account();
            acc2.Name='Test keerthi' + i;                                   
            acc2.Active__c = 'yes';
            relativerecord.add(acc2);
        }
        if(!relativerecord.isEmpty()){
            upsert relativerecord;
        }
    }
    public static void apexcsecnario3(){
        List<Account> account_lst1 = new List<Account>();
        account_lst1 =[SELECT Id, Name,(SELECT Id, Name, Amount FROM Opportunities) FROM Account WHERE Phone != null];
        if(!account_lst1.isEmpty()){
            for(Account at :account_lst1){
                Decimal total = 0;
                for(Opportunity opp : at.Opportunities){
                    if(opp.Amount != null){
                        total = total + opp.Amount;
                    }
                    system.debug( at.Name + ' has ' +  total  +  'worth of Opportunities' );
                }
            }
        }
    }
    public static void apexscenario4(){
        List<Opportunity> opp_lst =[SELECT Id, StageName FROM Opportunity
                                    WHERE CreatedDate = THIS_YEAR];
        if(!opp_lst.isEmpty()){
            for(Opportunity opp :opp_lst ){
                if(opp.StageName == 'Closed Won'){
                    opp.Description = 'Opportunity is Closed Won';
                }else if(opp.StageName == 'Closed Lost'){
                    opp.Description = 'Opportunity is Closed Lost';
                }else{
                    opp.Description = 'Opportunity is Open';
                    system.debug( 'Opportunity updated are' + opp);
                }
            }
        }
        update opp_lst;
    }
    public static void apexscenerio5(){
        List<Account> rec_Lst = new List<Account>();
        rec_Lst =[SELECT Id,(SELECT Id FROM Contracts) FROM Account WHERE CreatedDate = THIS_YEAR];
        if(!rec_LSt.isEmpty()){
            for(Account acc : rec_Lst){
                acc.Total_Contacts__c = acc.Contracts.size();
                system.debug( ' The Number of Contacts are '  + acc);
            }
            update rec_Lst;
        }
    }
    public static void apexscenrio6(){
        List<Contact> conLst = new List<Contact>();
        conLst=[SELECT Id, MobilePhone, Account.Phone FROM Contact WHERE CreatedDate = THIS_YEAR];
        if(!conLst.isEmpty()){
            for(Contact con : conLst){
                if(con.MobilePhone == null && con.Account.Phone != null){
                    con.MobilePhone = con.Account.Phone;
                    system.debug('the Phone are' + con);
                    system.debug( ' the updated list are '  + conLst);
                }
            }
            update conLst;
        }
    }
    public Static void SalaryCount(){
        //Account acclist = [Select id,Total_Salary__c (Select Id, Name,Salary__c from Employees__r )]
        //List<Employee__c> emplist = [Select Id, Name, Salary__c, Account__c from Employee__c Where Account__c!=null ];
        //List<Account> acclist = [SELECT Id, Name,Total_Salary__c,(SELECT Id, Name, Phone__c, Salary__c FROM Employees__r Where Account__c!=null ) FROM Account WHERE CreatedDate = THIS_YEAR];
        Map<Id, list<Employee__c>> tsl = new Map <Id, list<Employee__c>>();
        for (Account acc : [SELECT Id, Name,Total_Salary__c,(SELECT Id, Name, Phone__c, Salary__c FROM Employees__r Where Account__c!=null ) FROM Account WHERE CreatedDate = THIS_YEAR ]){
            If(!acc.Employees__r.isEmpty()){
                System.debug(acc.Employees__r);
                list<Employee__c> a = new list<Employee__c>{};
                    a.addall(acc.Employees__r);
                    //SObjectType r = ((SObject)(Type.forName('Schema.'+objectName).newInstance())).getSObjectType();
                    //System.debug((acc.Employees__r));
                tsl.put(acc.Id,a);
            }
        }
        System.debug('tsl-->'+tsl);
        Map<Id, Decimal> Salary = new Map<Id,Decimal>();
        for(Id emp : tsl.keyset()){
            Decimal Salarycount = 0;
            for(Employee__c empl : tsl.get(emp)){
                Salarycount += empl.Salary__c;
            }
            Salary.put(emp,Salarycount);            
        }
        list<Account> lstupdate = new list<Account>();
        for(Id ids :Salary.keyset()){
            Account a = new Account();
            a.Id= ids;
            a.Total_Salary__c = Salary.get(ids);
            lstupdate.add(a);
            System.debug('Final'+a.id+'Sal'+a.Total_Salary__c);
        }
        if(!lstupdate.isempty()){
            update lstupdate;
        }
        
    }
}