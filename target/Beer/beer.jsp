<%@ page import="controller.*"%>
<%@ page import="controller.Controller"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Our History - Our History | Oktoberfest - Free Website Template from Templates.com</title>
<meta name="description" content="Place your description here">
<meta name="keywords" content="put, your, keyword, here">
<meta name="author" content="Templates.com - website templates provider">
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
<body id="page4">
<div class="body-bg wrap">
   <!-- header -->
   <header>
      <div class="container">
         <h1><a href="index.html">Brewery</a></h1>
         <nav>
            <ul>
               <li><a href="index.html"><span>Inicio</span></a></li>
               <li><a href="news.html"><span>Mapa de información</span></a></li>
               
               <li><a href="news.html"><span><%= Controller.getController().getOneBeer() %></span></a></li>

            </ul>
         </nav>
         <div class="indent">
            <p><strong>Brewery</strong> is a free web teemate created by TemplateMonster.com team. This website template is optimized for 1024X768 screen resolution.</p>
            <p class="p0">This website template has several pages: <a href="index.html">Home</a>, <a href="news.html">Fresh News</a>, <a href="history.html">Our History</a>, <a href="beer.html">Our Beer</a>, <a href="contacts.html">Contacts</a> (note that contact us form – doesn’t work), <a href="sitemap.html">Site Map</a>.</p>
         </div>
      </div>
   </header>
   <!-- content -->
   <section id="content">
      <div class="container">
         <div class="inside">
            <h2>Our Beer</h2>
            <div class="box">
               <div class="left-top-corner">
                  <div class="right-top-corner">
                     <div class="border-top"></div>
                  </div>
               </div>
               <div class="xcontent">
                  <div class="border-left">
                     <div class="border-right">
                        <div class="inner1">
                           <div class="img-box alt"><img src="images/icon2.png">
                              <p class="p0"><b>Lorem ipsum dolor sit amet,</b> consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>
                           </div>
                           <div class="img-box alt"><img src="images/icon3.png" class="fright">
                              <p class="p0"><b>Totam rem aperiam,</b> eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. </p>
                           </div>
                           <div class="img-box"><img src="images/icon1.png">
                              <p class="p0"><b>Ut enim ad minima veniam,</b> quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia.</p>
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
         </div>
      </div>
   </section>
</div>
<!-- footer -->
<footer>
   <div class="container">
      <div class="inside"><a href="http://www.templatemonster.com/" class="new_window" target="_blank" rel="nofollow">www.templatemonster.com</a></div>
   </div>
</footer>
<script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
