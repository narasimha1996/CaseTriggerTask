global class SchedulableApex implements Schedulable {
    global void execute(SchedulableContext sc){
        BatchApex batch =new BatchApex();
        database.ExecuteBatch(batch);
    }

}