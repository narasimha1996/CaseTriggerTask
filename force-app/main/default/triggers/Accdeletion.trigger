trigger Accdeletion on Contact(After Insert){
    if(trigger.isInsert&&trigger.isInsert){
        AccDeletion.accountDeletion(trigger.new);
    }
}