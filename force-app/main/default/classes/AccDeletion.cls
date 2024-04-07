public with sharing class AccDeletion {
    public Static void accountDeletion(List<Contact> newlist){
		Set<Id> conAccIds=new Set<Id>();
        for(Contact con:newlist){
            if(con.AccountId !=null){
                conAccIds.add(con.AccountId);
            }
        }
       List<Account> acclist1=[Select id,(Select id,Name from contacts)from Account where id=:conAccIds];
        List<Account> acc1=new List<Account>();
        for(Account acc:acclist1){
            if(acc.contacts.size() >2){
                acc1.add(acc);
            }
        }
        
        if(!acc1.isEmpty()){
            delete acc1;
        }
        
        
       /*List<AggregateResult> arg= [Select Count(id) conCount,AccountId Accid from Contact where AccountId IN:conAccIds group by AccountId ];
        List<id> accId=New List<id>();
        for(AggregateResult args:arg){
            if((Integer)args.get('conCount') > 2){
                accId.add((Id)args.get('Accid'));
            }
        }
       List<Account> accList =[Select id,Name from Account where Id =:accId];
        
		delete accList;    */  
			            
        
       
        
        
    }

}