package net_secutriy;

public class SHA256 {
	public static void main(String[] args) throws Exception {
		 SHA_Test_A obj_A = new SHA_Test_A();
		 SHA_Test_A obj_B = new SHA_Test_A();
		 String data_A2B="hello��B";
		 String en_result=obj_A.AEncrypt(data_A2B,obj_B.APublicKey() );//A��B�Ĺ�Կ������Ϣ
		 String info_A=obj_A.Create_Info(data_A2B);//A��������ǩ��
		 String qianming=obj_A.AEncrypt(info_A,obj_A.APrivateKey() );//A��B�Ĺ�Կ������Ϣ
		 System.out.println("A��B˵��"+data_A2B);
		 System.out.println("A��B�������ģ�"+en_result);
		 System.out.println("A���ɵ���ϢժҪ��"+info_A);
		 System.out.println("A���͵�����ǩ����"+qianming);
		 String de_result=obj_B.ADecrypt(en_result);
		 System.out.println("B���ܵĽ����"+de_result);
		 String en=obj_B.ADecrypt(qianming );
		 System.out.println("B���ܺ��������ɵ���ϢժҪ��"+en);
		 System.out.println("B��������ǩ���õ�����ϢժҪ��"+en);
	}
}
