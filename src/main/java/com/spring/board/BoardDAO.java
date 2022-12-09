package com.spring.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDAO {
	@Autowired
	SqlSession sqlSession;

//	private final String BOARD_INSERT = "insert into BOARD (category, title, writer, content) values (?,?,?,?)";
//	private final String BOARD_UPDATE = "update BOARD set title=?, writer=?, content=?, category=? where seq=?";
//	private final String BOARD_DELETE = "delete from BOARD  where seq=?";

	//글 추가
	public int insertBoard(BoardVO vo) {
		int result = sqlSession.insert("Board.insertBoard", vo);
		return result;
	}

	// 글 삭제
	public int deleteBoard(int id) {
		int count = sqlSession.delete("Board.deleteBoard", id);
		return count;
	}

	//글 수정
	public int updateBoard(BoardVO vo) {
		int change = sqlSession.update("Board.updateBoard", vo);
		return change;
	}

	//원하는 데이터 하나 정보
	public BoardVO getBoard(int seq) {
		BoardVO one = sqlSession.selectOne("Board.getBoard", seq);
		return one;
	}

	//데이터 리스트 전체 정보
	public List<BoardVO> getBoardList() {
		List<BoardVO> list = sqlSession.selectList("Board.getBoardList");
		return list;
	}
}

