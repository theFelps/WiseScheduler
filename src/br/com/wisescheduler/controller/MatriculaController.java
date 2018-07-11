package br.com.wisescheduler.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.wisescheduler.dao.MatriculaDao;
import br.com.wisescheduler.model.Aluno;
import br.com.wisescheduler.model.Empresa;
import br.com.wisescheduler.model.Matricula;
import br.com.wisescheduler.model.Turma;
import br.com.wisescheduler.model.Usuario;



@Controller
@Transactional
public class MatriculaController {
	
	@Autowired
	  MatriculaDao matriculaDao;

	
	@RequestMapping("adicionaMatricula")
	public String adicionaMatricula(HttpSession session ,Matricula matricula, Long alunoId, Long empresaId, Long turmaId, RedirectAttributes redirectAttributes){
		
		if (alunoId ==null || empresaId == null ){
			redirectAttributes.addFlashAttribute("erroCampoVazio", true);
			return "redirect:/mostraTurma?id="+ turmaId;	
		}

		Aluno aluno = new Aluno();
		Empresa empresa = new Empresa();
		Turma turma = new Turma();
		
		aluno.setId(alunoId);
		empresa.setId(empresaId);
		turma.setId(turmaId);
		
		matricula.setAluno(aluno);
		matricula.setEmpresa(empresa);
		matricula.setTurma(turma);
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");	
		
		matriculaDao.adiciona(matricula, usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Matricula "+matricula.getId()+" cadastrado com sucesso");
		return "redirect:/mostraTurma?id="+ turmaId;
	}


	@RequestMapping("removeMatriculaTurma/{idTurma}/{idMatricula}")
	public String removeCursoInstrutor(HttpSession session, @PathVariable("idTurma") Long idTurma, @PathVariable("idMatricula") Long idMatricula, RedirectAttributes redirectAttributes){
		Matricula matricula = new Matricula();
		Turma turma = new Turma();
		
		turma.setId(idTurma);
		matricula.setId(idMatricula);
		matricula.setTurma(turma);
		
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");	
		matriculaDao.remove(matricula, usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Matricula "+matricula.getId()+" removido com sucesso");
		return "redirect:/mostraTurma?id={idTurma}";
	}
	@RequestMapping("removeMatriculaAluno/{idAluno}/{idMatricula}")
	public String removeCursoAluno(HttpSession session,@PathVariable("idAluno") Long idAluno, @PathVariable("idMatricula") Long idMatricula, RedirectAttributes redirectAttributes){
		Matricula matricula = new Matricula();
		matricula.setId(idMatricula);
		redirectAttributes.addFlashAttribute("sucesso", "Matricula "+matricula.getId()+" removido com sucesso para aluno "+idAluno);
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");	
		matriculaDao.remove(matricula, usuario);
		return "redirect:/mostraAluno?id={idAluno}";
	}
	
	 @RequestMapping("alteraPagoSIM/{idTurma}/{idMatricula}")
	 public String alteraPagoSIM(HttpSession session, @PathVariable("idTurma") Long idTurma, @PathVariable("idMatricula") Long idMatricula, RedirectAttributes redirectAttributes){
		 Matricula matricula = new Matricula();
		 matricula.setId(idMatricula);
		 matricula.setPago(true);
		 Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");	
		 matriculaDao.alteraPago(matricula, usuario);
		 return "redirect:/mostraTurma?id={idTurma}";
	  
	 }
	 @RequestMapping("alteraPagoNAO/{idTurma}/{idMatricula}")
	 public String alteraPagoNAO(HttpSession session, @PathVariable("idTurma") Long idTurma, @PathVariable("idMatricula") Long idMatricula, RedirectAttributes redirectAttributes){
		 Matricula matricula = new Matricula();
		 matricula.setId(idMatricula);
		 matricula.setPago(false);
	     Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");	
		 matriculaDao.alteraPago(matricula, usuario);
		
		 return "redirect:/mostraTurma?id={idTurma}";

	  
	 }
	
	
	
}
