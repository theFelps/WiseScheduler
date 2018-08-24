package br.com.wisescheduler.controller;



import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.wisescheduler.dao.LogDao;
import br.com.wisescheduler.dao.UsuarioDao;
import br.com.wisescheduler.model.Sala;
import br.com.wisescheduler.model.Usuario;
import br.com.wisescheduler.dao.ConfigFilialDao;
import br.com.wisescheduler.model.ConfigFilial;

@Controller
@Transactional
public class ConfigController {
	
	@Autowired 
	UsuarioDao usuarioDao;
	
	@Autowired 
	LogDao logDao;
	
	@Autowired 
	ConfigFilialDao configFilialDao;
	

	@RequestMapping("novoUsuario")
	public String novoUsuario(Model model, @ModelAttribute("erro")String erro){
		if(erro != null){
			model.addAttribute("erro", erro);
		}
		
		return "config/adicionaUsuario";
	}
	
	@RequestMapping("adicionaUsuario")
	public String adiciona(@Valid Usuario usuario, BindingResult result, RedirectAttributes redirectAttributes){
		
		if(result.hasFieldErrors("nomeUsuario")){
			return "usuario/adiciona";
		}
				
		try {
			usuarioDao.adiciona(usuario);
			redirectAttributes.addFlashAttribute("sucesso", "Usuario " +usuario.getNome()+" adicionado com sucesso");


		}
		catch (Exception e) {
			redirectAttributes.addFlashAttribute("erro", "O usuário com o login "+usuario.getLogin()+" já está em uso");
			return "redirect:novoUsuario";
		}

		return "redirect:listaConfiguracoes";
		
	}
	
	@RequestMapping("listaConfiguracoes")
	public String listaConfiguracoes(Model model){
		LocalDateTime now = LocalDateTime.now();
		Instant instant = now.atZone(ZoneId.systemDefault()).toInstant();
		Date dataInicio = Date.from(instant);
		Date dataFim = Date.from(instant);
		
		Calendar calIn = Calendar.getInstance();
		calIn.setTime(dataInicio);
		calIn.set(Calendar.HOUR_OF_DAY, 0);
		calIn.set(Calendar.MINUTE, 0);
		dataInicio = calIn.getTime();
		
		Calendar calFim = Calendar.getInstance();
		calFim.setTime(dataFim);
		calFim.set(Calendar.HOUR_OF_DAY, 23);
		calFim.set(Calendar.MINUTE, 59);
		dataFim = calFim.getTime();
		
		model.addAttribute("logs", logDao.listar(dataInicio , dataFim));
		model.addAttribute("usuariosCadastrados", usuarioDao.listar());
		model.addAttribute("configFilial", configFilialDao.listar());
		return "config/lista";
	}
	@RequestMapping("filtraLog")
	public String filtraLog(Model model, Date dataInicio, Date dataFim){
		
		
		System.out.println(dataInicio + "Data Inicial");
		System.out.println(dataFim + "Data Inicial");
		model.addAttribute("logs", logDao.listar(dataInicio , dataFim));
		model.addAttribute("usuariosCadastrados", usuarioDao.listar());
		return "config/lista";
		
	}
	
	@RequestMapping("removeUsuario")
	public String removeUsuario(Usuario usuario, RedirectAttributes redirectAttributes){
		
		try {
			usuarioDao.remove(usuario);
			redirectAttributes.addFlashAttribute("sucesso", "Usuario "+usuario.getNome()+" excluído.");
		
		} catch (Exception e){
			redirectAttributes.addFlashAttribute("erro", "Erro ao remover usuário");
			
		}
		return "redirect:listaConfiguracoes";
	}
	 @RequestMapping("alteraTipoAdmin/{idUsuario}")
	 public String alteraTipoAdmin(@PathVariable("idUsuario") long idUsuario, RedirectAttributes redirectAttributes){
		 Usuario usuario= new Usuario();
		 usuario.setId(idUsuario);
		 usuario.setTipoUsuario(0);
	  
		 usuarioDao.alteraTipoUsuario(usuario);
		 return "redirect:/listaConfiguracoes";
	  
	 }
	 @RequestMapping("alteraTipoNaoAdmin/{idUsuario}")
	 public String alteraTipoNaoAdmin(@PathVariable("idUsuario") long idUsuario, RedirectAttributes redirectAttributes){
		 Usuario usuario= new Usuario();
		 usuario.setId(idUsuario);
		 usuario.setTipoUsuario(1);
	  
		 usuarioDao.alteraTipoUsuario(usuario);
		 return "redirect:/listaConfiguracoes";
	  
	 }
	 @RequestMapping("alteraFilial")
		public String altera(HttpSession session,ConfigFilial filial, RedirectAttributes redirectAttributes){
			redirectAttributes.addFlashAttribute("sucesso", "Dados da empresa atualizados");
			Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
			configFilialDao.altera(filial, usuario);
			return "redirect:listaConfiguracoes";
		}
	
}
