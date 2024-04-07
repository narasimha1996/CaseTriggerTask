public class QueueableApex implements Queueable{
    public void execute(QueueableContext qc){
        BatchApex batch =new BatchApex();
         database.ExecuteBatch(batch);
    }

}