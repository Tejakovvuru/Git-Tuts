public class Eligibility {
    public Integer ashwini_age = 21;
    
    public void check() {
        if (ashwini_age >= 18) {
            System.debug('You are eligible for voting.');
        } else {
            System.debug('Sorry, you are not eligible for voting.');
        }
    }
}