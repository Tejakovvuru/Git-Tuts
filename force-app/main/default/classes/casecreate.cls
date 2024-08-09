public with sharing class casecreate {
    
    public static void createCasesRelatedToOpportunity(List<Opportunity> newOpportunities) {
        List<Case> casesToBeInserted = new List<Case>();
        Map<Id, Contact> oppIdToContactMap = new Map<Id, Contact>();
        for (Opportunity opp : newOpportunities) {
            oppIdToContactMap.put(opp.Id, new Contact()); 
        }
        oppIdToContactMap.putAll(
            new Map<Id, Contact>([
                SELECT Id, Name
                FROM Contact
                WHERE Id IN :oppIdToContactMap.keySet()
            ])
        );
        for (Opportunity opp : newOpportunities) {
            Case newCase = new Case();
            newCase.ContactId = opp.ContactId; 
            newCase.Subject = 'New Contact Created';
            newCase.Description = 'A New Contact has been created: ' + oppIdToContactMap.get(opp.Id).Name;
            casesToBeInserted.add(newCase);
        }
        
        // Insert Case records
        if (!casesToBeInserted.isEmpty()) {
            insert casesToBeInserted;
        }
    }
}