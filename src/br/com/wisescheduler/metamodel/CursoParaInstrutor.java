package br.com.wisescheduler.metamodel;

//import java.util.ArrayList;
//import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

@Entity
public class CursoParaInstrutor {
	
	@Id
	@GeneratedValue
	private Long id;
	@NotNull(message = "...")
	private Long instrutorId;
	private Long cursoId;
	
	public Long getInstrutorId() {
		return instrutorId;
	}
	public void setInstrutorId(Long instrutorId) {
		this.instrutorId = instrutorId;
	}
	public Long getCursoId() {
		return cursoId;
	}
	public void setCursoId(Long cursoId) {
		this.cursoId = cursoId;
	}


}
