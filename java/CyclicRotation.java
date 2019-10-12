import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.stream.IntStream;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;

public class CyclicRotation {
    public int[] solution(int[] A, int K) {
        if (A.length < 2 || A.length == K) return A;
        int shift = K % A.length;

        int[] left = Arrays.copyOfRange(A, A.length-shift, A.length);
        int[] right = Arrays.copyOfRange(A, 0, A.length-shift);

        return IntStream.concat(Arrays.stream(left), Arrays.stream(right)).toArray();
    }

    @Test
    public void test(){
        CyclicRotation cyclicRotation = new CyclicRotation();
        assertArrayEquals(new int[]{}, cyclicRotation.solution(new int[]{}, 0));
        assertArrayEquals(new int[]{1, 2, 3, 4}, cyclicRotation.solution(new int[]{1, 2, 3, 4}, 0));
        assertArrayEquals(new int[]{4, 1, 2, 3}, cyclicRotation.solution(new int[]{1, 2, 3, 4}, 1));
        assertArrayEquals(new int[]{0, 0, 0, 0}, cyclicRotation.solution(new int[]{0, 0, 0, 0}, 1));
        assertArrayEquals(new int[]{2, 1}, cyclicRotation.solution(new int[]{1, 2}, 1));
        assertArrayEquals(new int[]{1, 2}, cyclicRotation.solution(new int[]{1, 2}, 2));
        assertArrayEquals(new int[]{1, 2}, cyclicRotation.solution(new int[]{1, 2}, 0));
        assertArrayEquals(new int[]{9, 7, 6, 3, 8}, cyclicRotation.solution(new int[]{3, 8, 9, 7, 6}, 3));
    }
}
