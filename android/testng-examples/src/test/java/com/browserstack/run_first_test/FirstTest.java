package com.browserstack.run_first_test;

import io.appium.java_client.MobileBy;
import io.appium.java_client.android.AndroidElement;

import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.support.ui.ExpectedConditions;

import org.testng.Assert;
import org.testng.annotations.Test;
import java.util.List;
import static org.junit.Assert.assertTrue;

public class FirstTest extends BrowserStackTestNGTest {

    @Test
    public void test() throws Exception {
        String assertionLabel = "TextView with text 'HelloWorld' is present.";
        Thread.sleep(50);
        List<AndroidElement> elements = driver.findElementsById("HelloWorldTextView");
        if (elements.size() > 0) {
          String textViewText = elements.get(0).getText();
          assertTrue(assertionLabel, textViewText.equals("Hello World!"));
        } else {
          assertTrue(assertionLabel, false);
        }
    }
}
