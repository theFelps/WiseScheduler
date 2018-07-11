package br.com.wisescheduler.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import br.com.wisescheduler.dao.AlunoDao;
import br.com.wisescheduler.dao.CursoDao;
import br.com.wisescheduler.dao.EmpresaDao;
import br.com.wisescheduler.dao.InstrutorDao;
import br.com.wisescheduler.dao.MatriculaDao;
import br.com.wisescheduler.dao.SalaDao;
import br.com.wisescheduler.dao.TurmaDao;
import br.com.wisescheduler.metamodel.TurmaRelatorio;
import br.com.wisescheduler.model.Agendamento;
import br.com.wisescheduler.model.Curso;
import br.com.wisescheduler.model.Instrutor;
import br.com.wisescheduler.model.Sala;
import br.com.wisescheduler.model.Turma;
import br.com.wisescheduler.model.Usuario;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.ReportContext;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Controller
@Transactional
public class TurmaController {
	private static final Logger logger = LoggerFactory.getLogger(TurmaRelatorio.class);

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

	@RequestMapping("adicionaTurma")
	public String adicionaTurma(HttpSession session, Turma turma, Long cursoId, Long instrutorId, Long salaId,
			RedirectAttributes redirectAttributes) {
		
		
		if (cursoId ==null || instrutorId ==null ){
			redirectAttributes.addFlashAttribute("erro", "Os campos Curso e Instrutor são obrigatórios");
			return "redirect:novaTurma";
		}

		Curso curso = new Curso();
		Instrutor instrutor = new Instrutor();
		Sala sala = new Sala();

		curso.setId(cursoId);
		instrutor.setId(instrutorId);
		sala.setId(salaId);

		turma.setCurso(curso);
		turma.setInstrutor(instrutor);
		
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

		turmaDao.adiciona(turma, usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Turma " + turma.getId() + " adicionado com sucesso");
		return "redirect:mostraTurma?id=" + turma.getId() +"#tabs-2";
	}

	@RequestMapping("novaTurma")
	public String novaTurma(Model model) {
		model.addAttribute("cursosListar", cursoDao.listar());
		model.addAttribute("instrutoresListar", instrutorDao.listar());
		model.addAttribute("salasListar", salaDao.listar());
		return "turma/adiciona";
	}

	
	@RequestMapping("removeTurma")
	public String remove(HttpSession session,Turma turma, RedirectAttributes redirectAttributes) {
		try{
	    Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		turmaDao.remove(turma,usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Turma " + turma.getId() + " removido com sucesso");
		}
		catch (Exception e) {
			redirectAttributes.addFlashAttribute("erro", "A turma já está em uso e não pode ser excluída");
		}
				
		return "redirect:listaTurma";
	}

	@RequestMapping("listaTurma")
	public String lista(Model model) {
		model.addAttribute("turmas", turmaDao.lista());
		return "turma/lista";
	}

	@RequestMapping("listaCursos")
	public String listaCursos(Model model) {
		model.addAttribute("cursos", cursoDao.listar());
		return "turma/lista";
	}

	@RequestMapping("mostraTurma")
	public String mostraTurma(Long id, Model model) {
		model.addAttribute("turma", turmaDao.buscaPorId(id));
		model.addAttribute("todosCursos", cursoDao.listar());
		model.addAttribute("todosInstrutores", instrutorDao.listar());
		model.addAttribute("todasSalas", salaDao.listar());
		model.addAttribute("matriculas", matriculaDao.listaPorTurma(id));
		model.addAttribute("agendamentos", turmaDao.listaAgendamentoPorTurma(id));

		return "turma/editar";
	}

	@RequestMapping("alteraTurma")
	public String altera(HttpSession session,Turma turma, Long cursoId, Long instrutorId, Long salaId,
			RedirectAttributes redirectAttributes) {
		Curso curso = new Curso();
		Instrutor instrutor = new Instrutor();
		Sala sala = new Sala();

		curso.setId(cursoId);
		instrutor.setId(instrutorId);
		sala.setId(salaId);

		turma.setCurso(curso);
		turma.setInstrutor(instrutor);
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

		turmaDao.altera(turma, usuario);
		redirectAttributes.addFlashAttribute("sucesso", "Turma " + turma.getId() + " alterado com sucesso");
		return "redirect:listaTurma";
	}

	@RequestMapping("adicionaEmTurma")
	public String adicionaEmTurma(Long id, Model model) {
		model.addAttribute("turma", turmaDao.buscaPorId(id));
		model.addAttribute("todasEmpresas", empresaDao.listar());
		model.addAttribute("todosAlunos", alunoDao.listarAlunosForaDessaTurma(id));
		return "/matricula/adicionaEmTurma";
	}

	@RequestMapping("novoAgendamento")
	public String novoAgendamento(Long id, Model model,
			@ModelAttribute("agendamentosConflitantes") ArrayList<Agendamento> agendamentosConflitantes,
			@ModelAttribute("messages") ArrayList<String> messages ) 
			
	{
		if(messages != null){
			model.addAttribute("messages", messages);
		}
		
		model.addAttribute("turma", turmaDao.buscaPorId(id));
		model.addAttribute("todasSalas", salaDao.listar());
		if (agendamentosConflitantes != null) {
				model.addAttribute("agendamentoConflitante", agendamentosConflitantes);
		}

		return "/turma/agendamento";
	}

	@RequestMapping("adicionaAgendamento")
	public String adicionaAgendamento(HttpSession session,Model model, Agendamento agendamento, Long turmaId, Long salaId,
			RedirectAttributes redirectAttributes) {

		ArrayList<String> messages = new ArrayList<String>();
		messages.addAll(validaData(agendamento.getDataInicio(), agendamento.getDataFim(), agendamento.getHoraFim(), agendamento.getHoraInicio()));

		
		if (messages.isEmpty()){
			Turma turma = new Turma();
			Sala sala = new Sala();
			sala.setId(salaId);
			turma.setId(turmaId);
			agendamento.setTurma(turma);
			agendamento.setSala(sala);

			if (turmaDao.validaAgendamento(agendamento) == null) {
				Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

				turmaDao.adicionaAgendamento(agendamento, usuario);
				return "redirect:mostraTurma?id=" + turmaId;
			}
			else{
			
			redirectAttributes.addFlashAttribute("agendamentosConflitantes", turmaDao.validaAgendamento(agendamento));
			return "redirect:novoAgendamento?id=" + turmaId;
			}
			
		}
		else {
			redirectAttributes.addFlashAttribute("messages", messages);
			return "redirect:novoAgendamento?id=" + turmaId;
		}
		

	}

	@RequestMapping("removeAgendamento/{idTurma}/{idAgendamento}")
	public String removeAgendamento(HttpSession session,@PathVariable("idTurma") Long idTurma,
			@PathVariable("idAgendamento") Long idAgendamento) {
			Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
			turmaDao.removeAgendamento(idAgendamento, usuario);

		return "redirect:/mostraTurma?id=" + idTurma;

	}

	@RequestMapping(method = RequestMethod.GET, value = "pdf")
	public ModelAndView geraPdf(Long id, ModelAndView modelAndView) {
		logger.debug("--------------generate PDF report----------");

		Map<String, Object> parameterMap = new HashMap<String, Object>();
		List<TurmaRelatorio> turmaRelatorio = turmaDao.geraRelatorioTurma(id);
		JRDataSource JRdataSource = new JRBeanCollectionDataSource(turmaRelatorio);
		parameterMap.put("datasource", JRdataSource);
		modelAndView = new ModelAndView("pdfReport", parameterMap);

		return modelAndView;

	}

//	@RequestMapping(method = RequestMethod.GET, value = "html")
//	public ModelAndView geraHtml(Long id, ModelAndView modelAndView) {
//
//		logger.debug("--------------generate PDF report----------");
//
//		Map<String, Object> parameterMap = new HashMap<String, Object>();
//		List<Turma> turma = turmaDao.lista(id);
//		JRDataSource JRdataSource = new JRBeanCollectionDataSource(turma);
//		parameterMap.put("datasource", JRdataSource);
//		modelAndView = new ModelAndView("htmlReport", parameterMap);
//
//		return modelAndView;
//
//	}
	
	private List<String> validaData(Date dataInicio, Date dataFim, Date horaFim, Date horaInicio) {
		List<String> messages = new ArrayList<String>();		
		
		if(dataFim == null || dataInicio ==null) {
			messages.add("Data de início e fim são obrigatórias.");
		}
		if(dataFim.compareTo(dataInicio)<=-1) {
			messages.add("Data Fim precisa ser maior ou igual que Data Início.");
		}
		if(horaFim == null || horaInicio ==null) {
			messages.add("Hora de início e fim são obrigatórias.");
		}
		if(horaFim.compareTo(horaInicio)<=0) {
			messages.add("Hora Fim precisa ser maior que Hora Início.");
		}
		
		
		return messages;
	}

}
