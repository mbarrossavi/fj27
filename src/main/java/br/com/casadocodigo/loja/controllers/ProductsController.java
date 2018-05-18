package br.com.casadocodigo.loja.controllers;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.daos.ProductDAO;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;
import br.com.casadocodigo.loja.validations.ProductValidator;

@Controller
@RequestMapping("/products")
public class ProductsController {
	
	@Autowired
	private ProductDAO dao;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView list(){
		
		ModelAndView view = new ModelAndView("products/list");
		view.addObject("products", dao.list());
		
		return view;		
		
	}
	
	
	@InitBinder
	public void initiBinder(WebDataBinder binder){
		binder.addValidators(new ProductValidator());
		
	}
	
	@RequestMapping("form")
	public ModelAndView form(Product product){
		
		ModelAndView modelAndView = new ModelAndView("products/form");
		modelAndView.addObject("types", BookType.values());	
		
		return modelAndView;		
		
	}
	
	
	@Transactional
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView save(@Valid Product product,BindingResult bindingResult,RedirectAttributes attrs){
		
		if (bindingResult.hasErrors()){
			return form(product);
		}
		
		
		
		attrs.addFlashAttribute("succcess", "Item criado com sucesso");
		
		System.out.println("Cadastrando o produto: " + product);
		dao.save(product);
		
		
		
		return new ModelAndView("redirect:products");
		
	}

}
