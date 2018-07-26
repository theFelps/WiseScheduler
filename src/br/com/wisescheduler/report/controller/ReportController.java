package br.com.wisescheduler.report.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.birt.report.engine.api.EngineException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.wisescheduler.birt.dto.AppException.AppExceptionDto;
import br.com.wisescheduler.birt.dto.Report;
import br.com.wisescheduler.birt.services.ReportService;
import br.com.wisescheduler.dao.AlunoDao;
import br.com.wisescheduler.dao.CursoDao;
import br.com.wisescheduler.dao.EmpresaDao;
import br.com.wisescheduler.dao.InstrutorDao;
import br.com.wisescheduler.dao.MatriculaDao;
import br.com.wisescheduler.dao.SalaDao;
import br.com.wisescheduler.dao.TurmaDao;

@Controller
public class ReportController {
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
	@Autowired
	private ReportService reportService;

		/**
		 * generate list of reports
		 * 
		 * @return
		 */
		@RequestMapping(produces = "application/json", method = RequestMethod.GET, value = "/report")
		@ResponseBody
		public List<Report> listReports() {
			return reportService.getReports();
		}

		/**
		 * Generate report thumbnail
		 * 
		 * @param response
		 * @param request
		 * @param name
		 * @throws EngineException
		 * @throws IOException
		 */
		@RequestMapping(method = RequestMethod.GET, value = "/report/thumb/{name}")
		@ResponseBody
		public void generateReportThumb(HttpServletResponse response, HttpServletRequest request,
				@PathVariable("name") String name) throws EngineException, IOException {
			reportService.generateReportThumb(name, response, request);
		}

		/**
		 * Generate full report
		 * 
		 * @param response
		 * @param request
		 * @param name
		 * @throws EngineException
		 * @throws IOException
		 */
		@RequestMapping(method = RequestMethod.POST, value = "/report/main/{name}")
		@ResponseBody
		public void generateFullReport(HttpServletResponse response, HttpServletRequest request,
				@PathVariable("name") String name) throws EngineException, IOException {
			reportService.generateMainReport(name, response, request);
		}

		/**
		 * Exception handler
		 * 
		 * @param e
		 * @return
		 */
		@ExceptionHandler(Exception.class)
		@ResponseBody
		public AppExceptionDto handleErrors(Exception e) {
			e.printStackTrace();
			return new AppExceptionDto(e.getMessage(), 10);
		}
	}
	

