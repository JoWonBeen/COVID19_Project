package com.jo.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

// XML로 세팅하는 방법에서 web.xml 파일을 대체하는 class다.
//public class SpringConfigClass implements WebApplicationInitializer{
//	@Override
//	public void onStartup(ServletContext servletContext) throws ServletException {
//		// Spring Web MVC 프로젝트 설정을 위한 class 생성
//		AnnotationConfigWebApplicationContext servletAppContext = new AnnotationConfigWebApplicationContext();
//		servletAppContext.register(ServletAppContext.class);
//		
//		// Dispatcher 세팅
//		DispatcherServlet dispatcherServlet = new DispatcherServlet(servletAppContext);
//		ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcherServlet);
//		
//		// 들어오는 모든 요청에 대한 mapping
//		servlet.setLoadOnStartup(1);
//		servlet.addMapping("/");
//		
//		// Bean을 정의하는 class
//		AnnotationConfigWebApplicationContext rootAppContext = new AnnotationConfigWebApplicationContext();
//		rootAppContext.register(RootAppContext.class);
//		
//		// Listener 세팅
//		ContextLoaderListener listener = new ContextLoaderListener(rootAppContext);
//		servletContext.addListener(listener);
//		
//		// Encoding Filter 세팅
//		FilterRegistration.Dynamic filter = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
//		filter.setInitParameter("encoding", "UTF-8");
//		filter.addMappingForServletNames(null, false, "dispatcher");
//		
//	}
//
//}

public class SpringConfigClass extends AbstractAnnotationConfigDispatcherServletInitializer{

	// Bean 정의 세팅
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {RootAppContext.class};
	}

	// SpringMVC 프로젝트 설정을 위한 Class 지정
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {ServletAppContext.class};
	}

	// DispatcherServlet에서 매핑할 요청주소 세팅
	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}
	
	// 한글 깨짐 방지 Filter 세팅
	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("UTF-8");
		return new Filter[] {encodingFilter};
	}
}
