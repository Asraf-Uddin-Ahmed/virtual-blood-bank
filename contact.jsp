<html>
    <head>
        <title> Contuct us - VBB</title>
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
                        <%
						String userName = (String)session.getAttribute("userName");
	
						if( userName==null ){
							out.println("<li><a href=\"reg-form.jsp\">Registration</a></li>");
							out.println("<li><a href=\"login.jsp\">Login</a></li>");
						}
						else{
							out.println("<li><a href=\"home.jsp\">Home</a></li>");
							out.println("<li><a href=\"confirm-logout.jsp\">Logout</a></li>");
						}
						%>
						<li><a href="about.jsp">About</a></li>
                    </ul>
                </div>
            </div>
            <div id="content">
                <div class="grid_4">
                    <div class="left-sidebar">
                        <h1>Contact Us</i></h1>   
                    </div>
                </div>
                <div class="grid_12">
                    <div class="contentpanel">
                        <h1>People Behind</h1>
                        <p>
							<font color="gray"><b>Idea & user interface designed by - </b></font><br/>
							<b>Md. Mahsin-Ul-Islam</b><br />
							Dept. of CSE(4th year)<br />
							Dhaka City College<br />
							e-mail:<i> mahsin.islam@gmail.com </i>
						</p>
						<p>
							<font color="gray"><b>Designed & developed by - </b></font><br/>
							<b>Asraf Uddin Ahmed</b><br />
							Dept. of ICT(4th year)<br />
							Mawlana Bhashani Science and Technology University<br />
							e-mail:<i> 13ratul@gmail.com </i>
						</p>
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
