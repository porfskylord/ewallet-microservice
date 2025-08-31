package com.lordscave.ewallet_discovery_server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;


@SpringBootApplication
@EnableEurekaServer
public class EwalletDiscoveryServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(EwalletDiscoveryServerApplication.class, args);
	}

}
