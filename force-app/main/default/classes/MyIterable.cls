public class MyIterable implements Iterable<Integer> {
    public Iterator<Integer> iterator() {
        return new Set<Integer>{1,2}.Iterator();
    }
}