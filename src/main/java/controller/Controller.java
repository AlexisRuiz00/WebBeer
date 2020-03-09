package controller;

import java.util.ArrayList;
import java.util.List;

import model.Beer;
import model.DAO.BeerDAO;

public class Controller {
	
	static Controller controller;
	private BeerDAO beerDAO;
	
	private Controller() {
	}
	
	public static Controller getController() {
		if (controller == null) {
			controller = new Controller();
			controller.beerDAO = new BeerDAO();
			
		}
		return controller;
	}
	
	
	public String getOneBeer() {
		return controller.beerDAO.getOneBeer();
	}
	
	public ArrayList<Beer> getBeerList(){
		return controller.beerDAO.getBeerList();
	}
	
	
	public ArrayList<String> getCervecerias(String lat, String lon){
		try {
			return controller.beerDAO.getCervecerias(
					Double.valueOf(lat), 
					Double.valueOf(lon));
		}catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<>();
		}
		
	}
	
	
	
	public Beer getBeerById(String id){
		int idx;
		try {
			idx = Integer.valueOf(id);
			return controller.beerDAO.getBeerById(idx);
		}catch(Exception e) {
			return new Beer(0,"Selecciona una cerveza","");
		}
		
	}
	
	public String getOneBeerFromApi() {
		return controller.beerDAO.getOneBeerFromApi();
	}
	
	
	public static void main(String[] args) {
		getController();
		
		
		
	}
	

}
