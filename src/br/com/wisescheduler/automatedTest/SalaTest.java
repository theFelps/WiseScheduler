package br.com.wisescheduler.automatedTest;



import java.util.List;

import org.junit.BeforeClass;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.*;
import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

class SalaTest {
	static ChromeDriver driver;
	

	@Test
     public void criaSala() {
		
		WebElement menuSalaBtn;
		menuSalaBtn = driver.findElement(By.xpath("/html/body/div/div[2]/div[1]/div/div/div[2]/div/a[3]"));
		menuSalaBtn.click();
		
		WebElement cadastrarNovaSalaBtn;
		cadastrarNovaSalaBtn = driver.findElement(By.xpath("/html/body/div/div[2]/div[2]/a"));
		cadastrarNovaSalaBtn.click();
		
		WebElement fieldNomeSala;
		fieldNomeSala = driver.findElement(By.id("nome"));
		String nomeDaSala = "Sala01t";
		fieldNomeSala.sendKeys(nomeDaSala);
		
		WebElement fieldCapacidade;
		fieldCapacidade = driver.findElement(By.id("capacidade"));
		fieldCapacidade.sendKeys("30");
		
		WebElement fieldCor;
		fieldCor = driver.findElement(By.id("cor"));
		fieldCor.clear();
		fieldCor.sendKeys("000000");
		
		WebElement cadastrarSalaBtn;
		cadastrarSalaBtn = driver.findElement(By.xpath("/html/body/div/div[2]/div[2]/form/button"));
		cadastrarSalaBtn.click();
		
		//To locate table.
		  WebElement mytable = driver.findElement(By.xpath("/html/body/div/div[2]/div[2]/table/tbody"));

		  //To locate rows of table.
		  List < WebElement > rows_table = mytable.findElements(By.tagName("tr"));

		  //To calculate no of rows In table.
		  int rows_count = rows_table.size();
		  String lastElement = rows_count + "";
		
		WebElement ultimaSalaDaLista;
		ultimaSalaDaLista = driver.findElement(By.xpath("/html/body/div/div[2]/div[2]/table/tbody/tr["+lastElement+"]/td[1]"));
		
		String salaRecemCadastrada = driver.findElement(By.xpath("/html/body/div/div[2]/div[2]/table/tbody/tr["+lastElement+"]/td[1]")).getText();
		Assert.assertEquals(salaRecemCadastrada, nomeDaSala);

     }
	
	@Test
	public void deletaSala() {
//		/html/body/div/div[2]/div[2]/table/tbody/tr[2]/td[5]/a
	}
	
	
	@org.testng.annotations.BeforeClass
	public void loginPass() {
		System.setProperty("webdriver.chrome.driver", "C:\\Selenium\\chromedriver.exe");
		driver = new ChromeDriver();
		
		driver.get("http://localhost:8080/WiseScheduler/loginForm");

		WebElement loginField;
		loginField = driver.findElement(By.id("username"));
		loginField.sendKeys("andre");
		
		
		WebElement passwordField;
		passwordField = driver.findElement(By.id("password"));
		passwordField.sendKeys("123");
		

		WebElement logInButton;
		logInButton  = driver.findElement(By.id("btnLogin"));
		logInButton.click();
	}
	

	

	
	
}
