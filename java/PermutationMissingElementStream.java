import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.stream.IntStream;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class PermutationMissingElementStream {
    public int solution(int[] A) {
        int missing = IntStream.range(0, A.length).reduce(0, (result, index) -> {
            return result ^ A[index] ^ (index+1);
        });

        return missing ^ (A.length + 1);
    }

    @Test
    public void test(){
        PermutationMissingElementStream solution = new PermutationMissingElementStream();
        assertEquals(1, solution.solution(new int[]{2}));
        assertEquals(2, solution.solution(new int[]{1, 3, 4}));
        assertEquals(4, solution.solution(new int[]{1, 2, 3, 5}));
    }
}
