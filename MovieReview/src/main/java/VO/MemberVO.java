package VO;

import lombok.Data;

@Data
public class MemberVO {

	private String id;
	private String password;
	private String email;
	private String nickname;
	private String birthd;
	private int grade;
	private int point;
	private String rid;

}
