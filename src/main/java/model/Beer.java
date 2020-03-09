package model;

public class Beer {

	int id;
	String name;
	String description;
	
	
	public Beer(int id,String name) {
		this.id = id;
		this.name = name;
	}
	
	public Beer(int id,String name, String description) {
		this.id = id;
		this.name = name;
		this.description = description;
	}
	
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}
	
	public int getId() {
		return id;
	}
	
	
}
