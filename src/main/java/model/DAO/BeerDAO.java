package model.DAO;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.bson.Document;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.google.gson.JsonArray;
import com.gtranslate.Language;
import com.gtranslate.Translator;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

import model.Beer;

public class BeerDAO {


	RestTemplate restTemplate;
	MongoClient mongoClient;
	MongoDatabase db;

	public BeerDAO() {
		mongoClient = MongoClients.create("mongodb://localhost:27017");
		restTemplate = new RestTemplate();
		db = mongoClient.getDatabase("BeerWeb");
	}


	public void insertarCiudad(Document beer) {
		db.getCollection("beers").insertOne(beer);
	}

	public List<Document> getBeers(){
		List<Document> ciudades = 
				db.getCollection("beers").find().into(
						new ArrayList<Document>());


		return ciudades;
	}

	public String getOneBeer(){

		String beer = 
				(String)db.getCollection("beers").find().first().get("name");


		return beer;
	}


	public ArrayList<Beer> getBeerList(){
		
		ArrayList<Beer> beers = new ArrayList<Beer>();

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);

		
		
		
		for (int i = 0; i < 10; i++) {
			ResponseEntity<String> json = restTemplate.exchange("https://api.punkapi.com/v2/beers/random",HttpMethod.GET,entity,String.class);			
			Document doc = Document.parse(json.getBody().substring(1,json.getBody().length()-1));
			
			Beer beerTmp = new Beer(doc.getInteger("id"),doc.getString("name"));
	/*		
			 json = restTemplate.exchange(						"https://translate.yandex.net/api/v1.5/tr.json/translate?"
						+ "key=trnsl.1.1.20200308T165332Z.73d1a65681d2b63f.caf8d6ce35cc9cd58a6f1ab0a844a69b07dee729&"
						+ "text='"+doc.getString("description")+"'"
						+ "&lang=en-es"
						+ "&[format=plain]",HttpMethod.GET,entity,String.class);	
				
			doc = Document.parse(json.getBody());
			beerTmp.setDescription(doc.getString("description"));						
*/			
			beers.add(beerTmp);
		}
		
		return beers;	}


	public String getOneBeerFromApi() {		

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);


		ResponseEntity<String> json = restTemplate.exchange("https://api.punkapi.com/v2/beers/random",HttpMethod.GET,entity,String.class);

		Document doc = Document.parse(json.getBody().substring(1,json.getBody().length()-1));


		
		return doc.getString("name");		
	}
	
	
	public ArrayList<String> getCervecerias(double lat, double lon){
			
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
		
		
		String url = 
				"https://eu1.locationiq.com/v1/reverse.php?key=15e19e7ed7ca06&lat="+lat+"&lon="+lon+"&format=json";
		
		ResponseEntity<String> json = restTemplate.exchange(url,HttpMethod.GET,entity,String.class);

		Document doc = Document.parse(json.getBody());
		
		doc = (Document)doc.get("address");
		
		String city = doc.getString("city");
		
		url = 
				"https://api.openbrewerydb.org/breweries?by_city="+city;
		
		ResponseEntity<String> json2 = restTemplate.exchange(url,HttpMethod.GET,entity,String.class);
		

		
		System.out.println(json2.getBody());
		
		boolean flag = false;
		
		
			
		ArrayList<Document> doc2 = new ArrayList<>();
		String tmp = json2.getBody();
				
		do{
			try{
				
				System.out.println((tmp.substring(tmp.indexOf("{"),tmp.indexOf("}")+1)));
				doc2.add(Document.parse(tmp.substring(tmp.indexOf("{"),tmp.indexOf("}")+1)));
				tmp = tmp.substring(tmp.indexOf("}")+1,tmp.length());
				
				System.out.println(tmp);			
			}catch(Exception e){
				flag = true;
			}
		
		}while(!flag);
					
		System.out.println(doc2);
	
	
		ArrayList<String> cervecerias = new ArrayList<>();
		for (Document d : doc2)
			cervecerias.add(d.getString("name"));
	
		return cervecerias;	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public Beer getBeerById(int id){
	

		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);

		
		
		ResponseEntity<String> json = restTemplate.exchange("https://api.punkapi.com/v2/beers/"+id,HttpMethod.GET,entity,String.class);			
		Document doc = Document.parse(json.getBody().substring(1,json.getBody().length()-1));
			
		Beer beerTmp = new Beer(doc.getInteger("id"),doc.getString("name"));
			
		 json = restTemplate.exchange(		
						"https://translate.yandex.net/api/v1.5/tr.json/translate?"
						+ "key=trnsl.1.1.20200308T165332Z.73d1a65681d2b63f.caf8d6ce35cc9cd58a6f1ab0a844a69b07dee729&"
						+ "text='"+doc.getString("description")+"'"
						+ "&lang=en-es"
						+ "&[format=plain]",HttpMethod.GET,entity,String.class);	
				
		doc = Document.parse(json.getBody());
		beerTmp.setDescription(doc.get("text").toString().replace("[", "").replace("]",""));						
			
		return beerTmp;
	}


}
