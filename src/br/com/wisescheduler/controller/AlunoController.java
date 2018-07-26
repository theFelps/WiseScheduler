package br.com.wisescheduler.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.wisescheduler.dao.AlunoDao;
import br.com.wisescheduler.dao.MatriculaDao;
import br.com.wisescheduler.model.Aluno;
import br.com.wisescheduler.model.Matricula;
import br.com.wisescheduler.model.Usuario;


@Transactional
@Controller
public class AlunoController {

	@Autowired
	 AlunoDao alunoDao;
	@Autowired
	 MatriculaDao matriculaDao;

	@RequestMapping("adicionaAluno")
	public String adiciona(HttpSession session, @Valid Aluno aluno, BindingResult result, RedirectAttributes redirectAttributes) {
		if (result.hasFieldErrors("nome")) {
			return "aluno/adiciona";
		}
		try {
			Date dataDeHoje = new Date();
			Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
			aluno.setDataDeCadastro(dataDeHoje);
			alunoDao.adiciona(aluno, usuario);
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("erro", "Ocorreu um erro: " + e);
			
		}
		redirectAttributes.addFlashAttribute("sucesso", "Aluno '" + aluno.getNome() + "' cadastrado.");
		return "redirect:listaAluno";
	}

	@RequestMapping("novoAluno")
	public String novo() {
		return "aluno/adiciona";

	}

	
	@RequestMapping("removeAluno")
	public String remove (HttpSession session,Aluno aluno, BindingResult result, RedirectAttributes redirectAttributes)  {
		try {
			Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
			alunoDao.remove(aluno, usuario);
			redirectAttributes.addFlashAttribute("sucesso", "Aluno " + aluno.getNome() + " removido");


		}
		catch (Exception e) {
			redirectAttributes.addFlashAttribute("erro", "O aluno já está em uso e não pode ser excluído");
		}

		return "redirect:listaAluno";
	}

	@RequestMapping("mostraAluno")
	public String mostra(Long id, Model model, RedirectAttributes redirectAttributes) {
		try {
			model.addAttribute("aluno", alunoDao.buscaPorId(id));
			model.addAttribute("matriculasDoAluno", matriculaDao.buscaPorAluno(id));
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("erro", "Ocorreu um erro: " + e);
		}
		return "aluno/editar";
	}

	@RequestMapping(method = RequestMethod.GET, value = "JSON", headers = "Accept=application/json")
	@ResponseBody
	public List<Aluno> getAlunoInJSON(Long id) {
		return alunoDao.listarAlunos();

	}

	@RequestMapping("listaAluno")
	public String lista(Model model) {
		List<Matricula> matriculas = new ArrayList<>();
		matriculas = matriculaDao.buscaTodasMatricula();
		List<Long>idsDeMatricula = new ArrayList<>();
		
		for(Matricula ids : matriculas){
			idsDeMatricula.add(ids.getAluno().getId());
		}
		
		model.addAttribute("alunos", alunoDao.listarAlunos());
		
		model.addAttribute("matriculaAlunoId", idsDeMatricula);
		
		return "aluno/lista";
	}

	@RequestMapping("alteraAluno")
	public String altera(HttpSession session, Aluno aluno, RedirectAttributes redirectAttributes) {
		try {
			Date dataDeHoje = new Date();
			Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
			aluno.setDataDeAlteracao(dataDeHoje);
			alunoDao.altera(aluno,usuario);
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("erro", "Ocorreu um erro: " + e);
		}
		redirectAttributes.addFlashAttribute("sucesso", "Aluno " + aluno.getNome() + " alterado");
		return "redirect:listaAluno";
	}


}