package br.com.com.casadocodigo.loja.builders;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.cfg.CreateKeySecondPass;

import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;

public class ProductsBuilder {
	
	private List<Product> products = new ArrayList<Product>();
	
	private ProductsBuilder(Product product){
		
		products.add(product);
		
	}
	
	public static ProductsBuilder newProduct(BookType bookType,BigDecimal value){
		
		Product book = create("Book 1",bookType,value);
		
		
		return new ProductBuilder(book);
		
		
	}

}
