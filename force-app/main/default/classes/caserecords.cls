public with sharing class caserecords {

    public caserecords() {
        // Constructor logic here, if needed
    }

    @AuraEnabled(cacheable=true)
    public static List<Case> getcases() {
        return [SELECT Id, CaseNumber, Status, Priority FROM Case LIMIT 10];
    }
    }