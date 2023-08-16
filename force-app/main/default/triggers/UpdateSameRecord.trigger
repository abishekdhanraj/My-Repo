trigger UpdateSameRecord on Contact (before insert,after insert) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            UpdateSameClass.leadSourcePickistUpdate(Trigger.new);
            system.debug(' The trigger is ' + ' ' + Trigger.isInsert);
        }
    }else if(Trigger.isAfter){
        UpdateSameClass.createOpportunities(Trigger.new);
    }
    
}