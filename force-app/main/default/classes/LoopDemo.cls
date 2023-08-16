public class LoopDemo {
    
    public static void forloopDemo(){
        List<Account> loopList = new List<Account>();         //Created List of Account
        Set<Id> setId = new Set<Id>();                        //Created Set of ID
        Map<Id,Account> acMap = new Map<Id,Account>();        //Created Map of Id and Account 
        loopList = [SELECT Id, Name FROM Account LIMIT 5];    //Query of Account List
        //Iteration of Account List and Display Data and Created Set and Map
        system.debug('Display map using List');
        if(!loopList.isEmpty()){
            for(Account lop1 : loopList){
                System.debug(lop1.id+ '--->' + lop1.Name);
                setId.add(lop1.Id);       // Added Set of id with Add Method & with the Account Lsit 
                acMap.put(lop1.Id,lop1);  // Added Map with Put Method & Account Id( Key) & Account (values)
            }
        }
        //Display IDs through Set
        system.debug('Display map using Set');
        if(!setId.isEmpty()){                   // Itrating  set using set 
            for(Id lop2 : setId){
                System.debug(lop2);
            }
        }
        system.debug('Display map using Keys');
        if(!acMap.isEmpty()){                   // Map used for Itrating keyset 
            for(Id lop3 : acMap.keyset()){
                System.debug(lop3);
            }
        }
        system.debug('Display map using values');
        if(!acMap.isEmpty()){                        //Map used for Itrating Values
            for(Account lop4 : acMap.values()){
                System.debug(lop4);
            }
        }
        
    }
    public static void even(Integer n){             // for Displaying odd Or Even
        for(Integer j = 1;j<=n;j++) {
            if(Math.mod(j, 2) == 0){
                system.debug(j);
            }
        }
    }
    public static void forDemo(){
        for(Integer i = 1;i<10;i++){  //for(value initialization;termination operation;inc/dec)
            system.debug(i);
        }
    }
    public static void table(Integer m){
        for(Integer k = 1; k<=10; k++){
            system.debug(m*k);
        }
    }
}