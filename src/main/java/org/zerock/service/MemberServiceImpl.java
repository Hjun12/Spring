package org.zerock.service;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.zerock.domain.ActorVO;
import org.zerock.domain.DirectorVO;
import org.zerock.domain.FavoriteVO;
import org.zerock.domain.UserVO;

@Service
public class MemberServiceImpl implements MemberService {

	/*
	 * @Autowired private MemberMapper mapper;
	 */

	@Inject
	SqlSession sql;
	// 회원가입

	private static String namespace = "org.zerock.mapper.MemberMapper";

	@Override
	public void register(UserVO vo) throws Exception {
		sql.insert(namespace + ".register", vo);
	}

	// Controller에서 보내는 파라미터들을 memberUpdate(UserVO vo)로 받고
	@Override
	public void memberUpdate(UserVO vo) throws Exception {

		// 받은 vo를 매퍼로 보내줍니다.
		sql.update(namespace + ".memberUpdate", vo);

	}
	
	
	// Controller에서 보내는 파라미터들을 memberUpdate(UserVO vo)로 받고
		@Override
		public String randomPw(UserVO vo) throws Exception {

			// 받은 vo를 매퍼로 보내줍니다.
			sql.update(namespace + ".randomPw", vo);
			return null;

		}

	
	
	// 업데이트에서 처리한 내용과 같습니다.
	@Override
	public void memberDelete(UserVO vo) throws Exception {
		sql.delete(namespace + ".memberDelete", vo);
	}

	// 패스워드 체크
	@Override
	public int passChk(UserVO vo) throws Exception {
		int result = sql.selectOne(namespace + ".passChk", vo);
		return result;
	}

	@Override
	public int idChk(UserVO vo) throws Exception {
		int result = sql.selectOne(namespace + ".idChk", vo);
		return result;
	}
	
	@Override
	public int emailChk(UserVO vo) throws Exception {
		int result = sql.selectOne(namespace + ".emailChk", vo);
		return result;
	}
	
	@Override
	public int memChk(UserVO vo) throws Exception {
		int result = sql.selectOne(namespace + ".memChk", vo);
		return result;
	}
	
	//선호도 입력
	   @Override
	   public void insertfavorite(FavoriteVO vo) throws Exception{
	      sql.insert(namespace + ".insertfavorite", vo);
	   }
	   
	   public void insertactor(ActorVO vo) throws Exception{
	      sql.insert(namespace + ".insertactor", vo);
	   }
	   public void insertdirector(DirectorVO vo) throws Exception{
	      sql.insert(namespace + ".insertfavorite", vo);
	   }
		
}
