public class relativecase {
    public static void createrelatedcase(List<Contact> newList){
         List<Case> casesToBeInserted = new List<Case>(); 
        
        for (Contact newContact : newList) {
            Case newCase = new Case();
            newCase.ContactId = newContact.Id;
            newCase.Subject = 'New Contact Created';
            newCase.Description = 'A new contact has been created: ' + newContact.Name;
            
            casesToBeInserted.add(newCase);
        }
        if (!casesToBeInserted.isEmpty()) {
            insert casesToBeInserted;
        }
    }
}