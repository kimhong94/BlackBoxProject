package com.blackboxproject.service;

import java.util.Date;

import com.blackboxproject.domain.UserVO;
import com.blackboxproject.dto.LoginDTO;


public interface UserService {

  public UserVO login(LoginDTO dto) throws Exception;

  public void keepLogin(String user_id, String sessionId, Date next)throws Exception;
  
  public UserVO checkLoginBefore(String value);  
  
  public void addUser(UserVO vo) throws Exception;
  
  public int checkId(UserVO vo) throws Exception;
  public int checkNick(UserVO vo) throws Exception;
  
  public void deleteUser(String user_id) throws Exception;
  public void updateUser(UserVO vo) throws Exception;
  
  public UserVO find_id_user(String user_nick, String user_email) throws Exception;
  public UserVO find_pw_user(String user_id, String user_email) throws Exception;
  public void updateRanPw(String user_id, String user_pw) throws Exception;
}
