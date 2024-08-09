public class BatchExample implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('SELECT FirstName, LastName, Status, Company FROM Lead');
        }
   public void execute(Database.BatchableContext BC, List<Lead> scope) {
    System.debug('In Execute Method');
    List<Lead> leadsToUpdate = new List<Lead>();
    for (Lead record : scope) {
        Lead leadRecord = (Lead)record;
        leadRecord.Company = 'TCS'; // Update leadRecord, not record
        leadsToUpdate.add(leadRecord);
    }
    update leadsToUpdate;
 }
    public void Finish(Database.BatchableContext BC){
        system.debug('batch finish');
    }
}