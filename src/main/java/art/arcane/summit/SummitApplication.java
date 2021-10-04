package art.arcane.summit;

import art.arcane.summit.security.LudicrousPasswordEncoder;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EntityScan(basePackages = "art.arcane.summit.data.unit")
@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class SummitApplication {
    public static void main(String[] args) {
        SpringApplication.run(SummitApplication.class, args);
    }

    @Bean
    PasswordEncoder getPasswordEncoder() {
        return new LudicrousPasswordEncoder();
    }

    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**").allowedOrigins("*");
            }
        };
    }
}
