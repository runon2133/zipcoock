package mapper.mainboard.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.zipcoock.mypage.dao.MypageDao;
import kr.or.zipcoock.mypage.vo.DeleteObj1;
import kr.or.zipcoock.mypage.vo.InsertObj;
import kr.or.zipcoock.mypage.vo.SelectList;
import kr.or.zipcoock.mypage.vo.UpdateObj1;

@Service
public class MypageService {
	@Autowired
	private MypageDao dao;

	public int insert(InsertObj obj) {
		return dao.insert(obj);
	}

	public int update(UpdateObj1 obj) {
		return dao.update(obj);
	}

	public int delete(DeleteObj1 obj) {
		return dao.delete(obj);
	}

	public void selectList(SelectList list) {
		// TODO Auto-generated method stub

	}
}
