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
	public void keepLogin(String user_id, String sessionId, Date next) throws Exception {

		dao.keepLogin(user_id, sessionId, next);

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

	public void deleteUser(String user_id) throws Exception {
		dao.delete(user_id);
	}

	public void updateUser(UserVO vo) throws Exception {
		dao.modify(vo);
	}

	public UserVO find_id_user(String user_nick, String user_email) throws Exception {
		return dao.find_user_id(user_nick, user_email);
	}

	public UserVO find_pw_user(String user_id, String user_email) throws Exception {
		return dao.find_user_pw(user_id, user_email);
	}
	public void updateRanPw(String user_id, String user_pw) throws Exception{
		dao.updateRanPw(user_id, user_pw);
	}

}
