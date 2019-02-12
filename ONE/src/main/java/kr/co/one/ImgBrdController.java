package kr.co.one;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
public class ImgBrdController {
	
	private static final Logger logger = LoggerFactory.getLogger(ImgBrdController.class);

	private static final int ImgVO = 0;

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value="/img_brd", method= RequestMethod.GET)
	public String board_list(Model model, String page) {
		logger.info("board_list");
		List<ImgVO> imglist = sqlSession.selectList("img_board-mapper.img_list_selc");
		model.addAttribute("img_brd_list", imglist);
		return "img/img_brd";
	}//img_brd

	@RequestMapping(value="/img_pop", method= RequestMethod.GET)
	public String img_pop() {
		logger.info("img_pop");
		return "img/img_pop";
	}//img_pop

	@RequestMapping(value="/go_img_pop", method= RequestMethod.POST)
	public void go_img_pop(MultipartRequest multipartRequest, ImgVO vo, PrintWriter out) {
		logger.info("go_img_pop");
		String no = sqlSession.selectOne("img_board-mapper.select_img_no");
		vo.setImg_no(no);
		String upFilePath = "";
		MultipartFile file = multipartRequest.getFile("popFileUp");
		logger.info(file.getOriginalFilename());
		if(file.getOriginalFilename() != null && file.getOriginalFilename().length() > 0) {
			upFilePath = UtilForFile.fileUpByType(file, "imgBrd", vo.getImg_no());
			vo.setImg(upFilePath);
		}//if
		
		int cnt = 0;
		cnt = sqlSession.insert("img_board-mapper.insert_img", vo);
		out.print(cnt);
		out.close();
	}//go_img_pop
	


}//class
