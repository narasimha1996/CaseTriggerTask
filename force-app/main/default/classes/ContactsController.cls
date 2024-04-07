public class ContactsController {
    @AuraEnabled
    public static List<Contact> getContacts(String SearchTerm){
        String modifiedSearchTerm = '%'+SearchTerm+'%';
        List<Contact> conList= [SELECT Name, Email FROM Contact WHERE Name LIKE :modifiedSearchTerm];
        return conList;
    }

}