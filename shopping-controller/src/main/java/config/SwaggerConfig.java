package config;

import io.swagger.annotations.Api;
import org.springframework.context.annotation.Bean;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

/**
 *Api接口描述配置
 * 主要是给前端看，比如有哪些字段 ，名称 xxx
 */
public class SwaggerConfig {
    @Bean
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .apis(RequestHandlerSelectors.withClassAnnotation(Api.class))
                .paths(PathSelectors.any())
                .build()
                .apiInfo(apiInfo());
    }
    /**
     * Api接口描述配置
     */
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                // 文档标题
                .title("移动端接口文档")
                // 文档描述
                .description("移动API文档接入说明")
                //api说明网站
                .termsOfServiceUrl("https://api.github.com/")
                //Api版本
                .version("v1")
                .build();
    }
}
