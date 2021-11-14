package org.zerock.service;

import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

public interface UserService {

  public UserVO login(LoginDTO dto) throws Exception;
 
  public void memberUpdate(LoginDTO dto) throws Exception;
  
  public UserVO checkLoginBefore(String value);  
  
}
