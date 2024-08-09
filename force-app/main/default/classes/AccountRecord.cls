public class AccountRecord {
    public static List<Account> getAccounts(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name, Phone FROM Account];
        return accList;
    }
}