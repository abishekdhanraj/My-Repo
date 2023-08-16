trigger WorkOrderTrigger on WorkOrder (before insert,after Insert) {
    if(Trigger.isInsert){
        if(Trigger.isAfter){
            WorkOrderHandler.taskUpdateonWorkorder(Trigger.new);
            system.debug( ' The trigger is Inserted and it is ' + Trigger.isAfter);
        }
    }
}