  public class InsertContactToAccount {
    public static void createContacts(List<Account> newAccounts) {
        List<Contact> contactsToBeInserted = new List<Contact>();
        
        for(Account acc : newAccounts) {
            Contact newContact = new Contact();
            newContact.FirstName = acc.Name; 
            newContact.LastName = 'Contact'; 
            newContact.Email = 'salesforce@gmail.com'; 
            newContact.AccountId = acc.Id;
            contactsToBeInserted.add(newContact);
        }
        
        if(!contactsToBeInserted.isEmpty()) { 
            insert contactsToBeInserted; 
        }
    }
}