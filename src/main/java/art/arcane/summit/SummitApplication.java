package art.arcane.summit;

import art.arcane.summit.security.LudicrousPasswordEncoder;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;

@EntityScan(basePackages = "art.arcane.labyrinth.data.unit")
@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class SummitApplication {
    public static void main(String[] args) {
        SpringApplication.run(SummitApplication.class, args);
    }

    @Bean
    PasswordEncoder getPasswordEncoder() {
        return new LudicrousPasswordEncoder();
    }
}
