package br.com.wisescheduler.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.wisescheduler.dao.AlunoDao;
import br.com.wisescheduler.dao.SalaDao;
import br.com.wisescheduler.dao.TurmaDao;



@Transactional
@Controller
public class CalendarioController {
	
	@Autowired
	  TurmaDao turmaDao;
	@Autowired
	  AlunoDao alunoDao;
	@Autowired
	  SalaDao salaDao;
	
	
	@RequestMapping("listaCalendario")
	public String listaCalendario(Model model){
		
		model.addAttribute("agendamentos",turmaDao.listaTodosAgendamento());
		model.addAttribute("salas", salaDao.listar());

		return "calendario/lista";
	}
	
}