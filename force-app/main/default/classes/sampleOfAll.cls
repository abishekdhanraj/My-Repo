public class sampleOfAll {
    public static void sampleList(){
        List<Contact> con1 = new List<Contact>();
        Contact conlst = new Contact();
        conlst.LastName = 'bhuvi';
        conlst.FirstName = 'kumar';
        con1.add(conlst);
        system.debug('list of sample list is ' + con1);
        insert con1; 
    }
    public static void sampleListAddedToAccount(){
        List<Contact> acclst = new List<Contact>();
        acclst = [SELECT Id, Name, CreatedDate FROM Contact LIMIT 4];
        Map<Id,Contact> mapOfContact  = new Map<Id,Contact>();
        for(Contact acc :acclst){
            mapOfContact.put(acc.Id,acc);
        }
        system.debug('maplist contains are ' + mapOfContact);
        system.debug('maplist contains are ' + mapOfContact.keyset());
        system.debug('maplist contains are ' + mapOfContact.values());
    }
}