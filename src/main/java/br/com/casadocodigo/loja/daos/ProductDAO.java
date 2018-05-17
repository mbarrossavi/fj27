package br.com.casadocodigo.loja.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.casadocodigo.loja.models.Product;

@Repository
public class ProductDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	
	public List<Product> list(){
		
		return manager.createQuery("Select p from Product p Join fetch p.prices").getResultList();
		
	}
	 
	public void save(Product product){
		
		manager.persist(product);
		
	}
	

}
