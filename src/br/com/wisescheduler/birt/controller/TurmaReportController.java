package br.com.wisescheduler.birt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import br.com.wisescheduler.dao.AlunoDao;
import br.com.wisescheduler.dao.CursoDao;
import br.com.wisescheduler.dao.EmpresaDao;
import br.com.wisescheduler.dao.InstrutorDao;
import br.com.wisescheduler.dao.MatriculaDao;
import br.com.wisescheduler.dao.SalaDao;
import br.com.wisescheduler.dao.TurmaDao;
import br.com.wisescheduler.model.Turma;

@Controller
@Transactional
public class TurmaReportController {
	
	@Autowired
	TurmaDao turmaDao;
	@Autowired
	CursoDao cursoDao;
	@Autowired
	InstrutorDao instrutorDao;
	@Autowired
	SalaDao salaDao;
	@Autowired
	MatriculaDao matriculaDao;
	@Autowired
	EmpresaDao empresaDao;
	@Autowired
	AlunoDao alunoDao;
	
	
	@RequestMapping("relatorioTurma")
	public String adicionaTurma(HttpSession session, Turma turma, Long cursoId, Long instrutorId, Long salaId,
			RedirectAttributes redirectAttributes) {
		
			
				return null;
	}
	

}
