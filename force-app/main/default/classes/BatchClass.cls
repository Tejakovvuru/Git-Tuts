public class BatchClass implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext context) {
        return Database.getQueryLocator('SELECT Id, Name FROM Opportunity WHERE Amount >= 20000 LIMIT 10');
    }
      
    public void execute(Database.BatchableContext context, List<sObject> scope) {
        List<Opportunity> opportunitiesToUpdate = (List<Opportunity>) scope;
        for (Opportunity opp : opportunitiesToUpdate) {
            opp.Name = opp.Name.toUpperCase();
            opp.StageName = 'prospecting';
        }
        update opportunitiesToUpdate; 
    }
     
    public void finish(Database.BatchableContext context) {
          System.debug('Batch job complete.');
    }
}