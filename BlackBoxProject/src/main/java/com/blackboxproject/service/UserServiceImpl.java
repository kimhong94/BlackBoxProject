package com.blackboxproject.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.blackboxproject.domain.UserVO;
import com.blackboxproject.dto.LoginDTO;
import com.blackboxproject.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;

	@Override
	public UserVO login(LoginDTO dto) throws Exception {

		return dao.login(dto);
	}

	@Override
	public void keepLogin(String userId, String sessionId, Date next) throws Exception {

		dao.keepLogin(userId, sessionId, next);

	}

	@Override
	public UserVO checkLoginBefore(String value) {

		return dao.checkUserWithSessionKey(value);
	}

	@Override
	public void addUser(UserVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public int checkId(UserVO vo) throws Exception {
		return dao.checkId(vo);
	}

	@Override
	public int checkNick(UserVO vo) throws Exception {
		return dao.checkNick(vo);
	}

	public void deleteUser(String userId) throws Exception {
		dao.delete(userId);
	}

	public void updateUser(UserVO vo) throws Exception {
		dao.modify(vo);
	}

	public UserVO find_id_user(String userNick, String userEmail) throws Exception {
		return dao.find_user_id(userNick, userEmail);
	}

	public UserVO find_pw_user(String userId, String userEmail) throws Exception {
		return dao.find_user_pw(userId, userEmail);
	}

	public void updateRanPw(String userId, String userPw) throws Exception {
		dao.updateRanPw(userId, userPw);
	}

}
