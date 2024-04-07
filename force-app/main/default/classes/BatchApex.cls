global class BatchApex implements Database.Batchable<Sobject>, Database.Stateful{
    String query;
    integer count =0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        query ='Select id,Name,Website from Account where id IN (Select AccountId from contact)';
        return Database.getQueryLocator(query);
    }
    
    global void Execute(Database.BatchableContext bc, List<Account> scope){
        List<Account> accList =new List<Account>();
        for(Account acc:scope){
            acc.Website ='https://narasimhalwc-dev-ed.develop.lightning.force.com/';
            accList.add(acc);
            count=count+1;
        }

        update accList;
    }
    
    global void Finish(Database.BatchableContext bc){
     		Messaging.SingleEmailMessage mail =new Messaging.SingleEmailMessage();
       		mail.setToAddresses(new String[] {'murali.palacholla@gmail.com'});
            mail.setReplyTo('murali.palacholla@gmail.com');
            mail.setSenderDisplayName('Batch Process');
            mail.setSubject('Delivery Statuses updated successfully');
            mail.setPlainTextBody('Batch Process has completed.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});                               
    }
}