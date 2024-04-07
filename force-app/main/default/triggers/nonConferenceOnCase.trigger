trigger nonConferenceOnCase on Case (after insert,before update) {

    CaseTriggerHandler handler = new CaseTriggerHandler();

    if(trigger.isAfter){
        if(trigger.isInsert){

            handler.onAfterInsert(trigger.new);
        }
        
    }
        if(trigger.isbefore){
            if(trigger.isUpdate)
            handler.onBeforeUpdate(trigger.new,trigger.oldMap);

        }
 

}