global class Batchclass implements Database.Batchable<sobject>{
    
    global Database.queryLocator start(Database.BatchableContext bc){
       string query='Select id,Name from Account';
        return database.getQueryLocator(query);
    }
    
    global void Execute(Database.BatchableContext bc, List<Sobject> scope ){
        
    }
    global void finish(Database.BatchableContext bc){
        
    }

}