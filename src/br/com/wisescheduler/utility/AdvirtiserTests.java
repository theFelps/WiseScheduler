package br.com.wisescheduler.utility;

import org.testng.annotations.Test;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.AfterMethod;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;

public class AdvirtiserTests {
	
  ChromeDriver driver = new ChromeDriver();	
  
  @Test
  public void tryToCreateNewAdvertiserWithoutShareCut() throws InterruptedException {
	  
	  WebElement advirtisersNavBarLink;
	  advirtisersNavBarLink  = driver.findElement(By.linkText("Advertisers"));
	  advirtisersNavBarLink.click();
	  
	  WebElement subscribeNewAdvirtiserButton;
	  subscribeNewAdvirtiserButton  = driver.findElement(By.linkText("Subscribe new advertiser"));
	  subscribeNewAdvirtiserButton.click();
	  
	  WebElement fieldName;
	  fieldName = driver.findElement(By.id("Name"));
	  fieldName.sendKeys("Valid name");
	  
	  Thread.sleep(1000);
	  
	  WebElement fieldShareCut;
	  fieldShareCut = driver.findElement(By.id("ShareCut"));
	  fieldShareCut.sendKeys("--");
	  
	  Thread.sleep(1000);
	  
	  WebElement saveButton;
	  saveButton = driver.findElement(By.id("btnSave"));
	  saveButton.click();
	  
	  Thread.sleep(500);
	  
	  String shareCutEmptyErrorMessage = driver.findElement(By.xpath("//*[@id='aform']/div[3]/div[1]/div[2]")).getText();
	  Assert.assertEquals(shareCutEmptyErrorMessage, "Please include a share cut.");
	  
	  	  	   
  }
  @Test
  public void tryToCreateNewAdvertiserWithoutName() throws InterruptedException {
	  
	  WebElement advirtisersNavBarLink;
	  advirtisersNavBarLink  = driver.findElement(By.linkText("Advertisers"));
	  advirtisersNavBarLink.click();
	  
	  WebElement subscribeNewAdvirtiserButton;
	  subscribeNewAdvirtiserButton  = driver.findElement(By.linkText("Subscribe new advertiser"));
	  subscribeNewAdvirtiserButton.click();
	  
	  WebElement fieldName;
	  fieldName = driver.findElement(By.id("Name"));
	  fieldName.sendKeys("");
	  
	  WebElement saveButton;
	  saveButton = driver.findElement(By.id("btnSave"));
	  saveButton.click();
	  
	  Thread.sleep(500);
	  
	  String nameEmptyErrorMessage = driver.findElement(By.className("invalid-feedback")).getText();
	  Assert.assertEquals(nameEmptyErrorMessage, "Please include a name.");
	  
	  	  	   
  }
 
  
  @Test
  public void createAdvirtiser() throws InterruptedException {
	  WebElement advirtisersNavBarLink;
	  advirtisersNavBarLink  = driver.findElement(By.linkText("Advertisers"));
	  advirtisersNavBarLink.click();
	  
	  WebElement subscribeNewAdvirtiserButton;
	  subscribeNewAdvirtiserButton  = driver.findElement(By.linkText("Subscribe new advertiser"));
	  subscribeNewAdvirtiserButton.click();
	  
	  WebElement fieldName;
	  fieldName = driver.findElement(By.name("Name"));
	  fieldName.sendKeys("Automated test advirtiser");
	  
	  WebElement fieldDescription;
	  fieldDescription = driver.findElement(By.id("description"));
	  fieldDescription.sendKeys("Automated test description");
	  
	  WebElement fieldShareCut;
	  fieldShareCut = driver.findElement(By.id("ShareCut"));
	  fieldShareCut.sendKeys("0.45");
	  
	  WebElement fieldSPostBackDomain;
	  fieldSPostBackDomain = driver.findElement(By.id("PostBackDomain"));
	  fieldSPostBackDomain.sendKeys("www.automatedtesturl.test");
	  
	  Thread.sleep(1000);
	  
	  WebElement saveButton;
	  saveButton = driver.findElement(By.id("btnSave"));
	  saveButton.click();
	  
	  Thread.sleep(1000);
	  
	  WebElement okButton;
	  okButton = driver.findElement(By.className("swal-button"));
	  okButton.click();
	  
	  
  }
  @BeforeMethod
  public void beforeMethod() throws InterruptedException {
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

  @AfterMethod
  public void afterMethod() {
	  
	  driver.quit();
  }

}
