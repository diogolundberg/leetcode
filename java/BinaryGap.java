import java.util.stream.Stream;

class BinaryGap {
    public int solution(int N) {
        String binary = Integer.toBinaryString(N);
        System.out.print(binary + " ");
        String trimmedBinary = binary.replaceAll("^0+|0+$", "");
        String[] gaps = trimmedBinary.split("1");
        int result = 0;
        for (String gap : gaps) {
            if (gap.length() > result)
                result = gap.length();
        }

        return result;
    }

    public static void main(String... args) {
        BinaryGap binaryGap = new BinaryGap();

        Stream.of(1, 2, 3, 4, 5, 4523, 32, 45).forEach(test -> {
            System.out.println(binaryGap.solution(test));
        });
    }
}
