package com.blackboxproject.persistence;

import java.util.Date;

import com.blackboxproject.domain.UserVO;
import com.blackboxproject.dto.LoginDTO;

public interface UserDAO {

	public UserVO login(LoginDTO dto) throws Exception;

	public void keepLogin(String userId, String sessionId, Date next);

	public UserVO checkUserWithSessionKey(String value);

	public void create(UserVO vo) throws Exception;

	public int checkId(UserVO vo) throws Exception;

	public int checkNick(UserVO vo) throws Exception;

	public void delete(String userId) throws Exception;

	public void modify(UserVO vo) throws Exception;

	public UserVO find_user_id(String userNick, String userEmail) throws Exception;

	public UserVO find_user_pw(String userId, String userEmail) throws Exception;

	public void updateRanPw(String userId, String userPw) throws Exception;
}
