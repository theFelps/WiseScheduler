package br.com.wisescheduler.controller;



import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.wisescheduler.dao.SalaDao;
import br.com.wisescheduler.model.Sala;
import br.com.wisescheduler.model.Usuario;

@Controller
@Transactional
public class SalaController {
	
	@Autowired 
	SalaDao dao;
	

	
	@RequestMapping("adicionaSala")
	public String adiciona(HttpSession session,@Valid Sala sala, BindingResult result, RedirectAttributes redirectAttributes){
		
		if(result.hasFieldErrors("nome_sala")){
			return "sala/adiciona";
		}
		
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		dao.adiciona(sala, usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Sala "+sala.getId()+" adicionado com sucesso");
		return "redirect:listaSala";
	}
	
	@RequestMapping("novaSala")
	public String novaSala(){
		return "sala/adiciona";
		
	}
	@RequestMapping("alteraSala")
	public String altera(HttpSession session,Sala sala, RedirectAttributes redirectAttributes){
		redirectAttributes.addFlashAttribute("sucesso", "Sala "+sala.getId()+" alterado com sucesso");
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		dao.altera(sala, usuario);
		return "redirect:listaSala";
	}
	
	@RequestMapping("removeSala")
	public String removeSala(HttpSession session, Sala sala, RedirectAttributes redirectAttributes){
		
		try {
			Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
			dao.remove(sala, usuario);
			redirectAttributes.addFlashAttribute("sucesso", "Sala "+sala.getId()+" excluída.");
		
		} catch (Exception e){
			redirectAttributes.addFlashAttribute("erro", "A sala já está em uso em uma turma e não pode ser excluída.");
			
		}
		return "redirect:listaSala";
	}
	
	@RequestMapping("mostraSala")
	public String mostraSala(Long id, Model model){
		model.addAttribute("sala", dao.buscaPorId(id));
		return "sala/editar";
	}
	

	@RequestMapping("listaSala")
	public String listaSala(Model model){
		model.addAttribute("salas", dao.listar());
		return "sala/lista";
	}
	


}
