public class Contacttriggeremail {
     public static void SendEmailNotification(List<Contact> conList){
         List<Messaging.Email> emailList = new List<Messaging.Email>();
         for(Contact con : conList){
             if(con.Email !=null){
                 Messaging.SingleEmailMessage emailMsg = new  Messaging.SingleEmailMessage();
                 string [] toAddress = new string[]{con.Email};
                     emailMsg.setToAddresses(toAddress);
                 String emailsub = 'Welcome'+con.FirstName;
                 emailMsg.setSubject(emailsub);
                 string disName = 'Teja kovvuru';
                 emailmsg.setSenderDisplayName(disName);
             string content = 'Hi'+ con.FirstName + ',<hr/><hr/>'+
                     'Welcome to salesforce!' + '<hr/><hr/>'+
                     'your contact is  successfully created.' + '<hr/><hr/>'+
                     'Thank you';
                     emailmsg.setHtmlBody(content);
                     }
             
         }
     }
}