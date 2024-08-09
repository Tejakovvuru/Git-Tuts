public class contController {
    @AuraEnabled
    public static List<Contact> getContactsByAccountId(Id accountId) {
        if (accountId == null) {
            throw new AuraHandledException('Account ID cannot be null.');
        }
        
        List<Contact> contacts = [SELECT Id, Name, Phone, Account.Name 
                                  FROM Contact 
                                  WHERE AccountId = :accountId];
        return contacts;
    }
}