package org.KMLP.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.User;

public class UserDetailsVO extends User {

	/**
	 * 
	 */
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	public UserDetailsVO(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);

		// TODO Auto-generated constructor stub
	}

}
