package br.com.casadocodigo.loja.conf;
import javax.servlet.FilterRegistration.Dynamic;
import javax.servlet.MultipartConfigElement;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ServletSpringMVC extends AbstractAnnotationConfigDispatcherServletInitializer {
	{
}

	@Override
	protected Class<?>[] getRootConfigClasses() {		
		
		// TODO Auto-generated method stub
		return new Class[]{SecurityConfiguration.class, AppWebConfiguration.class,JPAConfiguration.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[]{};
	}

	@Override
	protected String[] getServletMappings() {
		// TODO Auto-generated method stub
		return new String[]{"/"};
	}
	
	@Override
	protected void customizeRegistration(javax.servlet.ServletRegistration.Dynamic registration) {
		
		registration.setMultipartConfig(new MultipartConfigElement(""));
	}

}
