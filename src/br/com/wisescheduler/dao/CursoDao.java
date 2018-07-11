package br.com.wisescheduler.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.wisescheduler.metamodel.EnumTiposLog;
import br.com.wisescheduler.model.Curso;
import br.com.wisescheduler.model.Usuario;

@Repository
public class CursoDao {
	
	@PersistenceContext
	EntityManager entityManager;
	@Autowired
	LogDao logDao;
	
	public void adiciona(Curso curso, Usuario usuario) {
		entityManager.persist(curso);
		entityManager.flush();
		logDao.adiciona(EnumTiposLog.INCLUSAO, curso.getCodigo(), Curso.class.getSimpleName(), usuario.getId(), usuario.getNome(), curso.getId());
		
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public void remove(Curso curso, Usuario usuario) {
		Curso cursoParaRemover = buscaPorId(curso.getId());
		entityManager.remove(cursoParaRemover);
		logDao.adiciona(EnumTiposLog.EXCLUSAO, cursoParaRemover.getCodigo(), Curso.class.getSimpleName(), usuario.getId(), usuario.getNome(), cursoParaRemover.getId());
	}

	public void altera(Curso curso, Usuario usuario) {
		entityManager.merge(curso);
		logDao.adiciona(EnumTiposLog.ALTERACAO, curso.getCodigo(), Curso.class.getSimpleName(), usuario.getId(), usuario.getNome(), curso.getId());

	}

	public List<Curso> listar() {
		return entityManager.createQuery("select c from Curso c", Curso.class).getResultList();

	}
	
	
	public Curso buscaPorId(Long id){
		return entityManager.find(Curso.class, id);
	
	}


}
