package config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.web.servlet.config.annotation.*;
@Configuration
@EnableWebMvc
@ComponentScan({"com.nf.controller","com.nf.interceptor"})//"com.interceptor"
@Import(SwaggerConfig.class)
public class MvcConfig implements WebMvcConfigurer {

    /**
     * 视图处理器
     */
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp("/WEB-INF/views/", ".jsp");
    }

    /**
     * 日期格式
     * @param registry
     */
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addFormatter(new DateFormatter("yyy-MM-dd"));
    }


    /**
     * 拦截器
     * @param registry
     */
     @Override
    public void addInterceptors(InterceptorRegistry registry) {
//        InterceptorRegistration interceptorRegistration = registry.addInterceptor(new UserInterceptor());
//        interceptorRegistration.addPathPatterns("/**");
//        //排除
//        interceptorRegistration.excludePathPatterns("/index");
//        interceptorRegistration.excludePathPatterns("/login");
//        interceptorRegistration.excludePathPatterns("/verifylogin");
    }

    /**
     * 静态资源
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        ResourceHandlerRegistration resourceHandlerRegistration =
                registry.addResourceHandler("/static/**");
        resourceHandlerRegistration.addResourceLocations("classpath:/static/");

    }
    /**
     * 跨域
     * @param registry
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("http://127.0.0.1:8848")
                .allowedMethods("GET","POST","OPTIONS",
                        "DELETE","HEAD","PUT","PATCH");
    }
}
