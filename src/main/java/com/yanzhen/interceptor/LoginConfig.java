package com.yanzhen.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
public class LoginConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration registration = registry.addInterceptor(new LoginInterceptor());
        registration.addPathPatterns("/**");
        registration.excludePathPatterns(
                "/login",
                "/loginIn",
                "/verifyCode",
                "/**/*.js",
                "/**/*.css",
                "/**/*.png",
                "/**/*.woff",
                "/**/*.ttf",
                "/**/*.html"
        );
    }
}
