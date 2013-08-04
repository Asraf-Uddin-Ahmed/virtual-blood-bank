<html>
    <head>
        <title> About - VBB</title>
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
						<li><a href="contact.jsp">Contact Us</a></li>
                    </ul>
                </div>
            </div>
            <div id="content">
                <div class="grid_4">
                    <div class="left-sidebar">
                        <h1>About</i></h1>   
                    </div>
                </div>
                <div class="grid_12">
                    <div class="contentpanel">
                        <h1>Virtual Blood Bank</h1>
                        <p> The gift of blood is the gift of life. There is no substitute for human blood. Blood donations are an integral and essential part of our health care system. Every two seconds someone needs blood. Blood donation is volunteering to give some of your blood to help people who need extra blood after or during surgery.</p>
						<p>Virtual Blood Bank aims to automate the communication among all the donors and the acceptors who need blood transfusion in Bangladesh. People who are seriously injured they can easily found particular blood group by using this system. Blood related post also is found at here. A person in need can visit the website to search for a suitable donor based on the blood group, city/town.Even a person need urgent donor they can easily sms the donor by this system. </p>
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
