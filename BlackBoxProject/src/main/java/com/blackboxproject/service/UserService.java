package com.blackboxproject.service;

import java.util.Date;

import com.blackboxproject.domain.UserVO;
import com.blackboxproject.dto.LoginDTO;

public interface UserService {

	public UserVO login(LoginDTO dto) throws Exception;

	public void keepLogin(String userId, String sessionId, Date next) throws Exception;

	public UserVO checkLoginBefore(String value);

	public void addUser(UserVO vo) throws Exception;

	public int checkId(UserVO vo) throws Exception;

	public int checkNick(UserVO vo) throws Exception;

	public void deleteUser(String userId) throws Exception;

	public void updateUser(UserVO vo) throws Exception;

	public UserVO find_id_user(String userNick, String userEmail) throws Exception;

	public UserVO find_pw_user(String userId, String userEmail) throws Exception;

	public void updateRanPw(String userId, String userPw) throws Exception;

	public void updateHasAuth(String userId) throws Exception;

}
