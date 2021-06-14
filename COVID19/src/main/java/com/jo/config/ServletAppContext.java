package com.jo.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// XML로 세팅하는 방법에서 servlet-context.xml 파일을 대체하는 class다.
@Configuration
@EnableWebMvc
@ComponentScan("com.jo.controller")
public class ServletAppContext implements WebMvcConfigurer{
	
	// ViewResolver
	// 요청이 들어왔을때 파일의 경로를 지정한다. 
	// index가 들어온다면 -> /WEB-INF/views/index.jsp 로 자동으로 세팅해준다.
	public void configureViewResolvers(ViewResolverRegistry registry) {
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}
	
	// 정적 파일 세팅 -> css, js, images 등의 파일을 세팅한다.
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
	}
}
