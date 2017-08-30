package com.blackboxproject.persistence;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.blackboxproject.domain.UserVO;
import com.blackboxproject.dto.LoginDTO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/**/*.xml"
})
public class UserDAOTest {
	
	@Inject
	UserDAO ud;
	
	@Test
	public void test() throws Exception {
		
		LoginDTO dto = new LoginDTO();
		dto.setUserId("rnc1234");
		dto.setUserPw("rnc1234");
		
		UserVO vo = ud.login(dto);
		System.out.println(vo.toString());
	
	}

}
