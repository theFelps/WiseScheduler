package br.com.wisescheduler.jpa;


import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;



public class GeraTabelas {
	public static void main(String[] args) {
			
        


		EntityManagerFactory factory = Persistence.
				createEntityManagerFactory("wisePU");
		
		
		factory.close();
				
	}
}
