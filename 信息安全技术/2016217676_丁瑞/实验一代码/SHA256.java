package net_secutriy;

public class SHA256 {
	public static void main(String[] args) throws Exception {
		 SHA_Test_A obj_A = new SHA_Test_A();
		 SHA_Test_A obj_B = new SHA_Test_A();
		 String data_A2B="hello，B";
		 String en_result=obj_A.AEncrypt(data_A2B,obj_B.APublicKey() );//A用B的公钥加密信息
		 String info_A=obj_A.Create_Info(data_A2B);//A生成数字签名
		 String qianming=obj_A.AEncrypt(info_A,obj_A.APrivateKey() );//A用B的公钥加密信息
		 System.out.println("A向B说："+data_A2B);
		 System.out.println("A向B发送密文："+en_result);
		 System.out.println("A生成的信息摘要："+info_A);
		 System.out.println("A发送的数字签名："+qianming);
		 String de_result=obj_B.ADecrypt(en_result);
		 System.out.println("B解密的结果："+de_result);
		 String en=obj_B.ADecrypt(qianming );
		 System.out.println("B解密后内容生成的信息摘要："+en);
		 System.out.println("B解密数字签名得到的信息摘要："+en);
	}
}
