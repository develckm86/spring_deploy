package com.tj703.l08_spring_jpa_rest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;

@SpringBootApplication
@PropertySources(@PropertySource("classpath:/env.properties"))
public class L08SpringJpaRestApplication {

    public static void main(String[] args) {
        SpringApplication.run(L08SpringJpaRestApplication.class, args);
    }

}
