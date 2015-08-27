package service;

import java.util.Scanner;

import javax.xml.ws.ServiceMode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.Member;
import dao.MemberDAO;

@Service
public class LoginService {
	@Autowired
	private MemberDAO dao;
	
	public void login(String email, String password) throws Exception
	{
		System.out.println("*****");
		Member m = dao.selectByEmail(email);
		System.out.println("service : " + m);
		if( m ==null || !m.getPassword().equals(password)){
			throw new Exception("로그인 실패");			
		}else{
			System.out.println("로그인 성공");
		}
	}		

}

