public class AccountRevenueupdate implements Database.Batchable<SObject>{
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('SELECT Id,AnnualRevenue FROM Account');
    }

public void execute(Database.BatchableContext BC, List<Account> scope){
        List<Account> acclist = new List<Account>();
        for(Account acc : acclist){
            if(acc.AnnualRevenue == null){
                acc.AnnualRevenue = 50;
            } else {
                acc.AnnualRevenue += 50;
            }
            acclist.add(acc);
        }
        update acclist; 
    }
    public void Finish(Database.BatchableContext BC){
        
    }
}