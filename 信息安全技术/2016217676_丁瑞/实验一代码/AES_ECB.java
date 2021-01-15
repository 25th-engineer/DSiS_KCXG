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
		System.out.println("明文:"+plaintext);
		String key = "1234123412341234";
		System.out.println("\nCBC模式:\n");
		String EncryptMode="CBC";
		String cipertext= AES_Encrypt(plaintext,key,EncryptMode);
		System.out.println("加密:"+cipertext);
		String originalString=AES_Decrypt(cipertext,key,EncryptMode);
		System.out.println("解密"+originalString);
		System.out.println("\nECB模式:\n");
		EncryptMode="ECB";
		cipertext= AES_Encrypt(plaintext,key,EncryptMode);
		System.out.println("加密:"+cipertext);
		originalString=AES_Decrypt(cipertext,key,EncryptMode);
		System.out.println("解密"+originalString);
		System.out.println("\nCFB模式:\n");
		EncryptMode="CFB";
		cipertext= AES_Encrypt(plaintext,key,EncryptMode);
		System.out.println("加密:"+cipertext);
		originalString=AES_Decrypt(cipertext,key,EncryptMode);
		System.out.println("解密"+originalString);
	}
	
    /**
     * AES加密
     *
     * @param plaintext 明文
     * @param Key 密钥
     * @param EncryptMode AES加密模式，CBC或ECB
     * @return 该字符串的AES密文值
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
                IvParameterSpec iv = new IvParameterSpec(Key.getBytes("utf-8"));//使用CBC模式，需要一个向量iv，可增加加密算法的强度
                cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);
            }
            byte[] encrypted = cipher.doFinal(PlainText.getBytes("utf-8"));
            String encryptedStr=new String(new BASE64Encoder().encode(encrypted));
            return encryptedStr;
            //return new String(encrypted);//此处使用BASE64做转码功能，同时能起到2次加密的作用。
        } catch (Exception ex) {
            System.out.println(ex.toString());
            return null;
        }
    }
 
    /**
     * AES解密
     *
     * @param cipertext 密文
     * @param Key 密钥
     * @param EncryptMode AES加密模式，CBC或ECB
     * @return 该密文的明文
     */
    public static String AES_Decrypt(String cipertext, String Key,String EncryptMode) {
        String CipherText=null;
        try {
            CipherText=cipertext;
            // 判断Key是否正确
            if (Key == null) {
                //System.out.print("Key为空null");
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
                IvParameterSpec iv = new IvParameterSpec(Key.getBytes("utf-8"));//使用CBC模式，需要一个向量iv，可增加加密算法的强度
                cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
            }
            byte[] encrypted1 = new BASE64Decoder().decodeBuffer(CipherText);//先用base64解密
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
     * 进行MD5加密
     *
     * @param s 要进行MD5转换的字符串
     * @return 该字符串的MD5值的8-24位
     */
    public static String getMD5(String s){
        char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
 
        try {
            byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
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