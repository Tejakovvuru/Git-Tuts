public class DeleteOpporunity  implements Database.Batchable<SObject>{
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('select Id from Opportunity');
    }
    public void execute(Database.BatchableContext BC,List<SObject> scope){
        List<Opportunity> deletetheopportunity = new  List<Opportunity>();
        deletetheopportunity.addall(deletetheopportunity);
        delete scope;
        }
    public void finish(Database.BatchableContext BC){
        
    }
}