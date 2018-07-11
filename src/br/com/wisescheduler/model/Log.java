package br.com.wisescheduler.model;

import java.util.Date;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import com.sun.istack.internal.Nullable;

@Entity
public class Log {
	
	@Id
	@GeneratedValue
	private Long id;
	private Long usuarioId;
	private String usuarioNome;
	private String nomeTabela;
	private Date dataDeAlteracao;
	@Nullable
	private Long idDoRegistro;
	private String nomeDoRegistro;
	private String nomeDaAcao;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getUsuarioId() {
		return usuarioId;
	}
	public void setUsuarioId(Long usuarioId) {
		this.usuarioId = usuarioId;
	}
	public String getUsuarioNome() {
		return usuarioNome;
	}
	public void setUsuarioNome(String usuarioNome) {
		this.usuarioNome = usuarioNome;
	}
	public String getNomeTabela() {
		return nomeTabela;
	}
	public void setNomeTabela(String nomeTabela) {
		this.nomeTabela = nomeTabela;
	}
	public Date getDataDeAlteracao() {
		return dataDeAlteracao;
	}
	public void setDataDeAlteracao(Date dataDeAlteracao) {
		this.dataDeAlteracao = dataDeAlteracao;
	}
	public String getNomeDoRegistro() {
		return nomeDoRegistro;
	}
	public void setNomeDoRegistro(String nomeDoRegistro) {
		this.nomeDoRegistro = nomeDoRegistro;
	}
	public String getNomeDaAcao() {
		return nomeDaAcao;
	}
	public void setNomeDaAcao(String nomeDaAcao) {
		this.nomeDaAcao = nomeDaAcao;
	}
	public long getIdDoRegistro() {
		return idDoRegistro;
	}
	public void setIdDoRegistro(Long idDoRegistro) {
		this.idDoRegistro = idDoRegistro;
	}
	
}
