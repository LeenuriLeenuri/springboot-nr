package com.nr.springboot.model.user.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReqLoginDto {

	@Pattern(regexp = "^[a-zA-Z0-9]*$", message = "이름의 형식이 잘못되었습니다.")
	@Size(min = 4, max = 20, message="이름의 길이가 잘못되었습니다.")
	@NotBlank(message = "이름을 입력하지 않았습니다.")
	private String username;
	
	@Size(min = 4, max = 20, message="비밀번호의 길이가 잘못되었습니다.")
	@NotBlank(message = "비밀번호를 입력하지 않았습니다.")
	private String password;
}
