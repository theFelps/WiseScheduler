package br.com.wisescheduler.metamodel;

public enum EnumTiposLog {
	INCLUSAO("Inclus�o"), ALTERACAO("Altera��o"), EXCLUSAO("Exclus�o");
	
	private String valorTipo;
	
	private EnumTiposLog(String valor) {
		valorTipo = valor;
		
	}

	 @Override
	 public String toString(){
		 return valorTipo;
	 }


}
