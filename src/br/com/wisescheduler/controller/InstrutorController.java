package br.com.wisescheduler.controller;



import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import br.com.wisescheduler.dao.InstrutorDao;
import br.com.wisescheduler.dao.LogDao;
import br.com.wisescheduler.model.Instrutor;
import br.com.wisescheduler.model.Log;
import br.com.wisescheduler.model.Usuario;

@Controller
@Transactional
public class InstrutorController {
	
	@Autowired
	   InstrutorDao instrutorDao;

	@RequestMapping("adicionaInstrutor")
	public String adiciona(HttpSession session ,Instrutor instrutor, RedirectAttributes redirectAttributes){
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		instrutorDao.adiciona(instrutor, usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Instrutor "+instrutor.getId()+" cadastrado com sucesso");
		return "redirect:listaInstrutor";
	}
	
	@RequestMapping("novoInstrutor")
	public String novoInstrutor(){
		return "instrutor/adiciona";
		
	}
	@RequestMapping("alteraInstrutor")
	public String altera(HttpSession session, Instrutor instrutor, RedirectAttributes redirectAttributes){
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		instrutorDao.altera(instrutor, usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Instrutor "+instrutor.getId()+" alterado com sucesso");
		return "redirect:listaInstrutor";
	}
	
	@RequestMapping("removeInstrutor")
	public String remove(HttpSession session,Instrutor instrutor, RedirectAttributes redirectAttributes){
		try {
			Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
			instrutorDao.remove(instrutor, usuario);
			redirectAttributes.addFlashAttribute("sucesso", "Instrutor "+instrutor.getId()+" removido com sucesso");
		} catch (Exception e){
			redirectAttributes.addFlashAttribute("erro", "O instrutor "+instrutor.getId()+" já está em uso em uma turma e não pode ser excluído.");
		}	
		return "redirect:listaInstrutor";
	}
	
	@RequestMapping("mostraInstrutor")
	public String mostra(Long id, Model model){
		  model.addAttribute("instrutor", instrutorDao.buscaPorId(id));
		  model.addAttribute("cursos", instrutorDao.listarCursosInstrutor(id));
		  model.addAttribute("todoscursos", instrutorDao.listarTodosCursos(id));
		
		return "instrutor/editar";
	}
	
	@RequestMapping("removeCursoInstrutor/{idCurso}/{idInstrutor}")
	public String removeCursoInstrutor(HttpSession session,@PathVariable("idCurso") Long idCurso, @PathVariable("idInstrutor") Long idInstrutor, RedirectAttributes redirectAttributes){
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		instrutorDao.removeCursoInstrutor(idCurso, idInstrutor, usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Curso "+idCurso+" removido com sucesso para instrutor " +idInstrutor);
		return "redirect:/mostraInstrutor?id={idInstrutor}";
	}
	
	@RequestMapping("adicionaCursoInstrutor/{idInstrutor}")
	public String adicionaCursoInstrutor(HttpSession session, @PathVariable("idInstrutor") Long idInstrutor , Long cursoId, RedirectAttributes redirectAttributes){
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		instrutorDao.adicionaCursoInstrutor(idInstrutor, cursoId, usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Curso "+cursoId+" adicionado com sucesso para instrutor " +idInstrutor);
		return "redirect:/mostraInstrutor?id={idInstrutor}";
	}
	
	@RequestMapping("listaInstrutor")
	public String listaInstrutor(Model model){
		model.addAttribute("instrutores", instrutorDao.listar());
		return "instrutor/lista";
	}
	

}
