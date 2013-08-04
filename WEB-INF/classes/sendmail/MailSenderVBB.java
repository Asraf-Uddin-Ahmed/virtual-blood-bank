package sendmail;


public class MailSenderVBB{

	MailSender mailSender = null;

	private boolean isSuccess = false;
	private String toList[] = new String[1];
	private String textSubject = null;
	private String textBody = null;
	private String rootUrl = "http://localhost:8080/vbb/";

	/*
	CONSTRUCTOR
	*/
	public MailSenderVBB(){
		mailSender = new MailSender("vbb.ratul@gmail.com", "vbb.ratul", "smtp.gmail.com", "587");
	}

	/*
	VBB new account confirmation mail send
	*/
	public boolean sendNew(String toMailId, String userName, String password){
		toList[0] = toMailId;
		textSubject = "Your VBB account successfully created.";
		textBody = "Congratulations on creating your brand new VBB account,\n\n"+
							"User Name : "+userName+"\n"+
							"Password : "+password+"\n\n"+
							"You can login to your account at "+rootUrl;

		isSuccess = mailSender.send(toList, textSubject, textBody, null, null);
		return isSuccess;
	}

	/*
	VBB update account confirmation mail send
	*/
	public boolean sendUpdate(String toMailId, String userName, String password){
		toList[0] = toMailId;
		textSubject = "Your VBB account successfully changed.";
		textBody = "Your VBB account successfully changed. Your new\n\n"+
							"User Name : "+userName+"\n"+
							"Password : "+password+"\n\n"+
							"You can login to your account at "+rootUrl;

		isSuccess = mailSender.send(toList, textSubject, textBody, null, null);
		return isSuccess;
	}

	/*
	VBB urgent notification mail send
	*/
	public boolean sendNotification(String toMailId, String userName, String bloodGroup, String city, String mobileNumber, String emailId){
		toList[0] = toMailId;
		textSubject = "Urgent blood need.";
		textBody = "Urgent "+bloodGroup+" blood need for "+userName+" who lives in your city "+city+".\n\n"+
						 "Mobile No. "+mobileNumber+"\n"+
						 "Email id : "+emailId+"\n\n"+
						 " - VBB";

		isSuccess = mailSender.send(toList, textSubject, textBody, null, null);
		return isSuccess;
	}
}