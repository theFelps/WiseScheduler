package br.com.wisescheduler.dao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;



import br.com.wisescheduler.model.Agendamento;
import br.com.wisescheduler.model.Sala;
import br.com.wisescheduler.model.Turma;
import br.com.wisescheduler.model.Usuario;
import br.com.wisescheduler.metamodel.EnumTiposLog;
import br.com.wisescheduler.metamodel.TurmaRelatorio;



@Repository
public class TurmaDao {
	Connection connection;
	
	
	@Autowired
	public TurmaDao(DataSource dataSource) {
		try {
			this.connection = dataSource.getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Autowired
	LogDao logDao;
	
	@PersistenceContext
	EntityManager entityManager;
	public Turma buscaPorId(Long id){
		return entityManager.find(Turma.class, id);
	
	}

	public void adiciona(Turma turma, Usuario usuario){
		entityManager.persist(turma);
		entityManager.flush();
		logDao.adiciona(EnumTiposLog.INCLUSAO, turma.getCurso().getNome(), Turma.class.getSimpleName(), usuario.getId(), usuario.getNome(), turma.getId());
		
	}
	

	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public void remove(Turma turma, Usuario usuario){
		Turma turmaParaRemover = buscaPorId(turma.getId());
		entityManager.remove(turmaParaRemover);
		logDao.adiciona(EnumTiposLog.EXCLUSAO, turmaParaRemover.getCurso().getNome(), Turma.class.getSimpleName(), usuario.getId(), usuario.getNome(), turmaParaRemover.getId());

	}
	
	public void altera(Turma turma, Usuario usuario){
		//Para garantir que o numero de alunos atual será mantido <--
		Turma turmaTemp = new Turma();
		turmaTemp = buscaPorId (turma.getId());
		turma.setNumeroDeAlunos(turmaTemp.getNumeroDeAlunos());
		// -->
		entityManager.merge(turma);
		logDao.adiciona(EnumTiposLog.ALTERACAO, turma.getCurso().getNome(), Turma.class.getSimpleName(), usuario.getId(), usuario.getNome(), turma.getId());

		
	}


	public List<Turma> lista(){
		return entityManager.createQuery("select t from Turma t", Turma.class).getResultList();
	}
	public List<Turma> lista(Long turmaId){
		
		TypedQuery<Turma> query = entityManager.createQuery("select t from Turma t where id = :turmaId", Turma.class);
		query.setParameter("turmaId", turmaId);
		return query.getResultList();
	}
	

	public void adicionaAgendamento(Agendamento agendamento, Usuario usuario){
		entityManager.persist(agendamento);
		entityManager.flush();
		logDao.adiciona(EnumTiposLog.INCLUSAO, agendamento.getId().toString(), Agendamento.class.getSimpleName(), usuario.getId(), usuario.getNome(), agendamento.getId());

		
	}
	
	public void removeAgendamento(Long id, Usuario usuario){
		Agendamento agendamentoParaRemover = buscaAgendamentoPorId(id);
		entityManager.remove(agendamentoParaRemover);
		logDao.adiciona(EnumTiposLog.EXCLUSAO, agendamentoParaRemover.getTurma().getCurso().getNome(), Agendamento.class.getSimpleName(), usuario.getId(), usuario.getNome(), agendamentoParaRemover.getId());

		
	}
	
	public List<Agendamento> listaTodosAgendamento(){
		return entityManager.createQuery("select a from Agendamento a", Agendamento.class).getResultList();
	}
	
	
	public List<Agendamento> listaAgendamentoPorTurma(Long turmaId){
		TypedQuery<Agendamento> query = entityManager.createQuery("select a from Agendamento a where turmaId = :turmaId", Agendamento.class);
		query.setParameter("turmaId", turmaId);	
		return query.getResultList();
	}
	

	
	
	public List<Agendamento> validaAgendamento(Agendamento agendamento){
		List<Agendamento> agendamentosConflitantes = new ArrayList<>();
		
		PreparedStatement stmt;
		String sql = "select * from agendamento where "
				+ "((dataInicio between CAST(? as DATE) and CAST(? as DATE) "
				+ "OR dataFim between CAST(? as DATE) and CAST(? as DATE)) "
				+ "OR CAST(? as DATE) between dataInicio and dataFim "
				+ "OR CAST(? as DATE) between dataInicio and dataFim) "
				+ "AND  ((TIME(horaInicio) between TIME(?) and TIME(?)  "
				+ "OR TIME(horaFim)  between TIME(?) and TIME(?)) "
				+ "OR (? between TIME_FORMAT(horaInicio, '%H:%i:%s') and TIME_FORMAT(horaFim, '%H:%i:%s') "
				+ "OR ? between TIME_FORMAT(horaInicio, '%H:%i:%s') and TIME_FORMAT(horaFim, '%H:%i:%s') )) "
				+ "and  (salaId = ?)"; 
		
	
		
		try{
			stmt = connection.prepareStatement(sql);
			
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
			String horaFormatadaInicio = sdf.format(new Timestamp(agendamento.getHoraInicio().getTime()));
			String horaFormatadaFim = sdf.format(new Timestamp(agendamento.getHoraFim().getTime()));
			
			System.out.println(horaFormatadaInicio);
			System.out.println(horaFormatadaFim);

			stmt.setDate(1, new Date(agendamento.getDataInicio().getTime()));
			stmt.setDate(2, new Date (agendamento.getDataFim().getTime()));
			stmt.setDate(3, new Date(agendamento.getDataInicio().getTime()));
			stmt.setDate(4, new Date (agendamento.getDataFim().getTime()));
			stmt.setDate(5, new Date(agendamento.getDataInicio().getTime()));
			stmt.setDate(6, new Date (agendamento.getDataFim().getTime()));
			stmt.setString(7, horaFormatadaInicio);
			stmt.setString(8, horaFormatadaFim);
			stmt.setString(9, horaFormatadaInicio);
			stmt.setString(10, horaFormatadaFim);
			stmt.setString(11, horaFormatadaInicio);
			stmt.setString(12, horaFormatadaFim);
			stmt.setLong(13, agendamento.getSala().getId());
			
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				agendamentosConflitantes.add(populaAgendamento(rs));
		
			}

			rs.close();
			stmt.close();	
			
			if(agendamentosConflitantes.isEmpty()){
				return null;
			}
			
			return agendamentosConflitantes;
			
			
		}
		catch(SQLException e){
			throw new RuntimeException(e);
		}

				
		
	}

	
	public Agendamento buscaAgendamentoPorId(Long id){
		return entityManager.find(Agendamento.class, id);
	}
	


	public List<TurmaRelatorio> geraRelatorioTurma(Long id){
		PreparedStatement stmt;
		String sql = "select * from v_agendamento_matricula_aluno_turma_curso_instrutor where idTurma = ?";

		try{
			stmt = connection.prepareStatement(sql);
			stmt.setLong(1, id);
			List<TurmaRelatorio> enviaRelatorio = new ArrayList<>();
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				enviaRelatorio.add(populaRelatorioTurma(rs));
			}
		    rs.close();
			stmt.close();
			return enviaRelatorio;
		}
		catch(SQLException e){
			throw new RuntimeException(e);
		}
		}
		
		
		public TurmaRelatorio populaRelatorioTurma(ResultSet rs) throws SQLException {
			TurmaRelatorio relatorio = new TurmaRelatorio();
			relatorio.setNomeAluno(rs.getString("nomeAluno"));
			relatorio.setIdMatricula(rs.getLong("idMatricula"));
			relatorio.setIdTurma(rs.getLong("idTurma"));
			relatorio.setNomeCurso(rs.getString("nomeCurso"));
			relatorio.setNomeEmpresa(rs.getString("nomeEmpresa"));
			relatorio.setNomeInstrutor(rs.getString("nomeInstrutor"));
			relatorio.setNomeSala(rs.getString("nomeSala"));
			relatorio.setDataInicio(rs.getDate("dataInicio"));
			relatorio.setDataFim(rs.getDate("dataFim"));
//			relatorio.setHoraInicio(rs.getTimestamp("horaInicio"));
//			relatorio.setHoraFim(rs.getTimestamp("horaFim"));
			relatorio.setValorMatricula(rs.getBigDecimal("valorMatricula"));
			relatorio.setPagoMatricula(rs.getBoolean("pagoMatricula"));
			return relatorio;
		}
		
		public Agendamento populaAgendamento(ResultSet rs) throws SQLException {
			Sala sala = new Sala();
			Turma turma = new Turma();
			Agendamento agendamento = new Agendamento();
			agendamento.setDataInicio(rs.getDate("dataInicio"));
			agendamento.setDataFim(rs.getDate("dataFim"));
			agendamento.setHoraInicio(rs.getTimestamp("horaInicio"));
			agendamento.setHoraFim(rs.getTimestamp("horaFim"));
			sala.setId(rs.getLong("salaId"));
			turma.setId(rs.getLong("turmaId"));
			agendamento.setSala(sala);
			agendamento.setTurma(turma);
			return agendamento;
		}
	

	

	
	

	
}
