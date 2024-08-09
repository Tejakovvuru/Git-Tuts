public class staticExample {
    static Integer c = 10;
    Integer v =30;
    public void Method1(Integer x){
        x =x+c;
        system.debug('c');
        system.debug('v');
    }
    
    public static void Method2(Integer x){
        c = c+x;
        system.debug('c');
        system.debug('v');
    }
}