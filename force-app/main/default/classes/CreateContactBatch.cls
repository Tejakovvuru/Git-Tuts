public class CreateContactBatch implements Database.Batchable<SObject> {

    public Database.QueryLocator start(Database.BatchableContext context) {
       
        return Database.getQueryLocator([
           SELECT Id, Name FROM Account Order by Lastmodifieddate desc ]);
     
    }

    public void execute(Database.BatchableContext context, List<Account> scope) {
        List<Contact> contactsToInsert  = new List<Contact>();
        for(Account acc : scope) {
            Contact conRecord = new Contact();
            conRecord = null;
            conRecord.FirstName = acc.Name;
            
            conRecord.LastName = 'Contact'; 
            conRecord.AccountId = acc.Id;
           // conRecord.Email = acc.Name + '@gmail.com';
           String pattern = '[^a-zA-Z0-9]';
String result = '';
         result = conRecord.Email.replaceAll(pattern, '');
            conRecord.Email = result;
              system.debug('Email ='+result);
           contactsToInsert.add(conRecord);
        }
        insert contactsToInsert;
    }

    public void finish(Database.BatchableContext context) {
     
    }
}