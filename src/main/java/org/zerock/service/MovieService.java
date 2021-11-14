package org.zerock.service;

import java.util.List;

import org.zerock.domain.MovieVO;
import org.zerock.domain.PagingVO;
public interface MovieService {
	//List<MovieVO> insertMovie() throws Exception;
	List<MovieVO> selectMovie()throws Exception;

	public void insertMovie(MovieVO vo) throws Exception;
	

	public void deleteMovie(MovieVO vo) throws Exception;
	
	 /* 영상물 조회 */
    public MovieVO getPage(int contentsid);
    
    public MovieVO modify(MovieVO movie);
    
    public int delete(int contentsid);
    
 // 게시물 총 갯수
    public int countBoard();

    // 페이징 처리 게시글 조회
    public List<MovieVO> selectBoard(PagingVO vo);
    
    //아이디 중복체크
    public int idChk(MovieVO vo) throws Exception;
    
    
    //ajax 로 contentsid 중복확인
    public interface UserService {
        public int idCheck(String id);
    }
	
}
