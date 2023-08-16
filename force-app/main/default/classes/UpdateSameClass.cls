/*public class UpdateSameClass {
public static void leadSourcePickistUpdate(List<Contact> contLst){
try{
List<Contact> conLst = new List<Contact>();
for(Contact con : conLst){
if(con.LeadSource != null && con.LeadSource == 'web'){
con.Phone = '1234';
}
}
}Catch(Exception e){
system.debug(e.getMessage());
}
}
}*/
public class UpdateSameClass {
    public static void leadSourcePickistUpdate(List<Contact> contLst) {
        try {
            List<Contact> conLst = new List<Contact>();
            for (Contact con : contLst) {
                if (con.LeadSource != null && con.LeadSource == 'Web') {
                    con.Phone = '1234';
                }
            }
            /*if (!conLst.isEmpty()) {
insert conLst; // Insert the updated contacts
}*/
        } catch (Exception e) {
            System.debug(e.getMessage());
        }
    }
    /*public static void updatecontactphone(List<Contact> contLst){
try{
List<Opportunity> oppLst = new List<Opportunity>(); // Created a List
for(Contact co1 : contLst){    // for Displaying the List one by one
Opportunity opp = new Opportunity(); // Creating an Opp Record
opp.Name = co1.Name;
opp.StageName = 'Prospecting';
opp.CloseDate = system.today();
opp.AccountId = co1.Id;// assinged opportunity Id to Acc Id
oppLst.add(opp);
}
if(!oppLst.isEmpty()){

Insert oppLst; // Inserting the Opportunity List
}
}catch (Exception e) {
System.debug(e.getMessage());
}
}*/
    
    public static void createOpportunities(List<Contact> newContacts) {
        List<Opportunity> opportunitiesToInsert = new List<Opportunity>();
        
        
        if (newContacts[0].LeadSource != null && newContacts[0].LeadSource == 'web') {
            Opportunity opp = new Opportunity();
            opp.Name = newContacts[0].Name;
            system.debug(opp.Name);
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            opp.Contact__c =newContacts[0].Id;
            opp.AccountId = newContacts[0].Id;// Linking the Opportunity to the Contact
            opportunitiesToInsert.add(opp);
            system.debug(opportunitiesToInsert);
        }
        
        
        // Perform the bulk insert operation
        if(!opportunitiesToInsert.isEmpty()) {
            insert opportunitiesToInsert;
        }
    }
    
    
}