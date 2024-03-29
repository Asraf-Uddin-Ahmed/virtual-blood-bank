<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<script src="javascript/reg_edit_form.js"></script>

<%@page import="java.util.*,registraform.*"%>
<%
	String paramFirstName = RegistrationFieldName.firstName;
	String paramLastName = RegistrationFieldName.lastName;
	String paramUserName = RegistrationFieldName.userName;
	String paramBirthDate = RegistrationFieldName.birthDate;
	String paramBirthMonth = RegistrationFieldName.birthMonth;
	String paramBirthYear = RegistrationFieldName.birthYear;
	String paramNewPassword = RegistrationFieldName.newPassword;
	String paramConfirmPassword = RegistrationFieldName.confirmPassword;
	String paramCity = RegistrationFieldName.city;
	String paramMobileNumber = RegistrationFieldName.mobileNumber;
	String paramEmailId = RegistrationFieldName.emailId;	
	String paramBloodGroup = RegistrationFieldName.bloodGroup;	
	
	//for showing previous date if any error occured
	String selectString = null;
	int selectItem = 0;
	HashMap regInfo = ((HashMap)session.getAttribute("regInfo"));
	if( regInfo==null )
		regInfo = new HashMap<String, String>();
%>

<head>
	<title>	Profile - VBB </title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="css/reset.css" />
	<link rel="stylesheet" type="text/css" href="css/960.css" />
	<link rel="stylesheet" type="text/css" href="css/text.css" />
	<link rel="stylesheet" type="text/css" href="css/demo.css" />
	<link rel="stylesheet" type="text/css" href="css-user/style.css" />
</head>

