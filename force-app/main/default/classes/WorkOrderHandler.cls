/* Created by Abishek
* for 
* Testing 
*/
public class WorkOrderHandler {
    public static void taskUpdateonWorkorder(List<WorkOrder> workLst){
        try{
            List<Task> tsk_Lst = new List<Task>();
            List<Contact> con = new List<Contact>();
            Contact conlst = new Contact(FirstName = 'jill', LastName = 'jack');
            con.add(conlst);
            insert con;
            for(WorkOrder work : workLst){
                Task t = new Task();
                t.Subject = 'Call';
                t.WhoId = con[0].Id;
                t.ActivityDate = system.today();
                t.Status = 'In Progress';
                t.Priority = 'High';
                t.WhatId = work.Id;
                t.OwnerId = UserInfo.getUserId();
                tsk_Lst.add(t);
                System.debug( ' The task has been Created ' + t);
                
            }
            if(!tsk_lst.isEmpty()){
                Insert tsk_Lst;
            }
        }
        catch(exception e){
            System.debug(e.getMessage());
            System.debug(e.getLineNumber());
        }
    }
}