package br.com.wisescheduler.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.wisescheduler.metamodel.EnumTiposLog;
import br.com.wisescheduler.model.Matricula;
import br.com.wisescheduler.model.Turma;
import br.com.wisescheduler.model.Usuario;


@Repository
public class MatriculaDao {
	
	@PersistenceContext
	EntityManager entityManager;
	@Autowired
	LogDao logDao;
	

	public List<Matricula> listaPorTurma(Long turmaId){
		String consulta = "select m from Matricula m where turmaId = :turmaId";
		
		TypedQuery<Matricula> query = entityManager.createQuery(consulta, Matricula.class);
		query.setParameter("turmaId", turmaId);
		
		List<Matricula> matriculas = query.getResultList();
		return matriculas;
	}
	
	
	public List<Matricula> buscaTodasMatricula(){
		return entityManager.createQuery("select m from Matricula m", Matricula.class).getResultList();
	}
	
	
	
	public List<Matricula> buscaPorAluno(Long alunoId){
		String consulta = "select m from Matricula m where alunoId = :alunoId";
		TypedQuery<Matricula> query = entityManager.createQuery(consulta, Matricula.class);
		query.setParameter("alunoId", alunoId);
		List<Matricula> matriculas = query.getResultList();
		return matriculas;
	}
	
	public void adiciona(Matricula matricula, Usuario usuario){
		Turma turmaA = entityManager.find(Turma.class, matricula.getTurma().getId());
		turmaA.setNumeroDeAlunos(turmaA.getNumeroDeAlunos()+1);
		entityManager.persist(matricula);
		entityManager.flush();
		logDao.adiciona(EnumTiposLog.INCLUSAO, matricula.getId().toString(), Matricula.class.getSimpleName(), usuario.getId(), usuario.getNome(), matricula.getId());
		
	}
		
	public void remove(Matricula matricula, Usuario usuario) {

		Turma turmaA = entityManager.find(Turma.class, matricula.getTurma().getId());
		turmaA.setNumeroDeAlunos(turmaA.getNumeroDeAlunos()-1);
		
		Matricula matriculaParaRemover = buscaPorId(matricula.getId());
		logDao.adiciona(EnumTiposLog.EXCLUSAO, matriculaParaRemover.getAluno().getNome(), Matricula.class.getSimpleName(), usuario.getId(), usuario.getNome(), matriculaParaRemover.getId());
		entityManager.remove(matriculaParaRemover);

	}
	public void alteraPago(Matricula alteraMatricula, Usuario usuario) {
		Matricula matricula = entityManager.find(Matricula.class, alteraMatricula.getId());
		matricula.setPago(alteraMatricula.getPago());
		logDao.adiciona(EnumTiposLog.ALTERACAO, matricula.getAluno().getNome(), Matricula.class.getSimpleName(), usuario.getId(), usuario.getNome(), matricula.getId());

	}
	
	public List<Matricula> listar() {
		return entityManager.createQuery("select m from Matricula", Matricula.class).getResultList();

	}
	
	public Matricula buscaPorId(Long id){
		return entityManager.find(Matricula.class, id);
	
	}
	

}
