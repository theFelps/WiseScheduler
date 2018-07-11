package br.com.wisescheduler.metamodel;

public enum EnumTiposLog {
	INCLUSAO("Inclusão"), ALTERACAO("Alteração"), EXCLUSAO("Exclusão");
	
	private String valorTipo;
	
	private EnumTiposLog(String valor) {
		valorTipo = valor;
		
	}

	 @Override
	 public String toString(){
		 return valorTipo;
	 }


}
