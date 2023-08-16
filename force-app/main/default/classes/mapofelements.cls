public class mapofelements {
    public static void mapOfListWithLoop(){                  // Map With For Loop//
        List<Account> accmap = new List<Account>();
        accmap = [SELECT Id, Name FROM Account LIMIT 6];
        Map<Id,Account> maplst = new Map<Id,Account>();
        for(Account acc :accmap){
            maplst.put(acc.Id,acc);
        }
        system.debug('map1 contains ' + maplst);
        system.debug('map2 contains ' + maplst.keySet());
        system.debug('map3 contains ' + maplst.values());
    }
    public static void mapOfListWithoutloop(){        //Map without for loop// 
        List<Account> accmap = new List<Account>();
        accmap = [SELECT Id, Name FROM Account LIMIT 6];
        Map<Id,Account> maplst = new Map<Id,Account>(accmap);   // Passing the List //
        system.debug('map1 contains ' + maplst);
        system.debug('map2 contains ' + maplst.keySet());
        system.debug('map3 contains ' + maplst.values());
    }
    public static void lsit_map(){              // List of Map//
        List<Account> map_lst = new List<Account>();
        Map<Id,Account> map_acc = new Map<Id,Account>();
        map_lst = [Select Name, Id, NumberofLocations__c,CreatedDate FROM Account LIMIT 3];
        system.debug('lsit of map are ' + map_lst);
        map_acc.putAll(map_lst);
        system.debug('lsit of map are ' + map_lst);
    }
    public static void newMap(){
        Map<Integer,String> mapof = new Map<Integer,String>();
        Map<Integer,String> mapof1 = new Map<Integer,String>();
        mapof.put(1,'orange');
        mapof.put(2,'red');
        mapof.put(3,'blue');
        system.debug('map contains ' + mapof);
        mapof.put(1,'yellow');
        system.debug('map contains ' + mapof);
        mapof1.put(4,'lavander');
        mapof.putAll(mapof1);
        system.debug('map contains ' + mapof);
    }
}