public with sharing class accountDetails {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountDetails(){
        try {
            List<Account>  acclist =[Select Id,Phone, Name, Type FROM Account WHERE Type='Customer - Direct' WITH SECURITY_ENFORCED limit 5];
            return acclist;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   
}