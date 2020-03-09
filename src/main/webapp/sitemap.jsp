<%@page import="controller.Controller"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.String"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Site Map - Site Map | Oktoberfest - Free Website Template
	from Templates.com</title>
<meta name="description" content="Place your description here">
<meta name="keywords" content="put, your, keyword, here">
<meta name="author" content="Templates.com - website templates provider">
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<link href="https://api.mapbox.com/mapbox-gl-js/v1.8.1/mapbox-gl.css" rel="stylesheet" />
<script src="https://api.mapbox.com/mapbox-gl-js/v1.8.1/mapbox-gl.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/OrigGarmnd_BT_400.font.js"></script>
<script type="text/javascript" src="js/script.js"></script>

<style>
#map {
	position: absolute;
	top: 35pt;
	bottom: 0;
	margin-botton:900px;
	height: 250%;
	width: 70%;
}

.coordinates {
	background: rgba(0, 0, 0, 0.5);
	color: #fff;
	position: absolute;
	bottom: 40px;
	left: 10px;
	padding: 5px 10px;
	margin: 0;
	font-size: 11px;
	line-height: 18px;
	border-radius: 3px;
	display: none;
}

</style>

</head>
<body id="page6">
	<div class="body-bg wrap">
		<!-- header -->
		<header>
			<div class="container">
				<h1>
					<a href="index.html">Brewery</a>
				</h1>
				<nav>
					<ul>
						<li><a href="index.jsp"><span>Inicio</span></a></li>
						<li class="current"><a href="sitemap.jsp"><span>Mapa de información</span></a></li>
					</ul>
				</nav>
				<div class="indent">
					<p>
						Elige un sitio en el mapa para conocer las  cervecerías del lugar.
					</p>
				</div>
			</div>
		</header>
		<!-- content -->
		<section id="content">
			<div class="container">
				<div class="inside">
					<h2>Mapa</h2>
					<div class="box">
					<pre id="coordinates" class="coordinates"></pre>

								<div id="map">

											<script>
												mapboxgl.accessToken = 'pk.eyJ1IjoiYWxleGlzcnVpeiIsImEiOiJjazdqbGV5NmwwczV1M2VwZW5pc3Bma2IxIn0.nMuWlYUQn8Ul273KTfnl1Q';
												var coordinates = document.getElementById('coordinates');
												var map = new mapboxgl.Map({
												container: 'map',
												style: 'mapbox://styles/mapbox/streets-v11',
												center: [0, 0],
												zoom: 2
												});
												 
												var marker = new mapboxgl.Marker({
												draggable: true
												})
												.setLngLat([0, 0])
												.addTo(map);
												 
												function onDragEnd() {
												var lngLat = marker.getLngLat();
												

												document.forms['ifo']['formLat'].value = lngLat.lat;
												document.forms['ifo']['formLong'].value = lngLat.lng;
												
												}
			 
												marker.on('dragend', onDragEnd);
											</script>
										</div>
									</div>																					
								</div>
							</div>
						</div>
						</section>
					
					</br>
					</br>
					</br>
					</br>
					</br>
					</br>
					</br>
					</br>
					</br>
					</br>
					</br>
					</br>				
			
					<section id="content">
						<div class="container">
							<div class="inside">							
								<div class="box">
								
									<form action="sitemap.jsp" method="post" name="ifo">
									
									<label for="formLat">Latitud</label>
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										
									<label for="formLong">Longitud</label><br>
									
									<input type="text" name="formLat" value="" >
									<input type="text" name="formLong" value="">
										
									<input type="submit" value="Buscar">
									</form>
									
									</br>
									</br>
									<b>Cervecerías:</b>
									<% 
									ArrayList<String> cervecerias= Controller.getController().getCervecerias(request.getParameter("formLat"), request.getParameter("formLong")); 
									%>
									<ul>
									<%for (String s: cervecerias){ %>
										<li><%=s%>  </li>
										<%}%>
									</ul>
									
									
					</br>
					</br>
																
								</br>
							
									</div>
								</div>
							</div>
						</div>	
					</section>			
								
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
	
	</footer>
	<script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
