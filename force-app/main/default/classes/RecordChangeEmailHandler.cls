public class RecordChangeEmailHandler {
    public static void sendOnboardingEmails(List<User> newUsers) {
        Set<String> userEmails = new Set<String>();

        // Collect email addresses of new users
        for(User newUser : newUsers) {
            userEmails.add(newUser.Email);
        }

        // Query the Email Template Id for the onboarding email
        Id emailTemplateId = [SELECT Id, DeveloperName FROM EmailTemplate WHERE DeveloperName = 'Your_Onboarding_Template' LIMIT 1].Id;

        // Create a list to hold Messaging.SingleEmailMessage objects
        List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();

        // Iterate through the user emails and send email for each user
        for(String userEmail : userEmails) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
           // mail.setTemplateId(emailTemplateId); // Set the email template Id
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