package com.blackboxproject.persistence;

import java.util.Date;

import com.blackboxproject.domain.UserVO;
import com.blackboxproject.dto.LoginDTO;

public interface UserDAO {

	public UserVO login(LoginDTO dto) throws Exception;

	public void keepLogin(String user_id, String sessionId, Date next);

	public UserVO checkUserWithSessionKey(String value);

	public void create(UserVO vo) throws Exception;

	public int checkId(UserVO vo) throws Exception;

	public int checkNick(UserVO vo) throws Exception;

	public void delete(String user_id) throws Exception;

	public void modify(UserVO vo) throws Exception;

	public UserVO find_user_id(String user_nick, String user_email) throws Exception;

	public UserVO find_user_pw(String user_id, String user_email) throws Exception;
	public void updateRanPw(String user_id, String user_pw) throws Exception;
}
