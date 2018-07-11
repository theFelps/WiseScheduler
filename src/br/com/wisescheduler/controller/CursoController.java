package br.com.wisescheduler.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.wisescheduler.dao.CursoDao;
import br.com.wisescheduler.model.Curso;
import br.com.wisescheduler.model.Usuario;

@Controller
@Transactional
public class CursoController {
	
	@Autowired
	 CursoDao dao;
	

	
	@RequestMapping("adicionaCurso")
	public String adiciona(HttpSession session, Curso curso, RedirectAttributes redirectAttributes){
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");		
		dao.adiciona(curso, usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Curso "+curso.getId()+" cadastrado com sucesso");
		return "redirect:listaCurso";
	}
	
	@RequestMapping("novoCurso")
	public String novoCurso(){
		return "curso/adiciona";
		
	}
	@RequestMapping("alteraCurso")
	public String altera(HttpSession session,Curso curso, RedirectAttributes redirectAttributes){
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");	
		dao.altera(curso, usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Curso "+curso.getId()+" alterado com sucesso");
		return "redirect:listaCurso";
	}
	
	@RequestMapping("removeCurso")
	public String remove(HttpSession session,Curso curso, RedirectAttributes redirectAttributes){
		
		try {
			Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");	
			dao.remove(curso, usuario);
			redirectAttributes.addFlashAttribute("sucesso", "Curso "+curso.getId()+" excluído.");
			
		} catch (Exception e){
			redirectAttributes.addFlashAttribute("erro", "O curso "+curso.getId()+" já está em uso em uma turma e não pode ser excluído.");
		}
		return "redirect:listaCurso";
	}
	
	@RequestMapping("mostraCurso")
	public String mostra(Long id, Model model){
		model.addAttribute("curso", dao.buscaPorId(id));
		return "curso/editar";
	}
	

	@RequestMapping("listaCurso")
	public String listaSala(Model model){
		model.addAttribute("cursos", dao.listar());
		return "curso/lista";
	}
	


}
