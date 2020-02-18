package org.zerock.service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.BoardService;

import java.util.List;

@Log4j
@Service //비지니스 영역 담당이라는 표시 , 패키지를 읽어 들이는 동안 처리가 됨
@AllArgsConstructor //?? 뭔지 모름
public class BoardServiceImpl implements BoardService {
    @Setter(onMethod_ = @Autowired)
    //스프링 4.3 부터 단일 파라미터를 받는 생성자의 경우, 필요한 파라미터 자동 주입 가능
    //AllArgsConstructor 가 모든 파라미터를 이용하는 생성자를 만듬
    //현재 mapper 를 파라미터로 받는 생성자가 생성 되 있는 거임
    private BoardMapper mapper;

    @Override
    public void register(BoardVO board) {
    }

    @Override
    public BoardVO get(Long bno) {
        return null;
    }

    @Override
    public boolean modify(BoardVO board) {
        return false;
    }

    @Override
    public boolean remove(Long bno) {
        return false;
    }

    @Override
    public List<BoardVO> getList() {
        return null;
    }
}
