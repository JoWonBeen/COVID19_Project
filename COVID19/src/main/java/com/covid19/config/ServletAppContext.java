package com.covid19.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
@ComponentScan("com.covid19.controller.CenterAdmin")
@ComponentScan("com.covid19.controller.coronaInfo")
@ComponentScan("com.covid19.controller.coronaLive")
@ComponentScan("com.covid19.controller.home")
@ComponentScan("com.covid19.controller.mediCenter")
@ComponentScan("com.covid19.controller.member")
@ComponentScan("com.covid19.controller.picked")
@ComponentScan("com.covid19.controller.reserve")
@ComponentScan("com.covid19.controller.vaccineStatus")
@ComponentScan("com.covid19.model.CenterAdmin")
@ComponentScan("com.covid19.model.coronaLive")
@ComponentScan("com.covid19.model.mediCenter")
@ComponentScan("com.covid19.model.member")
@ComponentScan("com.covid19.model.picked")
@ComponentScan("com.covid19.model.reserve")
@ComponentScan("com.covid19.model.vaccineStatus")


public class ServletAppContext implements WebMvcConfigurer{
	
	public void configureViewResolvers(ViewResolverRegistry registry) {
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}
	
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
	}
}
