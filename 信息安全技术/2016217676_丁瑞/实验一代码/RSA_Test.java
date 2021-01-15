package net_secutriy;

import java.util.Map;

public class RSA_Test {
	
	public static void main(String[] args) {
		try {
			 Test_A obj_A=new Test_A();
			 
			 Test_A obj_B=new Test_A();
			 String data_A2B="hello，B";
			 String en_result=obj_A.AEncrypt(data_A2B,obj_B.APublicKey() );
			 System.out.println("A向B说："+data_A2B);
			 System.out.println("A向B发送密文："+en_result);
			 String de_result=obj_B.ADecrypt(en_result);
			 System.out.println("B解密的结果："+de_result);
			
			 String data_B2A="I Know";
			 en_result=obj_B.AEncrypt(data_B2A,obj_A.APublicKey() );
			 System.out.println("B向A说："+data_B2A);
			 System.out.println("B向A发送密文："+en_result);
			 de_result=obj_A.ADecrypt(en_result);
			 System.out.println("A解密的结果："+de_result);
			 
			 } 
		catch (Exception e) { 
			 // TODO Auto-generated catch block 
			 e.printStackTrace(); 
			 } 
	}
	
	
}
