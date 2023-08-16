public class setClass {
    public static void setOfElements(){ 
        Set<Integer> ins_lst = new Set<Integer>();
        List<Integer> ins_set = new List<Integer>();
        ins_lst.add(20);
        ins_lst.add(20);
        ins_lst.add(10);
        ins_lst.add(23);
        ins_set.add(45);
        ins_set.addAll(ins_lst);
        system.debug('the set of elements are ' + ins_lst);
        system.debug('the set of elements are ' + ins_set);
    }
    public static void addingLstIntoSet(){
        Set<Id> contactIds = new Set<Id>();
        List<Account> accLst = new List<Account>();
        
        accLst= [SELECT Id, Name FROM Account LIMIt 5];
        
        for(Account con : accLst){
            contactIds.add(con.Id);
            
            system.debug('set contains =' + contactIds);
        }
    }
    
}