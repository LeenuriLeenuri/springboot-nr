package com.nr.springboot.model;

public interface ReturnCode {

	public static int 아이디중복 = -2;
	int 오류 = -1;
	int 성공 = 1;
	int 무반응 = 0;
	int 권한없음 = -3;

}