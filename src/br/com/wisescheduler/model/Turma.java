package br.com.wisescheduler.model;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Transient;




@Entity
public class Turma {
	
	@Id
	@GeneratedValue
	private Long id;
	private String observacao;
	private int estado;
	private Long numeroDeAlunos;
	
	@OneToOne
	@JoinColumn (name= "cursoId")
	private Curso curso;
	
	@OneToOne
	@JoinColumn (name= "instrutorId")
	private Instrutor instrutor;
	
	@Transient
	private List<Agendamento> agendamento = new ArrayList<>();
	
	@Transient//faz o alunos não virar campo na tabela
	private ArrayList<Matricula> alunos =  new ArrayList<Matricula>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	public Long getNumeroDeAlunos() {
		return numeroDeAlunos;
//		
	    //Turma turmaTemp = new Turma();
	    //turmaTemp.setId(this.getId());
		//AlunoDao AlunoDao = new AlunoDao();
		//setNumeroDeAlunos(AlunoDao.contaAlunosDaTurma(turmaTemp));
		//return numeroDeAlunos;
	}

	public void setNumeroDeAlunos(Long numeroDeAlunos) {
		this.numeroDeAlunos = numeroDeAlunos;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	public Instrutor getInstrutor() {
		return instrutor;
	}

	public void setInstrutor(Instrutor instrutor) {
		this.instrutor = instrutor;
	}

	public ArrayList<Matricula> getAlunos() {
		return alunos;
	}

	public void setAlunos(ArrayList<Matricula> alunos) {
		this.alunos = alunos;
	}

	public List<Agendamento> getAgendamento() {
		return agendamento;
	}

	public void setAgendamento(List<Agendamento> agendamento) {
		this.agendamento = agendamento;
	}
	
}
