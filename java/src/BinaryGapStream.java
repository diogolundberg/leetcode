import java.util.stream.Stream;

class BinaryGapStream {

    public int solution(int N) {
        String binary = Integer.toBinaryString(N);
        System.out.print(binary + " ");
        String trimmedBinary = binary.replaceAll("^0+|0+$", "");
        return Stream.of(trimmedBinary.split("1"))
            .map(String::length)
            .max((size1, size2) -> size1 - size2)
            .orElse(0);
    }

    public static void main(String... args) {
        BinaryGapStream binaryGap = new BinaryGapStream();

        Stream.of(
            1,
            2,
            3,
            4,
            5,
            4523,
            32,
            45,
            543435234,
            343456566,
            421
        ).forEach(test -> {
            System.out.println(binaryGap.solution(test));
        });
    }
}
