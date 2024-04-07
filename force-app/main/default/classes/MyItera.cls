public class MyItera {
    public static void itera() {
        for (Integer str : new MyIterable()) {
            System.debug(str);
        }
    }
}