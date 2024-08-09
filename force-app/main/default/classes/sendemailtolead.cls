public with sharing class sendemailtolead {
    @AuraEnabled
    public static void sendEmail(List<Id> leadIds) {
        List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();
        EmailTemplate emailTemplate = [SELECT Id FROM EmailTemplate WHERE DeveloperName = 'Your_Email_Template_Name' LIMIT 1];
        
        if (emailTemplate == null) {
            throw new AuraHandledException('Email Template not found with DeveloperName: Your_Email_Template_Name');
        }
        
        List<Lead> leadsToUpdate = [SELECT Id, Status, OwnerId FROM Lead WHERE Id IN :leadIds AND Status = 'Closed - Converted'];
        
        for (Lead lead : leadsToUpdate) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setTemplateId(emailTemplate.Id);
            email.setTargetObjectId(lead.OwnerId); // Set recipient to lead owner or any other recipient
            email.setWhatId(lead.Id); // Set the WhatId to lead Id
            email.setSaveAsActivity(false); // Do not save as activity
            emailsToSend.add(email);
        }
        
        if (!emailsToSend.isEmpty()) {
            Messaging.sendEmail(emailsToSend);
        }
    }
}