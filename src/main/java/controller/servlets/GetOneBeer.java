package controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import controller.Controller;

public class GetOneBeer extends HttpServlet {

	public void doGet(HttpServletRequest request,HttpServletResponse response)
			throws ServletException, IOException{

		RestTemplate restTemplate = new RestTemplate();
		long lat = 0;
		long lon = 0;
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);


		lat = Long.valueOf( request.getParameter("formLat"));
		lon = Long.valueOf( request.getParameter("formLong"));
		
		
		String url = 
				"https://eu1.locationiq.com/v1/reverse.php?key=15e19e7ed7ca06&lat="+lat+"&lon="+lon+"122.306283180899&format=json";
		
		ResponseEntity<String> json = restTemplate.exchange(url,HttpMethod.GET,entity,String.class);

		Document doc = Document.parse(json.getBody());

		System.out.println(doc);
		
		String city = doc.getString("city");
		
		url = 
				"https://api.openbrewerydb.org/breweries?by_city="+city;
		
		
		ResponseEntity<String[]> json2 = restTemplate.exchange(url,HttpMethod.GET,entity,String[].class);
		ArrayList<Document> doc2 = new ArrayList<>();
				
				for(String s : Arrays.asList(json2.getBody()))
					doc2.add(Document.parse(json.getBody()));

		System.out.println(doc);

		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		out.println("<p>");
		out.print(Controller.getController().getOneBeer());
		out.println("</p>");
	}


}
