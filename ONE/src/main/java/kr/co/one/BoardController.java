package kr.co.one;

import java.util.HashMap;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	private static final int BoardVO = 0;

	@Autowired
	SqlSession sqlSession;
/*
	@RequestMapping(value="/board_main", method= RequestMethod.GET)
		public String board_main() {
			logger.info("board_main");
			return "board/board_main";
		}//board_main
	*/
	@RequestMapping(value="/board_list", method= RequestMethod.GET)
	public String board_list(Model model, String page) {
		logger.info("board_list");
		int beginRNum = 1;
		int endRNum = 10;
		if(page != null && !page.equals("")) {
			endRNum	= Integer.parseInt(page) * 10;
			beginRNum = endRNum - 9;
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("beginRNum", ""+beginRNum);
		map.put("endRNum", ""+endRNum);
		List<BoardVO> list =
		sqlSession.selectList("board-mapper.freeBoardList", map);
		model.addAttribute("brd_free_list", list);
		int Cnt =  sqlSession.selectOne("board-mapper.selBrdListCnt",map);
		logger.info("cnt : "+Cnt);
		int pageEnd = Cnt / 10;
		if(Cnt % 10 >0) {
			pageEnd++;
		}
		model.addAttribute("pagingEnd", pageEnd);
		return "board/board_list";
	}//board_list
	
	@RequestMapping(value="/board_write", method= RequestMethod.GET)
	public String board_write() {
		logger.info("board_write");
		return "board/board_write";
	}//board_write
	
	@RequestMapping(value="/insBoard", method= RequestMethod.POST)
	public void insBoard(Model model, BoardVO vo, PrintWriter out) {
		logger.info("insBoard");
		int successCnt = 0;
		successCnt= sqlSession.insert("board-mapper.insbrd", vo);
		logger.info("successCnt : "+successCnt);
		out.print(successCnt);
		out.close();	
	}//board_write
	
	@RequestMapping(value="/board_detail", method= RequestMethod.GET)
	public String board_detail(Model model, BoardVO vo) {
		logger.info("board_detail");
		sqlSession.update("board-mapper.upd_brd_view_cnt", vo);
		vo  =sqlSession.selectOne("board-mapper.detailselc", vo);
		model.addAttribute("board_detail_vo", vo);
		return "board/board_detail";
	}//board_write
	
	@RequestMapping(value="/del_brd", method= RequestMethod.GET)
	public void del_brd(PrintWriter out, String brd_no) {
		logger.info("del_brd");
		int ok =0;
		ok=sqlSession.delete("board-mapper.del_brd", brd_no);
		out.println(ok);
		out.close();
	}//del_brd
	
	@RequestMapping(value="/brd_like_btn", method= RequestMethod.GET)
	public void brd_like_btn(PrintWriter out, String no) {
		logger.info("brd_like_btn");
		int successCnt = 0;
		successCnt = sqlSession.update("board-mapper.upd_brd_like_cnt", no);
		out.println(successCnt);
		out.close();
	}//brd_like_btn
	
	@RequestMapping(value="/board_update", method= RequestMethod.GET)
	public String board_update(Model model, BoardVO vo) {
		logger.info("board_update");
		vo = sqlSession.selectOne("board-mapper.detailselc",vo);
		model.addAttribute("board_detail_vo", vo);
		return "board/board_update";
	}//board_update
	
	@RequestMapping(value="/updBoard", method= RequestMethod.POST)
	public void updBoard(Model model, BoardVO vo, PrintWriter out) {
		logger.info("insBoard");
		int successCnt = 0;
		successCnt= sqlSession.update("board-mapper.upd_brd", vo);
		logger.info("successCnt : "+successCnt);
		out.print(successCnt);
		out.close();	
	}//updBoard

	@RequestMapping(value="/ckupload", method=RequestMethod.POST)
	public void upload(MultipartRequest multiReq, String pgfrm
			, PrintWriter print) throws IOException {
		logger.info("=== upload ===");

		MultipartFile file = multiReq.getFile("upload");

		String upFilePath = "";
		String upFileName = "";
		upFilePath = UtilForFile.fileUpByType(file, pgfrm, "tmp");
		upFileName = upFilePath.substring(upFilePath.lastIndexOf("/")+1, upFilePath.length());

		JSONObject json = new JSONObject();
		json.put("uploaded", 1);
		json.put("fileName", upFileName);
		json.put("url", "./"+upFilePath);

		print.print(json);
		print.close();
	}//upload

	
	
}//class
