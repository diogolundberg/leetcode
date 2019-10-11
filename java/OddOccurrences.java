import java.util.stream.Stream;

class OddOccurrences {
    public int solution(int[] A) {
        int result = 0;

        for (int number : A) {
            result ^= number;
        }
        return result;
    }

    public static void main(String... args) {
        OddOccurrences oddOccurrences = new OddOccurrences();

        Stream.of(new int[]{9, 3, 9, 3, 9, 7, 9},
                new int[]{9, 3, 9, 3, 9, 7, 7, 8, 8, 10, 9},
                new int[]{1, 1, 1, 1, 10, 10, 8},
                new int[]{8, 1, 1, 1, 10, 10, 8}).forEach(test -> {
            System.out.println(oddOccurrences.solution(test));
        });
    }
}
