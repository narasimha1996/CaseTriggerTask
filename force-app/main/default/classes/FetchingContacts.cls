public with sharing class FetchingContacts {
    @AuraEnabled
    public static List<Contact> getCon(String searchTerm){
        string modifiedSearchTerm = '%'+searchTerm+'%';
        List<Contact> conlist = new List<Contact>();
        try {
         
                    conlist =[Select FirstName,LastName from Contact where LastName Like :modifiedSearchTerm];
                   
               
                return conlist;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}