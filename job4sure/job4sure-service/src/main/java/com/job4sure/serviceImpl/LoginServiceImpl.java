package com.job4sure.serviceImpl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.job4sure.model.Login;
import com.job4sure.model.UserRole;
import com.job4sure.repository.LoginRepository;



@Service("userDetailsService")
public class LoginServiceImpl implements UserDetailsService{

	
	@Autowired
	private LoginRepository loginRepository;
	
	
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(final String userName) throws UsernameNotFoundException {
		List<Login> logins =loginRepository.findByUserNameAndPass(userName);
		Login login=logins.get(0);
		List<GrantedAuthority> authorities = buildUserAuthority(login.getUserRole());
		return buildUserForAuthentication(login, authorities);
	}

	
	private User buildUserForAuthentication(Login login, List<GrantedAuthority> authorities) {
		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		boolean isValid=false;
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date ValidityDate = (Date)formatter.parse(login.getValidUpTo());
			if(ValidityDate.compareTo(now)>0){
        		isValid=true;
        	}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		
		return new User(login.getEmail(), login.getPassword(), login.isEnabled(), isValid, true, true, authorities);
	}

	private List<GrantedAuthority> buildUserAuthority(UserRole userRole) {
		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
			setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
	List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);
	return Result;
	}
	
	
	
	
	
	
	
	
}
