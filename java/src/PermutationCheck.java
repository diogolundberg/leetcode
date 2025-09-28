import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class PermutationCheck {

    public int solution(int[] A) {
        int result = 0;
        for (int i = 0; i < A.length; i++) {
            result ^= A[i] ^ (i + 1);
        }

        return result == 0 ? 1 : 0;
    }

    @Test
    public void test() {
        PermutationCheck solution = new PermutationCheck();
        assertEquals(3, solution.solution(new int[] { 1, 2, 4 }));
    }
}
