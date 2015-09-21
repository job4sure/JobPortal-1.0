package com.job4sure.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.job4sure.util.IConstant;

/**
 * @author Vipulraj
 *
 */
@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Bean
    public PasswordEncoder passwordEncoder() {
	PasswordEncoder encoder = new BCryptPasswordEncoder();
	return encoder;
    }

    @Autowired
    @Qualifier("userDetailsService")
    UserDetailsService userDetailsService;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
	authenticationManagerBuilder.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
	http.authorizeRequests().antMatchers("/success/**").permitAll()
	.antMatchers("/userProfileHomePage/**").access("hasRole('" + IConstant.USER_ROLE + "')")
			.antMatchers("/companyHome/**").access("hasRole('" + IConstant.COMPANY_ROLE + "')")
			.antMatchers("/showAdminHomePage/**").permitAll()
			.and().formLogin().loginPage("/login")
			.failureUrl("/login?error").usernameParameter("userName").passwordParameter("password")
			.defaultSuccessUrl("/success").and().logout().logoutSuccessUrl("/login?logout").and().csrf()
			.disable().exceptionHandling().accessDeniedPage("/error");

    }

}
