/* Created By Abishek
* for
* Testing Trigger*/

trigger ApexTrigger on Account (before insert,after insert,before update,after update) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            /*for(Account acc : Trigger.new){
acc.Description = 'Account has been Created';
system.debug( 'record ids are ' + acc);
}*/
            ApexTriggerHandler.updateTrigger(Trigger.new); // used to trigger whenever a Account Created, Desceprtion will be updated to 'Account is Verified'. 
            ApexTriggerHandler.populateTrigger(Trigger.new, null); // used to Trigger whenever a Account Created and Industry is 'Media' then Populate Rating = 'Hot'.
            
        }
        else if(Trigger.isAfter){
            ApexTriggerHandler.opportunityCreation(Trigger.new); // used to Trigger Whenever a Account Created related Opportunity will also be created.
            system.debug(' The Trigger is '  +  Trigger.isAfter);
            system.debug(' The Trigger is '  +  Trigger.isBefore);
            system.debug(' The Trigger is '  +  Trigger.isInsert);
        }
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            ApexTriggerHandler.phoneUpdate(Trigger.new,Trigger.oldMap);
            ApexTriggerHandler.populateTrigger(Trigger.new,Trigger.oldMap);
             system.debug(' The Trigger is '  +  Trigger.isBefore);
            system.debug(' The Trigger is '  +  Trigger.isBefore);
            }else if(Trigger.isAfter){
            ApexTriggerHandler.createRelatedopp(Trigger.new,Trigger.oldMap);
                system.debug(' The Trigger is '  +  Trigger.isAfter);
        }
    }   
    
}