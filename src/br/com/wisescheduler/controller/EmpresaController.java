package br.com.wisescheduler.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.wisescheduler.dao.EmpresaDao;
import br.com.wisescheduler.model.Empresa;
import br.com.wisescheduler.model.Usuario;

@Controller
@Transactional
public class EmpresaController {
	
	@Autowired
	  EmpresaDao dao;
	

	
	@RequestMapping("adicionaEmpresa")
	public String adiciona(HttpSession session,Empresa empresa, RedirectAttributes redirectAttributes){
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");	
		dao.adiciona(empresa, usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Empresa "+empresa.getId()+" cadastrado com sucesso");
		return "redirect:listaEmpresa";
	}
	
	@RequestMapping("novaEmpresa")
	public String novo(){
		return "empresa/adiciona";
		
	}
	@RequestMapping("alteraEmpresa")
	public String altera(HttpSession session, Empresa empresa , RedirectAttributes redirectAttributes){
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");	
		dao.altera(empresa,usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Empresa "+empresa.getId()+" alterado com sucesso");
		return "redirect:listaEmpresa";
	}
	
	@RequestMapping("removeEmpresa")
	public String remove(HttpSession session,Empresa empresa, RedirectAttributes redirectAttributes){
		try{
			Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");	
			dao.remove(empresa, usuario);
			redirectAttributes.addFlashAttribute("sucesso", "Empresa "+empresa.getNome()+" removido com sucesso");
		} catch (Exception e){
			redirectAttributes.addFlashAttribute("erro", "A empresa "+empresa.getNome()+" já está em uso em uma turma e não pode ser excluída.");
		}	
		return "redirect:listaEmpresa";
	}
	
	@RequestMapping("mostraEmpresa")
	public String mostra(Long id, Model model){
		model.addAttribute("empresa", dao.buscaPorId(id));
		return "empresa/editar";
	}
	

	@RequestMapping("listaEmpresa")
	public String lista(Model model){
		model.addAttribute("empresas", dao.listar());
		return "empresa/lista";
	}
	


}
