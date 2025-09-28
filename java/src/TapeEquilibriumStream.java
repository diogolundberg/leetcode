import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Arrays;
import org.junit.jupiter.api.Test;

public class TapeEquilibriumStream {

    public int solution(int[] A) {
        int left = A[0];
        int right = Arrays.stream(A).skip(1).sum();
        int difference = Math.abs(left - right);

        for (int i = 1; i < A.length - 1; i++) {
            left += A[i];
            right -= A[i];

            int newDifference = Math.abs(left - right);
            difference = newDifference < difference
                ? newDifference
                : difference;
        }

        return difference;
    }

    @Test
    public void test() {
        TapeEquilibriumStream solution = new TapeEquilibriumStream();
        assertEquals(2000, solution.solution(new int[] { -1000, 1000 }));
        assertEquals(1, solution.solution(new int[] { 3, 1, 2, 4, 3 }));
    }
}
