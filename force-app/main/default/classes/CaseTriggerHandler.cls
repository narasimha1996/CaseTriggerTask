public with sharing class CaseTriggerHandler {
    List<SQX_Nonconformance__c> nonConList=new List<SQX_Nonconformance__c>();
         set<Id> caseIds=new Set<Id>();
    public void onAfterInsert(List<Case> newCase)
    {
     
        if(!newCase.isEmpty()){
           
            for(Case cs:newCase){
            
     		caseIds.add(cs.Id);
               
        } 
            List<Case> caseList = [Select Type, Priority, Subject, Description, CaseNumber,SQX_NC_Reference__c from Case where id IN:caseIds];
            List<Case> casesToUpdate = new List<Case>();
 
            for(Case cs:caseList){     
            if(cs.Type=='Problem' && cs.SQX_NC_Reference__c ==null){
                SQX_Nonconformance__c newNonCon = createNonConformance(cs);
                 
                nonConList.add(newNonCon);
                casesToUpdate.add(cs);
            }
          }
        if(!nonConList.isEmpty()){
         insert nonConList;
         for (Integer i = 0; i < nonConList.size(); i++) {
            casesToUpdate[i].SQX_NC_Reference__c = nonConList[i].Id;
        }
        
   		 }
            if(!casesToUpdate.isEmpty()){
                update casesToUpdate;
            }
 
   	}
 }

   public void onBeforeUpdate(List<Case> newCase, Map<id,Case> oldmapCase)
    {
       List<Case> casesToUpdate = new List<Case>();
        if(!newCase.isEmpty())
        for(Case cs:newCase){
            if(cs.Type !=oldmapCase.get(cs.id).Type && cs.Type == 'Problem' && cs.SQX_NC_Reference__c ==null){
                SQX_Nonconformance__c newNonCon = createNonConformance(cs);
                nonConList.add(newNonCon);
                casesToUpdate.add(cs);
            }

            }
        
        if(!nonConList.isEmpty()){
         insert nonConList;
         for (Integer i = 0; i < nonConList.size(); i++) {
            casesToUpdate[i].SQX_NC_Reference__c = nonConList[i].Id;
        }
        
   		 }
          
        
        
        }

        @TestVisible
        private SQX_Nonconformance__c createNonConformance(Case cs) {
            return new SQX_Nonconformance__c(
                Priority__c = cs.Priority,
                Title__c = cs.Subject,
                Description__c = cs.Description,
                QMS_Reference_Number__c = cs.CaseNumber
            );
        }
        
    }