<body>
	<div class="container_16">
		<div class="grid_16">
			<div class="banner">
			</div>   
		</div>
		
		<div class="clear"></div>
		
		<div class="grid_16">
			<div class="top-nav">
				<ul>
					<li><a href="home.jsp">Home</a></li>
					<li><a href="about.jsp">About</a></li>
					<li><a href="contact.jsp">Contact Us</a></li>
					<li><a href="confirm-logout.jsp">Logout</a></li>
				</ul>
			</div>
		</div>
		<div id="content">
			<div class="grid_4">
				<div class="left-sidebar">
					<h1>Profile</h1>   
				</div>
			</div>
			<div class="grid_12">
				<div class="contentpanel">
					<h1> Your profile </h1>
					<form action="check-edit-form" method="post">
						<fieldset>
						<legend><big><b>Personal Information</b></big></legend>
							<table>
								
								<!-- FIRST NAME -->
								<tr>
													<td>First Name </td>
													<td><input type="text" title="enter your first name" name="<%=paramFirstName%>" id="<%=paramFirstName%>" value="${regInfo.textFirstName}" /></td>
													<td class="third_col">${errors.textFirstName}</td>
								</tr>
								
								<!-- LAST NAME -->
								<tr>
													<td>Last Name </td>
													<td><input type="text" title="enter your last name" name="<%=paramLastName%>" id="<%=paramLastName%>"  value="${regInfo.textLastName}"/></td>
													<td class="third_col">${errors.textLastName}</td>
								</tr>
								
								<!-- USER NAME -->
								<tr>
													<td>User Name </td>
													<td><input type="text" title="enter your user name" name="<%=paramUserName%>" id="<%=paramUserName%>"  value="${regInfo.textUserName}"/></td>
													<td class="third_col">${errors.textUserName}</td>
								</tr>
								
								<!-- DATE OF BIRTH -->
								<tr>
									<td>Date of Birth </td>
									<td>
										day<select type="text" name="<%=paramBirthDate%>" id="<%=paramBirthDate%>">
											<% 	
												selectString = (String)regInfo.get(paramBirthDate);
												selectItem = (selectString==null)? 0 : (Integer.valueOf(selectString));
												for(int I=1; I<=31; I++){
													if( I==selectItem ){
														out.println("<option selected>"+I+"</option>");
													}
													else{
														out.println("<option>"+I+"</option>");
													}
												} 
											%>
										</select>
										month<select type="text" name="<%=paramBirthMonth%>" id="<%=paramBirthMonth%>">
											<% 	
												selectString = (String)regInfo.get(paramBirthMonth);
												selectItem = (selectString==null)? 0 : (Integer.valueOf(selectString));
												for(int I=1; I<=12; I++){
													if( I==selectItem ){
														out.println("<option selected>"+I+"</option>");
													}
													else{
														out.println("<option>"+I+"</option>");
													}
												} 
											%>
										<select>
										year<select type="text" name="<%=paramBirthYear%>" id="<%=paramBirthYear%>">
											<% 	
												selectString = (String)regInfo.get(paramBirthYear);
												selectItem = (selectString==null)? 0 : (Integer.valueOf(selectString));
												for(int I=new Date().getYear()+1900; I>=1950; I--){
													if( I==selectItem ){
														out.println("<option selected>"+I+"</option>");
													}
													else{
														out.println("<option>"+I+"</option>");
													}
												} 
											%>
										</select>
									</td>
									<td class="third_col">${errors.textBirth}</td>
								</tr>
								
								<!-- BLOOD GROUP -->
								<tr>
													<td>Blood Group</td>
													<td>
														<select type="text" name="<%=paramBloodGroup%>" id="<%=paramBloodGroup%>"/>
																<% 	
																		String selectBlood = (String)regInfo.get(paramBloodGroup);
																		String bloodList[] = {"A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"};
																		for(int I=0; I<bloodList.length; I++){
																				if( bloodList[I].equals(selectBlood)==true ){
																						out.println("<option selected>"+bloodList[I]+"</option>");
																				}
																				else{
																						out.println("<option>"+bloodList[I]+"</option>");
																				}
																		} 
																%>
														</select>
													</td>
													<td class="third_col">${errors.textBloodGroup}</td>
								</tr>
								
								<!-- NEW PASSWORD -->
								<tr oninput="checkPasswordStrength()">
													<td>New Password</td>
													<td> <input type="password" name="<%=paramNewPassword%>" id="<%=paramNewPassword%>"  value="${regInfo.passwordNewPassword}"/></td>
													<td class="third_col" id="newPass3rdCol">${errors.passwordNewPassword}</td>
								</tr>
								
								<!-- CONFIRM PASSWORD -->
								<tr oninput="checkPasswordMatch()">
													<td>Confirm Password</td>
													<td> <input type="password" name="<%=paramConfirmPassword%>" id="<%=paramConfirmPassword%>" value="${regInfo.passwordConfirmPassword}"/></td>
													<td class="third_col" id="conPass3rdCol">${errors.passwordConfirmPassword}</td>
								</tr>
							</table>
						</fieldset>
				<div class="clear"></div>
						<fieldset>
							<legend><big><b>Contact Information</b></big></legend>
							<table>

								<!-- CITY -->
								<tr>
									<td>City</td>
									<td><input type="text" title="enter your city name" name="<%=paramCity%>" id="<%=paramCity%>"  value="${regInfo.textCity}"/></td>
									<td class="third_col">${errors.textCity}</td>
								</tr>

								<!-- MOBILE NO -->
								<tr oninput="checkNumber()">
									<td>Mobile No. +88</td>
									<td><input type="text" title="enter your mobile number" name="<%=paramMobileNumber%>" id="<%=paramMobileNumber%>" value="${regInfo.textMobileNumber}"/></td>
									<td class="third_col" id="mobNo3rdCol">${errors.textMobileNumber}</td>
								</tr>

								<!-- EMAIL ID -->
								<tr>
									<td>Email ID </td>
									<td><input type="text" title="enter your email id" name="<%=paramEmailId%>" id="<%=paramEmailId%>" value="${regInfo.textEmailId}"/></td>
									<td class="third_col">${errors.textEmailId}</td>
								</tr>
							</table>
						</fieldset>
						 <div class="clear"></div>
						<input type="submit" value="Save" name="submitButton"/>
						<input type="submit" value="Back" name="submitButton"/>
					</form>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div class="grid_16">
			<div class="footer">
				Copyright &copy; 2012 Asterisk
			</div>
		</div>
	</div>
</body>

</html>