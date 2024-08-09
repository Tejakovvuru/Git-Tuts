public with sharing class updatetheleadsstatus {
    
    @AuraEnabled
    public static void updateLeadsStatus(List<Id> leadIds) {
        List<Lead> leadsToUpdateList = new List<Lead>();
        
        for(Lead leadopp : leadsToUpdateList){
            if(String.isBlank(leadopp.Status)){
                leadopp.Status = 'Working - Contacted';
                leadsToUpdateList.add(leadopp);
            }
        }
        
        if(!leadsToUpdateList.isEmpty()){
            update leadsToUpdateList;
        }
    }
}

