<%@page import="java.text.Normalizer.Form"%>
<%@page import="java.net.URL"%>
<%@page import="controller.Controller"%>
<%@page import="model.Beer"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Beers</title>
<meta name="description" content="información de cervezas">
<meta name="keywords" content="beer,cervezas,info">
<meta name="author" content="AlexisRuiz">
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/OrigGarmnd_BT_400.font.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<!--[if lt IE 7]>
   <script type="text/javascript" src="http://info.template-help.com/files/ie6_warning/ie6_script_other.js"></script>
 <![endif]-->
<!--[if lt IE 9]>
  	<script type="text/javascript" src="js/html5.js"></script>
  <![endif]-->
</head>
<body id="page1">
<div class="body-bg wrap">
   <!-- header -->
   <header>
      <div class="container">
         <h1><a href="index.html">Brewery</a></h1>
         <nav>
            <ul>
               <li class="current"><a href="index.jsp"><span>Inicio</span></a></li>
               <li><a href="sitemap.jsp"><span>Mapa de informacion</span></a></li>
            </ul>
         </nav>
         
         
         <div class="indent">
            <p>Selecciona una cerveza de la lista para conocer su descripción</p>
         </div>
    
      </div>
   </header>
   <!-- content -->
   <section id="content">
      <div class="container">
         <div class="inside">
            <div class="indent">
               <h2>Cervezas</h2>
               <ul class="box-list">
                  <li>
                     <div class="box">
                        <div class="left-top-corner">
                           <div class="right-top-corner">
                              <div class="border-top"></div>
                           </div>
                        </div>
                        <div class="xcontent">
                           <div class="border-left">
                              <div class="border-right">
                                 <div class="inner">
                                    <div class="img-box"><img src="images/icon1.png">
                                       <h5>Selecciona una cerveza</h5>
                                      
                                       
										<% 
		                                    ArrayList<Beer> cervezas = (ArrayList)Controller.getController().getBeerList();  
		                                %>  
											<form action="index.jsp" method="post">
											<select name="beer_id">											
									   <% 	
									    	for(Beer b: cervezas){
									    %>
											<option  selected="selected"  value="<%=b.getId()%>"><%=b.getName()%></option>
											 <% } %>
											
											<input type="submit" value="Elegir">
											</form>
									
											
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="left-bot-corner">
                           <div class="right-bot-corner">
                              <div class="border-bot"><span class="clip-left"></span><span class="clip-right"></span></div>
                           </div>
                        </div>
                     </div>
                  </li>
                  <li>
                     <div class="box">
                        <div class="left-top-corner">
                           <div class="right-top-corner">
                              <div class="border-top"></div>
                           </div>
                        </div>
                        <div class="xcontent">
                           <div class="border-left">
                              <div class="border-right">
                                 <div class="inner">
                                    <div class="img-box"><img src="images/icon2.png">
                                                                      
                             
                                       
                                       <p class="p0">
                                       <%Beer beer= Controller.getController().getBeerById(request.getParameter("beer_id")); %>
                                       <h5><%=beer.getName() %></h5>
                                       
                                       
                                       <p class="p0"> 
                         			   Descripcion: : <%=beer.getDescription() %> </p>
                         			   
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="left-bot-corner">
                           <div class="right-bot-corner">
                              <div class="border-bot"></div>
                           </div>
                        </div>
                     </div>
                  </li>
               </ul>
            </div>
         </div>
      </div>
   </section>
</div>
<!-- footer -->
<footer>

</footer>
<script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
