public class Conditionalclass {
    public static void ternaryOperator(Integer num1, Integer num2){
        Integer result;
        result = num1 > num2 ? num1 :num2;     // ternary operator Expression 1 ? Expression 2 : Expression 3;
        system.debug('the result is '+ result);//                  (Condition)  ?  (true)      : (false)   ;      
    }
    public static void mapNull(){   //using Map null
        List<Account> accOfLst = new List<Account>();
        Account acc = new Account();
        acc.Name = 'shiva';
        acc.Rating ='Cold';
        accOfLst.add(acc);
        insert accOfLst;
        accOfLst = [SELECT Id, Name,CreatedDate,Rating FROM Account WHERE Name = 'shiva'];
        Contact con = new Contact(FirstName = 'jill', LastName = 'jack');
        con.AccountId = acc.id;
        insert con;
        Map<Id,List<Account>> mapOfNull = new Map<Id,List<Account>>();
        If(!mapOfNull.isEmpty()){
            system.debug('the values and keys are--->' +mapOfNull);
        }
        for(Account accMap :accOfLst){
            mapOfNull.put(accMap.Id,accOfLst);
        }
        system.debug('the map of keyset values are' +mapOfNull);
        system.debug('the map of keyset values are' +mapOfNull.keySet());
        system.debug('the map of keyset values are' +mapOfNull.values());
        
    }
    public static void setNull(){          //using set null collections and !(not) operator
        Set<Id> oppLst = new Set<Id>();
        List<Opportunity> lstopp = new List<Opportunity>();
        lstopp = [SELECT Id, Name,CloseDate,Type FROM Opportunity LIMIT 3];
        for(Opportunity op1 : lstopp){
            oppLst.add(op1.Id);
            system.debug('the opportunity list and set is ---?' + lstopp);
        }
        if(!oppLst.isEmpty()){
            system.debug('the set is --->' + oppLst);
        }
    }
    public static void listNull(){                 // list shows opposite if its true it shows false, if its false it shows true
        List<Case> accLst = new List<Case>();
        accLst = [SELECT Id,CaseNumber,CreatedDate FROM Case LIMIT 5];
        if(!accLst.isEmpty()){
            system.debug('the account list is...' + accLst);
        }
    }
    public static void logicalDemo(Integer s1, Integer s2){  // logical && , || operator
        if(s1 <= s2 && s1 == s2){
            system.debug('The s1 value is greater');
        }else{
            system.debug('The s2 value is Smaller');
        }
        
    }
    public static void nestedIfDemo(Integer num){         // nested if and else if condition
        if(num >= 0){
            if(num == 0){
                if(num < 0){
                    system.debug('the number is smaller than to 0');
                }else if(num != 0){
                    system.debug('the number is not equal to 0');
                }else{
                    system.debug('the number is smaller than to 0');
                }
            }else{
                system.debug('the number is not equal to 0');
            }
        }else {
            system.debug('the number is greater than or equal to 0');
        }
    }
    public static void elseIfLadderDemo(Integer num){   // else if condition
        if(num > 0){
            system.debug('the number is positive');
        }else if(num == 0){
            system.debug('the number is zero');
        }else{
            system.debug('the number is negativee');
        }
    }
    public static void ifElseConditional(Integer s,Integer i){ //ifelse condition
        if(s>i){
            system.debug('Number is greater then other');   
        }else{
            system.debug('Number is smaller then other');
        }
        
    }
    public static void mathClass(Integer num){    // math class
        
        if(Math.mod(num,2) == 0){
            system.debug('The number is even');
        }else{
            system.debug('The number is odd');
        }
    }
}