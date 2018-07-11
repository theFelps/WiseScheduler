package br.com.wisescheduler.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;


import br.com.wisescheduler.dao.UsuarioDao;
import br.com.wisescheduler.model.Usuario;

@Controller
@Transactional
public class LoginController {

	private final UsuarioDao dao;
	

	


	@Autowired
	public LoginController(UsuarioDao dao) {
		this.dao = dao;
	}

	@RequestMapping("loginForm")
	public String loginForm() {
		return "formulario-login";
	}

	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Usuario usuario, HttpSession session) {

		
		if (dao.existeUsuario(usuario)) {
				
				Usuario userFull = dao.buscaPorLogin(usuario.getLogin());
				session.setAttribute("usuarioLogado", userFull);
				
				return "redirect:listaCalendario";
			
		}
		return "redirect:loginForm";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:loginForm";
	}
}
