public class student {
    public Integer teja_age = 21;
    public Integer jyoshna_age = 20;
    
    public void compareMethod(){
        if (teja_age == jyoshna_age){
            system.debug('Age is same');
            
        }
        if(teja_age < jyoshna_age){
            system.debug('teja is younger than jyoshna');
        }
        if(teja_age > jyoshna_age){
            system.debug('teja is elder than jyoshna');
        } 
    }
    

}