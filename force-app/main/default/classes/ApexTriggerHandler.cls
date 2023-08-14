/*
*  Created by:- Abishek ND
*  Description:- 
*  Created Date:- 
*  Last Modified Date:- 
*/
public with sharing class ApexTriggerHandler {
    public static void createRelatedopp(List<Account> accLst,Map<Id,Account>OldMaplst){   // Passing a list and a map 
        // Created a list
        List<Contact> Conlst = new List<Contact>();  
        // Created a Map
       // Map<Id,Account> maplst = new Map<Id,Account>();    
       // Created a set of Id
        Set<Id> accids = new Set<Id>();
        // Created loop to check whether phone field is updated or not
        for(Account acc : accLSt){        
            if(acc.Phone != OldMaplst.get(acc.Id).Phone){
               // maplst.put(acc.Id, acc);
               accids.add(acc.id);
            }
        }
        // Created using MAP//
        /*for(Contact con :[SELECT Id, HomePhone, AccountId FROM Contact WHERE AccountId IN : maplst.keyset()]){
            if(maplst.containskey(con.AccountId)){
                con.HomePhone = OldMaplst.get(con.AccountId).Phone;
                conlst.add(con);
            }
        }*/
        // Created using SOQL Query //
        // Quering parent to child 
        for(Account acc :[SELECT id,Phone,(SELECT id,HomePhone FROM Contacts)FROM Account WHERE id IN :accids]){
            if(acc.Contacts != null){
                for(Contact con : acc.Contacts){
                    con.HomePhone = acc.Phone;
                    Conlst.add(con);
                }
            }
            
        }
        // To Checck wheteher the is list is empty or not
        if(!conlst.isEmpty()){
            update conlst;  // DML Operation
        }
    }
    public static void populateTrigger(List<Account> accLst,Map<Id,Account>OldMaplst){
        try{
            // form accLst one by one record will be displayed by acc variable
            for(Account acc :accLst){
                if((OldMaplst == null && acc.Industry != null && acc.Industry == 'Media')
                   ||(acc.Industry != OldMaplst.get(acc.Id).Industry && acc.Industry =='Media')){ // Before Insert a record to database
                       acc.Rating = 'Hot';       // after inserting to the database
                   }
            }
        }catch(Exception e){
            System.debug(e.getMessage() + e.getLineNumber());
        }
    }
    public static void phoneUpdate(List<Account> accLst, Map<Id,Account> OldMaplst){
        try{
            for(Account acc : accLst){
                if(acc.Phone != OldMaplst.get(acc.Id).Phone){
                    acc.Description = ' Old values are '  + OldMaplst.get(acc.Id).Phone + ' New values are ' + acc.Phone;
                    system.debug(acc);
                }
            }
        }catch(Exception e){
            System.debug(e.getMessage());
        }
    }
    public static void opportunityCreation(List<Account> accLst){ // Passing List as a Parameter)
        try{
            //looping opps
            List<Opportunity> oppLst = new List<Opportunity>(); // Created a List
            for(Account acc : accLSt){    // for Displaying the List one by one
                Opportunity opp = new Opportunity(); // Creating an Opp Record
                opp.Name = acc.Name;
                opp.StageName = 'Prospecting';
                opp.CloseDate = system.today();
                opp.AccountId = acc.Id;// assinged opportunity Id to Acc Id
                oppLst.add(opp);
            }
            if(!oppLst.isEmpty()){
                
                Insert oppLst; // Inserting the Opportunity List
            }
        }
        catch(exception e){
            system.debug(e.getMessage()); // Catching the Exception Messages
            
        }
    }
    public static void updateTrigger(List<Account> accLst){
        for(Account acc :accLst){
            acc.Description = 'Account is verified';
        }
    }
}
/* public static void populateTrigger(List<Account> accLst){
    for(Account acc :accLst){
        if(acc.Industry != null && acc.Industry == 'Media'){ // Before Insert a record to database
            acc.Rating = 'Hot';       // after inserting to the database
        }
    }
}*/

string all;
integer slot;

    public string getall() {
        return this.all;
    }

    public void setall(string all) {
        this.all = all;
    }

    public integer getslot() {
        return this.slot;
    }

    public void setslot(integer slot) {
        this.slot = slot;
    } 
