public with sharing class deleteancaserecords {

    @AuraEnabled
    public static String deleteCasesWi  thNewStatus(List<Case> casesToDelete) {
        try {
            // Query for Case records with status 'New'
            List<Case> casesToDeleteList = [SELECT Id FROM Case WHERE Status = 'New'];
            
            if (!casesToDelete.isEmpty()) {
                delete casesToDelete;
                return 'Cases with status \'New\' deleted successfully';
            } else {
                return 'No cases with status \'New\' found to delete';
            }
        } catch (Exception e) {
            return 'Error deleting cases: ' + e.getMessage();
        }
    }
    }
