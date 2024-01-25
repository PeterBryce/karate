package mcheckout.partner;

import com.intuit.karate.junit5.Karate;

public class EndpointsRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("endpoints").relativeTo(getClass());
    }
}
