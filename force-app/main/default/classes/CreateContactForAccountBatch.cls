public class CreateContactForAccountBatch implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id, Name FROM Account WHERE Type = \'CUSTOMER - DIRECT\'');
    }

    public void execute(Database.BatchableContext BC, List<Account> scope) {
        List<Contact> contactsToInsert = new List<Contact>();
        
        for(Account acc : scope) {
            Contact newContact = new Contact(
                FirstName = acc.Name,  
                LastName = 'Contact', 
                AccountId = acc.Id
            );
            contactsToInsert.add(newContact);
        }
        insert contactsToInsert;
    }

    public void finish(Database.BatchableContext BC) {
        
    }
}