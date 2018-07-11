package br.com.wisescheduler.model;

import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;



@Entity
public class Matricula {
	
	/*Empresa que paga um curso para um aluno ou uma turma inteira.*/ 
	@Id
	@GeneratedValue
	private Long id;
	private BigDecimal valor;
	private Boolean pago;
	
	@OneToOne
	@JoinColumn(name= "empresaId")
	private Empresa empresa;
	
	@OneToOne
	@JoinColumn(name= "alunoId")
	private Aluno aluno;
	
	@OneToOne
	@JoinColumn(name= "turmaId")
	private Turma turma;
	
	
	public Long getId() {
		
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public BigDecimal getValor() {
		return valor;
	}
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	public Boolean getPago() {
		return pago;
	}
	public void setPago(Boolean pago) {
		this.pago = pago;
	}
	public Empresa getEmpresa() {
		return empresa;
	}
	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}
	public Aluno getAluno() {
		return aluno;
	}
	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}
	public Turma getTurma() {
		return turma;
	}
	public void setTurma(Turma turma) {
		this.turma = turma;
	}

	
}
