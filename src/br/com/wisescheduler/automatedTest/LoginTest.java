package br.com.wisescheduler.automatedTest;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.Test;

public class LoginTest {

	@Test
	public void loginPass() {
		System.setProperty("webdriver.chrome.driver", "C:\\Selenium\\chromedriver.exe");
		WebDriver driver = new ChromeDriver();

		
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
