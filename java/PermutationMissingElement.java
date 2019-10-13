import org.junit.jupiter.api.Test;

import java.util.Arrays;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class PermutationMissingElement {
    public int solution(int[] A) {
        int result = 0;

        Arrays.sort(A);

        for (int i = 0; i < A.length; i++) {
            result ^= A[i] ^ (i+1);
        }

        return result ^ (A.length + 1);
    }

    @Test
    public void test(){
        PermutationMissingElement solution = new PermutationMissingElement();
        assertEquals(1, solution.solution(new int[]{2}));
        assertEquals(2, solution.solution(new int[]{1, 3, 4}));
        assertEquals(4, solution.solution(new int[]{1, 2, 3, 5}));
    }
}
