@isTest
public with sharing class FetchingContactsTest {
    @isTest
    public static void testFetchingContacts() {

        String searchTerm='shena';
        List<Contact> conList=[Select LastName,FirstName from Contact where LastName like:searchTerm];
        Test.StartTest();
         List<Contact> result=FetchingContacts.getCon(searchTerm);
         system.assertEquals(result, conList,'both should match');
        Test.StopTest();

        System.assertEquals(1,result.size(),'Expected one contact to be returned');
    }

    @TestSetup
    static void testdata(){
        Contact con1= new Contact(FirstName='john', LastName='shena');
        Contact con2=new Contact(FirstName='bride', LastName='groom');
        insert new List<Contact>{con1,con2};
    }
}