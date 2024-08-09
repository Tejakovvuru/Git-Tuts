public class opportunitynewlycreate {
    public static void sendOnboardingEmails(List<Opportunity> newOpportunities) {
        Set<String> userEmails = new Set<String>();

        // Collect email addresses of users to notify (example logic: notify Opportunity Owner)
        for(Opportunity newOpp : newOpportunities) {
            if (newOpp.OwnerId != null) {
                // Query for owner's email address
                User owner;
                try {
                    owner = [SELECT Id, Email FROM User WHERE Id = :newOpp.OwnerId LIMIT 1];
                } catch (QueryException e) {
                    // Handle exception (log, throw, or set default behavior)
                    System.debug('Error querying User record: ' + e.getMessage());
                    continue; // Skip to next iteration
                }

                if (owner != null && owner.Email != null) {
                    userEmails.add(owner.Email);
                }
            }
        }

        // Query the Email Template Id for the onboarding email
        EmailTemplate emailTemplate;
        try {
            emailTemplate = [SELECT Id FROM EmailTemplate WHERE DeveloperName = 'Your_Onboarding_Template' LIMIT 1];
        } catch (QueryException e) {
            // Handle exception (log, throw, or set default behavior)
            System.debug('Error querying Email Template: ' + e.getMessage());
            return; // Exit method
        }

        if (emailTemplate == null) {
            System.debug('Email Template not found: Ensure correct DeveloperName');
            return; // Exit method if template not found
        }

        Id emailTemplateId = emailTemplate.Id;

        // Create a list to hold Messaging.SingleEmailMessage objects
        List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();

        // Iterate through the user emails and send email for each user
        for(String userEmail : userEmails) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setTemplateId(emailTemplateId); // Set the email template Id
            mail.setTargetObjectId(UserInfo.getUserId()); // Set the target object Id to current user
            mail.setWhatId(UserInfo.getUserId()); // Set the WhatId to current user Id
            mail.setSaveAsActivity(false); // Do not save as activity
            mail.setToAddresses(new List<String>{userEmail}); // Set the recipient email address

            emailsToSend.add(mail);
        }

        // Send the emails
        Messaging.sendEmail(emailsToSend);
    }
}