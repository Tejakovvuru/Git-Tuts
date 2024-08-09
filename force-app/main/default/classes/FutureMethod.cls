public class FutureMethod {
    public FutureMethod(){
        breakfast();
        Office();
        Meeting();
        Home();
    }
    public static void breakfast(){
        system.debug('Having Breakfast');
    }
    public static void Office(){
        system.debug('Going to Office');
    }
    @future
     public static void Meeting(){
        system.debug('In meeting room');
    }
     public static void Home(){
        system.debug('Coming back to Home');
    }
}