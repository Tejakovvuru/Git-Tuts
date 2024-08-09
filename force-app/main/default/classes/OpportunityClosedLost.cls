public class OpportunityClosedLost implements Schedulable {
    private List<Id> opportunityIds;
    
    // Constructor
    public OpportunityClosedLost(List<Id> OppIds){
        this.opportunityIds = OppIds;
    }
    
    // execute method required by Schedulable interface
    public void execute(SchedulableContext sc) {
        List<Opportunity> opps = [SELECT Id, Name, Owner.Email FROM Opportunity WHERE Id IN :opportunityIds AND StageName = 'Closed Lost' AND LastModifiedDate = LAST_N_DAYS:2];
        
        if (!opps.isEmpty()) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<String> toAddress = new List<String>();
            
            // Add owner email addresses to the "to" address list
            for (Opportunity opp : opps) {
                toAddress.add(opp.Owner.Email);
            }
            
            mail.setToAddresses(toAddress);
            mail.setSubject('Opportunity Stage Value Alert');
            mail.setPlainTextBody('Your Opportunity has been updated as Closed Lost\n\n');
            
            // Add opportunity names to the email body
            for (Opportunity opp : opps) {
                mail.setPlainTextBody(mail.getPlainTextBody() + 'Opportunity Name: ' + opp.Name + '\n');
            }
            
            // Send email
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        }
    }
    
    // Method to schedule the job
    public static void scheduleEmail(List<Id> OpportunityIds) {
        String cronExp = '0 0 0 2 * ?'; // Cron expression for running the job at midnight on the 2nd day of each month
        String jobId = System.schedule('OpportunityClosedLost', cronExp, new OpportunityClosedLost(OpportunityIds));
    }
}