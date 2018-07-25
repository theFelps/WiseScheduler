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
public class InteressadoController {

	@Autowired
	 AlunoDao alunoDao;
	@Autowired
	 MatriculaDao matriculaDao;

	@RequestMapping("adicionaInteressado")
	public String adiciona(HttpSession session ,@Valid Aluno aluno, BindingResult result, RedirectAttributes redirectAttributes) {

		if (result.hasFieldErrors("nome")) {
			return "interessado/adiciona";
		}
		try {
			Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
			Date dataDeHoje = new Date();
			aluno.setDataDeCadastro(dataDeHoje);
			alunoDao.adiciona(aluno , usuario);
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("erro", "Ocorreu um erro: " + e);
			
		}
		redirectAttributes.addFlashAttribute("sucesso", "Interessado "+ aluno.getNome() +" cadastrado!");
		return "redirect:listaInteressado";
	}

	@RequestMapping("novoInteressado")
	public String novo() {
		return "interessado/adiciona";

	}

	
	@RequestMapping("removeInteressado")
	public String remove (HttpSession session ,Aluno aluno, BindingResult result, RedirectAttributes redirectAttributes)  {
		try {
			Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
			alunoDao.remove(aluno, usuario);
			redirectAttributes.addFlashAttribute("sucesso", "Interessado" + aluno.getId() + " removido com sucesso");


		}
		catch (Exception e) {
			redirectAttributes.addFlashAttribute("erro", "O interessado já está em uso e não pode ser excluído");
		}

		return "redirect:listaInteressado";
	}

	@RequestMapping("mostraInteressado")
	public String mostra(Long id, Model model, RedirectAttributes redirectAttributes) {
		try {
			model.addAttribute("aluno", alunoDao.buscaPorId(id));

		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("erro", "Ocorreu um erro: " + e);
		}
		return "interessado/editar";
	}


	@RequestMapping("listaInteressado")
	public String lista(Model model) {
		model.addAttribute("alunos", alunoDao.listarInteressados());
		
		return "interessado/lista";
	}

	@RequestMapping("alteraInteressado")
	public String altera(HttpSession session,Aluno aluno, RedirectAttributes redirectAttributes) {
		try {
			Date dataDeHoje = new Date();
			Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
			aluno.setDataDeAlteracao(dataDeHoje);
			alunoDao.altera(aluno, usuario);
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("erro", "Ocorreu um erro: " + e);
		}
		redirectAttributes.addFlashAttribute("sucesso", "Interessado " + aluno.getNome() + " alterado com sucesso");
		return "redirect:listaInteressado";
	}


}