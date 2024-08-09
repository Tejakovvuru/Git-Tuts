public class FutureExample {
    @Future
    public static void updateRecords()
    {
        List<Lead>records = [SELECT FirstName, Lastname, Status, Company FROM Lead];
        for(Lead record :records){
            record.Company = 'TCS';
        }
        update records;
    }
    @Future
public static void insertRecords()
    {
        Lead record1 =  new Lead (FirstName ='Teja', Lastname ='Kovvuru', Status= 'open-not', Company ='Infosys');
        insert record1;
    }
}