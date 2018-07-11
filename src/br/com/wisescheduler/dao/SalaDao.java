package br.com.wisescheduler.dao;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.wisescheduler.metamodel.EnumTiposLog;
import br.com.wisescheduler.model.Sala;
import br.com.wisescheduler.model.Usuario;



@Repository
public class SalaDao {

	@PersistenceContext
	EntityManager entityManager;
	@Autowired
	LogDao logDao;

	public void adiciona(Sala sala, Usuario usuario) {
		entityManager.persist(sala);
		entityManager.flush();
		logDao.adiciona(EnumTiposLog.INCLUSAO, sala.getNome_sala(), Sala.class.getSimpleName(), usuario.getId(), usuario.getNome(), sala.getId());
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public void remove(Sala sala, Usuario usuario) {
		Sala salaParaRemover = buscaPorId(sala.getId());
		logDao.adiciona(EnumTiposLog.EXCLUSAO, salaParaRemover.getNome_sala(), Sala.class.getSimpleName(), usuario.getId(), usuario.getNome(), salaParaRemover.getId());
		entityManager.remove(salaParaRemover);
		

	}

	public void altera(Sala sala, Usuario usuario) {
		entityManager.merge(sala);
		logDao.adiciona(EnumTiposLog.ALTERACAO, sala.getNome_sala(), Sala.class.getSimpleName(), usuario.getId(), usuario.getNome(), sala.getId());

	}

	public List<Sala> listar() {
		return entityManager.createQuery("select s from Sala s", Sala.class).getResultList();
	}
	
	public Sala buscaPorId(Long id){
		return entityManager.find(Sala.class, id);
	
	}
	

}
