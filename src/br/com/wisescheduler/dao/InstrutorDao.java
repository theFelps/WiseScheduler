package br.com.wisescheduler.dao;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import br.com.wisescheduler.model.*;
import br.com.wisescheduler.metamodel.CursoParaInstrutor;
import br.com.wisescheduler.metamodel.EnumTiposLog;


@Repository
public class InstrutorDao {
	
	@PersistenceContext
	EntityManager entityManager;
	@Autowired
	LogDao logDao;
	

	public void adiciona(Instrutor instrutor, Usuario usuario) {
		entityManager.persist(instrutor);
		entityManager.flush();
		logDao.adiciona(EnumTiposLog.INCLUSAO, instrutor.getNome(), Instrutor.class.getSimpleName(), usuario.getId(), usuario.getNome(), instrutor.getId());
		
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public void remove(Instrutor instrutor, Usuario usuario) {
		Instrutor instrutorParaRemover = buscaPorId(instrutor.getId());
		logDao.adiciona(EnumTiposLog.EXCLUSAO, instrutorParaRemover.getNome(), Instrutor.class.getSimpleName(), usuario.getId(), usuario.getNome(), instrutorParaRemover.getId());
		entityManager.remove(instrutorParaRemover);
		

	}

	public void altera(Instrutor instrutor, Usuario usuario) {
		logDao.adiciona(EnumTiposLog.ALTERACAO, instrutor.getNome(), Instrutor.class.getSimpleName(), usuario.getId(), usuario.getNome(), instrutor.getId());
		entityManager.merge(instrutor);
		
	}

	public List<Instrutor> listar() {
		return entityManager.createQuery("select i from Instrutor i",Instrutor.class).getResultList();
	}


	
	public List<Curso> listarCursosInstrutor( long IdInstrutor) {
		String consulta = "select c from Curso c where id IN (SELECT ci.cursoId FROM CursoParaInstrutor ci WHERE ci.instrutorId = :IdInstrutor)";
		TypedQuery<Curso> query = entityManager.createQuery(consulta, Curso.class);
		query.setParameter("IdInstrutor", IdInstrutor);
		List<Curso> cursosDoInstrutor = query.getResultList();
		
		return cursosDoInstrutor;

	}
	
	public List<Curso> listarTodosCursos(long idInstrutor) {
		String consulta = "select c from Curso c where id not in (SELECT ci.cursoId FROM CursoParaInstrutor ci WHERE ci.instrutorId = :idInstrutor)";
		TypedQuery<Curso> query = entityManager.createQuery(consulta, Curso.class);
		query.setParameter("idInstrutor", idInstrutor);
		List<Curso> cursos = query.getResultList();
		return cursos;
	}
	
	public void adicionaCursoInstrutor(Long instrutorId, Long cursoId, Usuario usuario) {
		CursoParaInstrutor cursoInstrutor = new CursoParaInstrutor();
		cursoInstrutor.setInstrutorId(instrutorId);
		cursoInstrutor.setCursoId(cursoId);
		entityManager.persist(cursoInstrutor);
		Instrutor instrutorTemp = new Instrutor();
		instrutorTemp = buscaPorId(instrutorId);
		logDao.adiciona(EnumTiposLog.ALTERACAO, instrutorTemp.getNome(), Instrutor.class.getSimpleName(), usuario.getId(), usuario.getNome(), instrutorId);
		
	}


	public void removeCursoInstrutor(Long cursoId, Long instrutorId, Usuario usuario) {
		String busca = "delete from CursoParaInstrutor ci where ci.cursoId = :cursoId and ci.instrutorId = :instrutorId";
		Query query = entityManager.createQuery(busca);
		query.setParameter("instrutorId", instrutorId);
		query.setParameter("cursoId",cursoId);
		query.executeUpdate();
		Instrutor instrutorTemp = new Instrutor();
		instrutorTemp = buscaPorId(instrutorId);
		logDao.adiciona(EnumTiposLog.ALTERACAO, instrutorTemp.getNome(), Instrutor.class.getSimpleName(), usuario.getId(), usuario.getNome(), instrutorId);

	}
	
	
	public Instrutor buscaPorId(Long id){
		return entityManager.find(Instrutor.class, id);
		
	}
	


}
