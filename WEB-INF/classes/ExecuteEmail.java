import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.HashMap;
import java.util.Enumeration;
import java.util.Vector;


import database.*;
import sendmail.*;

public class ExecuteEmail extends HttpServlet {

	/*
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String selectValue = request.getParameter("submitButton");

		//if reload or NO submitted.
		if( selectValue==null || selectValue.equals("Yes")==false ){
			response.sendRedirect("home.jsp");
			return ;
		}

		//if YES submitted
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("userName");

		RegUserInfoTable regUserInfoTable = new RegUserInfoTable();
		//store recepient info
		Vector userInfo = (Vector)regUserInfoTable.getModifiedUserInfoUserName(userName).get(0);
		String bloodGroup = (String) userInfo.get(3);
		String city = (String) userInfo.get(4);
		String mobileNumberRecepient = (String) userInfo.get(5);
		String emailId = (String) userInfo.get(6);

		//store donor's mobile no.
		int totalSuccessfullSend = 0;
		Vector emailIdList = regUserInfoTable.getDonorEmailId(userName);

		//sending sms
		MailSenderVBB mailSenderVBB = new MailSenderVBB();
		if( emailIdList!=null ){
			for(Object emailIdVector : emailIdList){
				String emailIdDonor = (String)((Vector)emailIdVector).get(0);
				if( mailSenderVBB.sendNotification(emailIdDonor, userName, bloodGroup, city, mobileNumberRecepient, emailId)==true ){
					totalSuccessfullSend++;
				}
			}
			//successful send message info
			String messageInfo = "Emails send "+totalSuccessfullSend+" out of "+emailIdList.size();
			session.setAttribute("messageInfo", messageInfo);
		}

		response.sendRedirect("home.jsp");
	}

	/*
	*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}