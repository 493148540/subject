package com.zm.platform.util;


import java.util.regex.Pattern;

import org.junit.Test;

public class Votify {
	public static final String EMAIL_PATTERN = "^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
	public static final String PHONE_PATTERN = "^[1][3578]+[0-9]{9}+$";
	
	public static boolean votifyEmail(String testeamil){

	     return Pattern.matches(EMAIL_PATTERN, testeamil);

	}
	
	public static boolean votifyPhone(String testphone){

	     return Pattern.matches(PHONE_PATTERN, testphone);

	}
	@Test
	public void test(){
		System.out.println(votifyPhone("15682013303"));
	}
}
