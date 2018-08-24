package br.com.wisescheduler.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.wisescheduler.metamodel.EnumTiposLog;
import br.com.wisescheduler.model.ConfigFilial;
import br.com.wisescheduler.model.Usuario;



@Repository
public class ConfigFilialDao {
	private final Connection connection;

	@Autowired
	public ConfigFilialDao(DataSource dataSource) {
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
	
	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public void adiciona(ConfigFilial configFilial) {
		entityManager.persist(configFilial);
		entityManager.flush();
		
	}
	
	public ConfigFilial  listar() {

		ConfigFilial filialCadastrada = new ConfigFilial();
		
		try {
			filialCadastrada =  entityManager.createQuery("select e from ConfigFilial e", ConfigFilial.class).getSingleResult();
		}
		 
		catch(NoResultException e) {
			 ConfigFilial filialPlaceholder = new ConfigFilial();
			 filialPlaceholder.setNome("Nome da empresa");
			 
			 adiciona(filialPlaceholder);
		}
		
		
		return filialCadastrada;
		

	
	}
	
	
	
	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public void alteraTipoUsuario(Usuario usuario) {
		Usuario usuarioParaAlterar= entityManager.find(Usuario.class, usuario.getId());
		usuarioParaAlterar.setTipoUsuario(usuario.getTipoUsuario());
		logDao.adiciona(EnumTiposLog.ALTERACAO, usuarioParaAlterar.getNome(), Usuario.class.getSimpleName(), usuarioParaAlterar.getId(), usuarioParaAlterar.getNome(), usuarioParaAlterar.getId());

	}

	public ConfigFilial buscaPorId(Long id){
		return entityManager.find(ConfigFilial.class, id);
	
	}
	public void altera(ConfigFilial filial, Usuario usuario) {
		entityManager.merge(filial);
		logDao.adiciona(EnumTiposLog.ALTERACAO, filial.getNome(), ConfigFilial.class.getSimpleName(), usuario.getId(), usuario.getNome(), filial.getId());

	}
	
}
