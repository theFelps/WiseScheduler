package br.com.wisescheduler.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import br.com.wisescheduler.metamodel.EnumTiposLog;
import br.com.wisescheduler.model.Curso;
import br.com.wisescheduler.model.Instrutor;
import br.com.wisescheduler.model.Log;

@Repository
public class LogDao {
	
	@PersistenceContext
	EntityManager entityManager;
	
	public void adiciona(EnumTiposLog nomeDaAcao, String nomeDoRegistro, String nomeDaTabela, Long usuarioId, String usuarioNome, Long registroId) {
		Date hoje = new Date();
		Log log = new Log();
		log.setDataDeAlteracao(hoje);
		log.setNomeDaAcao(nomeDaAcao.toString());
		log.setNomeDoRegistro(nomeDoRegistro);
		log.setNomeTabela(nomeDaTabela);
		log.setUsuarioId(usuarioId);
		log.setUsuarioNome(usuarioNome);
		log.setIdDoRegistro(registroId);
		
		entityManager.persist(log);
		
	}
	
	public List<Log> listar(Date dataInicio, Date dataFim) {
		
		String consulta = "select l from Log l where dataDeAlteracao between :dataInicio and :dataFim";
		TypedQuery<Log> query = entityManager.createQuery(consulta, Log.class);
		query.setParameter("dataInicio", dataInicio);
		query.setParameter("dataFim", dataFim);
		
		System.out.println("dataaaaInicio"+dataInicio);
		System.out.println("dataaaaFim"+dataFim);

		List<Log> logs = query.getResultList();
		
		return logs;
	}


}
