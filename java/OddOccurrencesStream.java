import java.util.Arrays;
import java.util.stream.Stream;

class OddOccurrencesStream {
    public int solution(int[] A) {
        return Arrays.stream(A).reduce(0, (total, element) -> total ^= element);
    }

    public static void main(String... args) {
        OddOccurrencesStream oddOccurrences = new OddOccurrencesStream();

        Stream.of(new int[]{9, 3, 9, 3, 9, 7, 9},
                new int[]{9, 3, 9, 3, 9, 7, 7, 8, 8, 10, 9},
                new int[]{1, 1, 1, 1, 10, 10, 8},
                new int[]{8, 1, 1, 1, 10, 10, 8}).forEach(test -> {
            System.out.println(oddOccurrences.solution(test));
        });
    }
}
