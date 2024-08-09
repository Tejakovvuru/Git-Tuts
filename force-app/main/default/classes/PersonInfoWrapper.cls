public class PersonInfoWrapper {
    public List<PersonWrapper> PersonWrapperList {get; set;}

    public PersonInfoWrapper() {
        PersonWrapperList = new List<PersonWrapper>();
        
        PersonWrapper wrapperobj1 = new PersonWrapper();
        wrapperobj1.personName = 'Teja';
        wrapperobj1.personAge = 21;
        wrapperobj1.personMarried = false;
        wrapperobj1.personHeight = 5.0;
        PersonWrapperList.add(wrapperobj1);
        
        PersonWrapper wrapperobj2 = new PersonWrapper();
        wrapperobj2.personName = 'Damu';
        wrapperobj2.personAge = 26;
        wrapperobj2.personMarried = true;
        wrapperobj2.personHeight = 5.6;
        PersonWrapperList.add(wrapperobj2);
    }
    
    public class PersonWrapper {
        public String personName {get; set;}
        public Integer personAge {get; set;}
        public Boolean personMarried {get; set;}
        public Decimal personHeight {get; set;}
    }
}