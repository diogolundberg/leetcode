import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class FrogJump {

    public int solution(int X, int Y, int D) {
        int distance = Y - X;
        int jumps = distance / D;

        return distance % D == 0 ? jumps : jumps + 1;
    }

    @Test
    public void test() {
        FrogJump frogJump = new FrogJump();
        assertEquals(3, frogJump.solution(10, 85, 30));
    }
}
