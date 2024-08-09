public class AccountContactWrap {
    public List<AccConWrapper> retrieveAccContact() {
        List<AccConWrapper> wrapList = new List<AccConWrapper>();
        List<Account> accList = [SELECT Id, Name, (SELECT Id, Name, Email FROM Contacts) FROM Account LIMIT 10];
        for(Account acc : accList) {
            List<Contact> conList = acc.Contacts;
            wrapList.add(new AccConWrapper(acc, conList));
        }
        return wrapList;
    }
    public class AccConWrapper {
        public Account accRec;
        public List<Contact> conList;
        
        public AccConWrapper(Account acc, List<Contact> conList) {
            accRec = acc;
            this.conList = conList;
        }
    }
}