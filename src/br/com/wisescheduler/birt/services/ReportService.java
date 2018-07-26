package br.com.wisescheduler.birt.services;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.wisescheduler.birt.dto.Report;



/**
 * Report service class interface
 * 
 * @author shamseer
 *
 */
public interface ReportService {

	/**
	 * Generate main report by its file name
	 * 
	 * @param reportName
	 * @param response
	 * @param request
	 */
	public void generateMainReport(String reportName, HttpServletResponse response, HttpServletRequest request);

	/**
	 * Generate Report thumb by its name
	 * 
	 * @param reportName
	 * @param response
	 * @param request
	 */
	public void generateReportThumb(String reportName, HttpServletResponse response, HttpServletRequest request);

	/**
	 * Get the list of available reports
	 * 
	 * @return
	 */
	public List<Report> getReports();
}
