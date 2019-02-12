package kr.co.one;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) {
		logger.info("Main.");
		List<ImgVO> mainImg =
		sqlSession.selectList("img_board-mapper.maim_img_list");
		model.addAttribute("main_img_list", mainImg);
		
		return "main/mainPage";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MbrVO invo, HttpSession session) {
		logger.info(invo.getMbr_id());
		logger.info(invo.getMbr_pwd());
		MbrVO sqlvo = sqlSession.selectOne("MainMapper.loginCheck",invo);
		if(sqlvo != null && !sqlvo.getMbr_no().equals("")) {
			session.setAttribute("usrSesn", sqlvo);
		}
		return "redirect:/";	
	}//login


	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public void logout(HttpSession session, PrintWriter out) {
		session.invalidate();
		out.print(1);//ok신호-신호값은 프로그래머가 정하기 나름
		out.close();
	}//logout


}//class
