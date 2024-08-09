public class WrapperExample {
    public List<AccountWrapper> accountWrapperList {get; set;}
    
    public WrapperExample() {
        accountWrapperList = new List<AccountWrapper>();
        
        AccountWrapper wrapobj1 = new AccountWrapper();
        wrapobj1.accountName = 'Teja';
        wrapobj1.accountType = 'Other';
        accountWrapperList.add(wrapobj1);
        System.debug('Name=' + wrapobj1.accountName );
        System.debug('Type=' + wrapobj1.accountType );
        
        AccountWrapper wrapobj2 = new AccountWrapper();
        wrapobj2.accountName = 'Jyoshna';
        wrapobj2.accountType = 'Prospect';
        accountWrapperList.add(wrapobj2);
        System.debug('Name=' + wrapobj2.accountName );
        System.debug('Type=' + wrapobj2.accountType );
    }
    
    public class AccountWrapper {
        public String accountName {get; set;}
        public String accountType {get; set;}  
    }
}