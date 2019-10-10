class Solution {
    public int solution(int N) {
        String binary = Integer.toBinaryString(N);
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
        Solution solution = new Solution();
        System.out.println(solution.solution(Integer.valueOf(args[0])));
    }
}
