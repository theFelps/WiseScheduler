package br.com.wisescheduler.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.wisescheduler.metamodel.EnumTiposLog;
import br.com.wisescheduler.model.Empresa;
import br.com.wisescheduler.model.Usuario;

@Repository
public class EmpresaDao {

	@PersistenceContext
	EntityManager entityManager;
	@Autowired
	LogDao logDao;

	public void adiciona(Empresa empresa, Usuario usuario) {
		entityManager.persist(empresa);
		entityManager.flush();
		logDao.adiciona(EnumTiposLog.INCLUSAO, empresa.getNome(), Empresa.class.getSimpleName(), usuario.getId(), usuario.getNome(), empresa.getId());
		
		
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public void remove(Empresa empresa, Usuario usuario) {
		Empresa empresaParaRemover = buscaPorId(empresa.getId());
		entityManager.remove(empresaParaRemover);
		logDao.adiciona(EnumTiposLog.EXCLUSAO, empresaParaRemover.getNome(), Empresa.class.getSimpleName(), usuario.getId(), usuario.getNome(), empresaParaRemover.getId());
	}

	public void altera(Empresa empresa, Usuario usuario) {
		entityManager.merge(empresa);
		logDao.adiciona(EnumTiposLog.ALTERACAO, empresa.getNome(), Empresa.class.getSimpleName(), usuario.getId(), usuario.getNome(), empresa.getId());

	}

	public List<Empresa> listar() {
		return entityManager.createQuery("select e from Empresa e",Empresa.class).getResultList();	
		
	}
	
	
	public Empresa buscaPorId(Long id){
		return entityManager.find(Empresa.class, id);
	
	}
	

}
