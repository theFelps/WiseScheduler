package br.com.wisescheduler.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;



@Entity
public class Sala {
	
	@Id
	@GeneratedValue
	private Long id;
	@NotNull(message = "Nome da sala nao pode ser nulo")
	@Size(min=3, message = "Nome da sala deve conter pelo menos 3 caracteres") 
	private String nome_sala;
	private int capacidade;
	private String cor;
	
	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public Long getId() {
		return id;
	}
	
	public String getNome_sala() {
		return nome_sala;
	}
	
	public void setNome_sala(String nome_sala) {
		this.nome_sala = nome_sala;
	}
	
	public int getCapacidade() {
		return capacidade;
	}
	
	public void setCapacidade(int capacidade) {
		this.capacidade = capacidade;
	}
	public void setId(Long id) {
		this.id = id;
	}
}
