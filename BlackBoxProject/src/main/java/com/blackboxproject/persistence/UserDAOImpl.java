package com.blackboxproject.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.blackboxproject.domain.UserVO;
import com.blackboxproject.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.blackboxproject.mapper.UserMapper";

	@Override
	public UserVO login(LoginDTO dto) throws Exception {

		return session.selectOne(namespace + ".login", dto);
	}

	@Override
	public void keepLogin(String user_id, String sessionId, Date next) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", user_id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);

		session.update(namespace + ".keepLogin", paramMap);

	}

	@Override
	public UserVO checkUserWithSessionKey(String value) {

		return session.selectOne(namespace + ".checkUserWithSessionKey", value);
	}

	@Override
	public void create(UserVO vo) throws Exception {
		session.insert(namespace + ".create", vo);

	}

	@Override
	public int checkId(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".checkId", vo);
	}

	@Override
	public int checkNick(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".checkNick", vo);
	}

	@Override
	public void delete(String user_id) throws Exception {
		session.delete(namespace + ".delete", user_id);
	}

	@Override
	public void modify(UserVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	public UserVO find_user_id(String user_nick, String user_email) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_nick", user_nick);
		paramMap.put("user_email", user_email);
		return session.selectOne(namespace + ".find_id", paramMap);
	}

	public UserVO find_user_pw(String user_id, String user_email) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", user_id);
		paramMap.put("user_email", user_email);
		return session.selectOne(namespace + ".find_pw", paramMap);
	}
	
	public void updateRanPw(String user_id, String user_pw) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", user_id);
		paramMap.put("user_pw", user_pw);
		session.update(namespace + ".update_ran_pw", paramMap);
	}
}
