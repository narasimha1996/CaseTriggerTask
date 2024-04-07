public with sharing class chartController {
    @AuraEnabled(cacheable=true)
    public static List<Map<String, Object>> getAccOPPData(){
        try {
            List<Map<String, Object>> result =new List<Map<String, Object>>();
            List<Account> accWithOpps = [select Id, Name, (select Id from opportunities) from Account]; 
            Map<String, Object> dataPoint =new Map<String, Object>();
             
             for(Account acc :accWithOpps ){
                dataPoint.put('label', acc.Name);
                dataPoint.put('data', acc.opportunities.size());
                result.add(datapoint);
             }
             return result;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}