@isTest
Public class ContactUpdationHandlerTest {
	@isTest
	public static void testUpdateCon(){
		Account acc = new Account(Name='bankShares', Total__c = 1000.00);
		insert acc;
		Contact con1= new Contact (FirstName = 'Murali', LastName = 'Pallachola', AccountId = acc.Id, Share__c = 0.00);
		Contact con2= new Contact(FirstName = 'Palacholla', LastName = 'Narasimha', AccountId = acc.Id, Share__c = 0.00);
		List<Contact> cons = new List<Contact>{con1, con2};
        insert cons;
		acc.Total__c= 1500.00;
		update acc;
		
		List<Contact> updatedCons = [select id, Share__c from Contact where AccountId=:acc.Id];	
 		
	for(Contact con : updatedCons){
	System.assertEquals(750.00, con.Share__c,'Share__c should not be updated');
	}	
	}
}