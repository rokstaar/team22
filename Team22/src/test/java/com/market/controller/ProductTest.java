package com.market.controller;

import java.io.File;
import java.io.IOException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class ProductTest {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductTest.class);
	
	@Test
	public void dirchk() {
		try {
            String currentWorkingDirectory = new File(".").getCanonicalPath();
            logger.info("============={}==============",currentWorkingDirectory);
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
}
