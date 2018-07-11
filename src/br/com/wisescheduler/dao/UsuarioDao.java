package br.com.wisescheduler.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.wisescheduler.metamodel.EnumTiposLog;
import br.com.wisescheduler.model.Curso;
import br.com.wisescheduler.model.Matricula;
import br.com.wisescheduler.model.Sala;
import br.com.wisescheduler.model.Turma;
import br.com.wisescheduler.model.Usuario;



@Repository
public class UsuarioDao {
	private final Connection connection;

	@Autowired
	public UsuarioDao(DataSource dataSource) {
		try {
			this.connection = dataSource.getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Autowired
	LogDao logDao;

	public boolean existeUsuario(Usuario usuario) {
		
		if(usuario == null) {
			throw new IllegalArgumentException("Usuário não deve ser nulo");
		}
		
		try {
			PreparedStatement stmt = this.connection.prepareStatement("select * from usuario where login = ? and senha = ?");
			stmt.setString(1, usuario.getlogin());
			stmt.setString(2, usuario.getSenha());
			ResultSet rs = stmt.executeQuery();

			boolean encontrado = rs.next();
			rs.close();
			stmt.close();

			return encontrado;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@PersistenceContext
	EntityManager entityManager;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public void adiciona(Usuario usuario) {
		entityManager.persist(usuario);
		entityManager.flush();
		logDao.adiciona(EnumTiposLog.INCLUSAO, usuario.getNome(), Usuario.class.getSimpleName(), usuario.getId(), usuario.getNome(), usuario.getId());
	}
	
	public List<Usuario> listar() {
		return entityManager.createQuery("select u from Usuario u", Usuario.class).getResultList();
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public void remove(Usuario usuario) {
		Usuario usuarioParaExcluir = buscaPorId(usuario.getId());
		entityManager.remove(usuarioParaExcluir);
		logDao.adiciona(EnumTiposLog.EXCLUSAO, usuarioParaExcluir.getNome(), Usuario.class.getSimpleName(), usuarioParaExcluir.getId(), usuarioParaExcluir.getNome(), usuarioParaExcluir.getId());

	}
	public void alteraTipoUsuario(Usuario usuario) {
		Usuario usuarioParaAlterar= entityManager.find(Usuario.class, usuario.getId());
		usuarioParaAlterar.setTipoUsuario(usuario.getTipoUsuario());
		logDao.adiciona(EnumTiposLog.ALTERACAO, usuarioParaAlterar.getNome(), Usuario.class.getSimpleName(), usuarioParaAlterar.getId(), usuarioParaAlterar.getNome(), usuarioParaAlterar.getId());

	}
	
	public Usuario buscaPorId(Long id){
		return entityManager.find(Usuario.class, id);
	
	}
	
	public Usuario buscaPorLogin(String login){
		
		TypedQuery<Usuario> query = entityManager.createQuery("select u from Usuario u where login = :login", Usuario.class);
		query.setParameter("login", login);
		return query.getSingleResult();
	}
}

