package petstore;

import com.intuit.karate.junit5.Karate;

class PetstoreTest {
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}