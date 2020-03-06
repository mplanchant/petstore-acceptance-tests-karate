package petstore.pets;

import com.intuit.karate.junit5.Karate;

class PetsRunner {
    @Karate.Test
    Karate testPetstore() {
        return Karate.run("pets").relativeTo(getClass());
    }
}