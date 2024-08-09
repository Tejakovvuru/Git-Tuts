public with sharing class Accountsearch {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String searchKey) {
        String searchPattern = '%' + searchKey + '%';
        return [SELECT Id, Name FROM Account WHERE Name LIKE :searchPattern];
    }
}
