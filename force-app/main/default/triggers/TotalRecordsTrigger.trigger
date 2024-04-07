trigger TotalRecordsTrigger on Session_Attendee__c (Before Insert) {

        if(trigger.isBefore){
                if(trigger.isInsert){
                SessionAttendeeHandler.OnBeforeInsert(trigger.new);
                        }
                 
        
        }
        
    

}