package in.naths.chintamani;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"in.naths.chintamani", "in.naths.chintamani.config"})
public class ChintamaniApplication {

	public static void main(String[] args) {
		SpringApplication.run(ChintamaniApplication.class, args);
	}

}