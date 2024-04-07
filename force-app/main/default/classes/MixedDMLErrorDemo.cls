public class MixedDMLErrorDemo {
    public static void myMethod() {
        Account a = new Account(Name='ApexHours');
        insert a;
        UtilFutureDemo.insertUser();
    }
}