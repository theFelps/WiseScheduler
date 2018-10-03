package br.com.wisescheduler.utility;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.Test;

public class LoginTests {
	ChromeDriver driver = new ChromeDriver();

	@Test
	public void loginWithBadCredentials() throws InterruptedException{
		System.setProperty("webdriver.chrome.driver", "D:\\AAJedi\\Eclipse Workspace\\AceWall Testing\\Webdrivers\\chromedriver.exe");
		ChromeDriver driver = new ChromeDriver();
		driver.get("https://acewall-dev.dogood.media/");
		
		WebElement logInButton;
		logInButton  = driver.findElement(By.linkText("Log in"));
		logInButton.click();
		
		Thread.sleep(1000);
		
		WebElement emailField;
		emailField = driver.findElement(By.id("Email"));
		emailField.sendKeys("jmachado@dogood.media");
		
		WebElement passwordField;
		passwordField = driver.findElement(By.id("Passworld"));
		passwordField.sendKeys("1q2w3e4rBADCHARACTERS");
		
		WebElement signInButton;
		signInButton = driver.findElement(By.id("btnSignIn"));
		signInButton.click();
		
		Thread.sleep(2000);
						
		WebElement errorModalText;
		errorModalText = driver.findElement(By.className("swal-title"));
		System.out.println("TEST 001 - Text found when tried log in with wrong password: "+errorModalText.getText());
		Assert.assertEquals(errorModalText.getText(), "Something is wrong");
		
		Thread.sleep(1000);
		
		WebElement OKbuttonOnErrorModal;
		OKbuttonOnErrorModal = driver.findElement(By.className("swal-button"));
		OKbuttonOnErrorModal.click();
					
		driver.quit();
	}
	@Test
	public void loginWithGoodCredentials() throws InterruptedException {
		ChromeDriver driver = new ChromeDriver();
		driver.get("https://acewall-dev.dogood.media/");
		
		WebElement logInButton;
		logInButton  = driver.findElement(By.linkText("Log in"));
		logInButton.click();
		
		Thread.sleep(1000);
		
		WebElement emailField;
		emailField = driver.findElement(By.id("Email"));
		emailField.sendKeys("jmachado@dogood.media");
		
		WebElement passwordField;
		passwordField = driver.findElement(By.id("Passworld"));
		passwordField.sendKeys("1q2w3e4r");
		
		
		WebElement signInButton;
		signInButton = driver.findElement(By.id("btnSignIn"));
		signInButton.click();
		
		Thread.sleep(1500);
		
		String URLafterLogin = driver.getCurrentUrl();
		Assert.assertEquals(URLafterLogin, "https://acewall-dev.dogood.media/Administrative");
			
	}
}
