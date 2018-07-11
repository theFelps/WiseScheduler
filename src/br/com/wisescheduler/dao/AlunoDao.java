package br.com.wisescheduler.dao;

import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TransactionRequiredException;
import javax.persistence.TypedQuery;
import javax.transaction.TransactionalException;

import org.hibernate.cache.jbc.TransactionalDataRegionAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.wisescheduler.metamodel.EnumTiposLog;
import br.com.wisescheduler.model.Aluno;
import br.com.wisescheduler.model.Matricula;
import br.com.wisescheduler.model.Turma;
import br.com.wisescheduler.model.Usuario;

@Repository
public class AlunoDao {


	@PersistenceContext
	EntityManager entityManager;
	@Autowired
	LogDao logDao;


	public void adiciona(Aluno aluno, Usuario usuario) {
		entityManager.persist(aluno);
		entityManager.flush();
		logDao.adiciona(EnumTiposLog.INCLUSAO, aluno.getNome(), aluno.getTipo(), usuario.getId(), usuario.getNome(), aluno.getId());
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void remove(Aluno aluno, Usuario usuario) {
		Aluno alunoParaRemover = buscaPorId(aluno.getId());
		logDao.adiciona(EnumTiposLog.EXCLUSAO, alunoParaRemover.getNome(), alunoParaRemover.getTipo(), usuario.getId(), usuario.getNome(), alunoParaRemover.getId());
		entityManager.remove(alunoParaRemover);

	}

	public void altera(Aluno aluno, Usuario usuario) {
		logDao.adiciona(EnumTiposLog.ALTERACAO, aluno.getNome(), aluno.getTipo(), usuario.getId(), usuario.getNome(), aluno.getId());
		entityManager.merge(aluno);
	}

	public List<Aluno> listarTodos() {
		return entityManager.createQuery("select a from Aluno a", Aluno.class).getResultList();
	}

	public Aluno buscaPorId(Long id) {
		return entityManager.find(Aluno.class, id);
	}

	public List<Aluno> listarAlunosForaDessaTurma(long idTurma) {
		String consulta = "select a from Aluno a where id not in (SELECT m.aluno.id FROM Matricula m WHERE m.turma.id = :idTurma) and a.tipo = 'aluno'";
		TypedQuery<Aluno> query = entityManager.createQuery(consulta, Aluno.class);
		query.setParameter("idTurma", idTurma);
		List<Aluno> alunos = query.getResultList();
		return alunos;

	}
	
	public Long contaAlunosDaTurma(Turma turmaBuscada) {
		//Long count = (Long) entityManager.createQuery("select distinct count(*) from Matricula m where m.turma.id = :idTurma").getSingleResult();
		//return count;
		long idTurma = turmaBuscada.getId();
		String consulta = "select distinct count(*) from Matricula m where m.turma.id = :idTurma";
		Query query = entityManager.createQuery(consulta,Long.class);
		query.setParameter("idTurma", idTurma);
		
		return (Long) query.getSingleResult();
	}

	public List<Aluno> listarAlunos() {
		String consulta = "select a from Aluno a where a.tipo = 'aluno'";
		TypedQuery<Aluno> query = entityManager.createQuery(consulta, Aluno.class);
		List<Aluno> alunos = query.getResultList();
		return alunos;

	}

	public List<Aluno> listarInteressados() {
		String consulta = "select a from Aluno a where a.tipo = 'interessado'";
		TypedQuery<Aluno> query = entityManager.createQuery(consulta, Aluno.class);
		List<Aluno> alunos = query.getResultList();
		return alunos;

	}

}
