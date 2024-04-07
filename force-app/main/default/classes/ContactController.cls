public with sharing class ContactController {
    public List<Contact> contactList { get; set; }
    
    public ContactController() {
        // Constructor
        contactList = [SELECT Id, FirstName, LastName, Email FROM Contact LIMIT 10]; // Example query, adjust as needed
    }
}