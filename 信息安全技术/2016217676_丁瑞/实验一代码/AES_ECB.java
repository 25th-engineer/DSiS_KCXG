package net_secutriy;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.security.MessageDigest;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;


public class AES_ECB {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String plaintext = "testtesttesttesttest1234";
		System.out.println("����:"+plaintext);
		String key = "1234123412341234";
		System.out.println("\nCBCģʽ:\n");
		String EncryptMode="CBC";
		String cipertext= AES_Encrypt(plaintext,key,EncryptMode);
		System.out.println("����:"+cipertext);
		String originalString=AES_Decrypt(cipertext,key,EncryptMode);
		System.out.println("����"+originalString);
		System.out.println("\nECBģʽ:\n");
		EncryptMode="ECB";
		cipertext= AES_Encrypt(plaintext,key,EncryptMode);
		System.out.println("����:"+cipertext);
		originalString=AES_Decrypt(cipertext,key,EncryptMode);
		System.out.println("����"+originalString);
		System.out.println("\nCFBģʽ:\n");
		EncryptMode="CFB";
		cipertext= AES_Encrypt(plaintext,key,EncryptMode);
		System.out.println("����:"+cipertext);
		originalString=AES_Decrypt(cipertext,key,EncryptMode);
		System.out.println("����"+originalString);
	}
	
    /**
     * AES����
     *
     * @param plaintext ����
     * @param Key ��Կ
     * @param EncryptMode AES����ģʽ��CBC��ECB
     * @return ���ַ�����AES����ֵ
     */
    public static String AES_Encrypt(String plaintext, String Key,String EncryptMode) {
        String PlainText=null;
        try {
            PlainText=plaintext;
            if (Key == null) {
                return null;
            }
            Key = getMD5(Key);
            byte[] raw = Key.getBytes("utf-8");
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
            Cipher cipher = Cipher.getInstance("AES/"+EncryptMode+"/PKCS5Padding");
            if(EncryptMode=="ECB") {
                cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
            }else {
                IvParameterSpec iv = new IvParameterSpec(Key.getBytes("utf-8"));//ʹ��CBCģʽ����Ҫһ������iv�������Ӽ����㷨��ǿ��
                cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);
            }
            byte[] encrypted = cipher.doFinal(PlainText.getBytes("utf-8"));
            String encryptedStr=new String(new BASE64Encoder().encode(encrypted));
            return encryptedStr;
            //return new String(encrypted);//�˴�ʹ��BASE64��ת�빦�ܣ�ͬʱ����2�μ��ܵ����á�
        } catch (Exception ex) {
            System.out.println(ex.toString());
            return null;
        }
    }
 
    /**
     * AES����
     *
     * @param cipertext ����
     * @param Key ��Կ
     * @param EncryptMode AES����ģʽ��CBC��ECB
     * @return �����ĵ�����
     */
    public static String AES_Decrypt(String cipertext, String Key,String EncryptMode) {
        String CipherText=null;
        try {
            CipherText=cipertext;
            // �ж�Key�Ƿ���ȷ
            if (Key == null) {
                //System.out.print("KeyΪ��null");
                return null;
            }
            Key=getMD5(Key);
            byte[] raw = Key.getBytes("utf-8");
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
            Cipher cipher=Cipher.getInstance("AES/"+EncryptMode+"/PKCS5Padding");
            if(EncryptMode=="ECB") {
                cipher.init(Cipher.DECRYPT_MODE, skeySpec);
            }
            else
            {
                IvParameterSpec iv = new IvParameterSpec(Key.getBytes("utf-8"));//ʹ��CBCģʽ����Ҫһ������iv�������Ӽ����㷨��ǿ��
                cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
            }
            byte[] encrypted1 = new BASE64Decoder().decodeBuffer(CipherText);//����base64����
            //byte[] encrypted1 = CipherText.getBytes();
            try {
                byte[] original = cipher.doFinal(encrypted1);
                String originalString = new String(original,"utf-8");
                return originalString;
            } catch (Exception e) {
                System.out.println(e.toString());
                return null;
            }
        } catch (Exception ex) {
            System.out.println(ex.toString());
            return null;
        }
    }
    /**
     * ����MD5����
     *
     * @param s Ҫ����MD5ת�����ַ���
     * @return ���ַ�����MD5ֵ��8-24λ
     */
    public static String getMD5(String s){
        char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
 
        try {
            byte[] btInput = s.getBytes();
            // ���MD5ժҪ�㷨�� MessageDigest ����
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // ʹ��ָ�����ֽڸ���ժҪ
            mdInst.update(btInput);
            // �������
            byte[] md = mdInst.digest();
            // ������ת����ʮ�����Ƶ��ַ�����ʽ
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str).substring(8,24);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}