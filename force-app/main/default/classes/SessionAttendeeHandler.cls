public class SessionAttendeeHandler {
    
    Public static void OnBeforeInsert(List<Session_Attendee__c> newList){
      
        Map<id,Session_Attendee__c> sessMap= new Map<id,Session_Attendee__c>();
    
        for(Session_Attendee__c ses:newList){
           sessMap.put(ses.LU_Attendee__c,ses);
       }
       Map<id,Session__c> session=new Map<id,Session__c>([Select id,Max_Capacity__c from Session__c where Id IN (Select LU_Session__c from Session_Attendee__c where Id IN:sessMap.keySet())]);
       	integer SessAtt=[Select Count() from Session_Attendee__c where id IN:sessMap.keySet()];
      
       
     for(Session_Attendee__c ss: newList){
            if(session.get(ss.Id).Max_Capacity__c <SessAtt){
                ss.addError('Attendees can`t be added to a session,due to capacity of the session is full');
            }
            
	}
   
        
      
        
           
        }
        
       
        
        
        
        
        
        
    }