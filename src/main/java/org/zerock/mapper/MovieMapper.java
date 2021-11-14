package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.MovieVO;
import org.zerock.domain.PagingVO;

public interface MovieMapper {
	// 영상 등록
	public void insertMovie(MovieVO vo) throws Exception;

	public void deleteMovie(MovieVO vo) throws Exception;

	List<MovieVO> selectMovie();

	public MovieVO getPage(int contentsid);

	public MovieVO modify(MovieVO movie);
	
	public int delete(int contentsid);
	
	// 게시물 총 갯수
	public int countBoard();

	// 페이징 처리 게시글 조회
	public List<MovieVO> selectBoard(PagingVO vo);
	
	// 아이디 중복체크
		public int idChk(MovieVO vo) throws Exception;
}
