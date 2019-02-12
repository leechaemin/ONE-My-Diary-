package kr.co.one;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
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
public class JoinFormController {

	private static final Logger logger = LoggerFactory.getLogger(JoinFormController.class);

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/join_form", method = RequestMethod.GET)
	public String join_form() {
		logger.info("Join_form");
		return "main/join_form";
	}

	@RequestMapping(value="/idCheck", method= RequestMethod.POST)
	public void idCheck(MbrVO invo, PrintWriter out) {
		logger.info("idCheck");
		logger.info("id : " + invo.getMbr_id());
		int idCnt = 0;
		idCnt = sqlSession.selectOne("MainMapper.idCheck", invo);
		logger.info("=========");
		out.print(idCnt);
		out.close();
	}//idCheck
	
	@RequestMapping(value="/joinins", method = RequestMethod.POST)
		public void joinins(MbrVO invo , PrintWriter out) {
		logger.info("joinins");
		int successCnt = 0;
		successCnt = sqlSession.insert("MainMapper.join_form_ins", invo);
		out.print(successCnt);
		out.close();
	}
}
