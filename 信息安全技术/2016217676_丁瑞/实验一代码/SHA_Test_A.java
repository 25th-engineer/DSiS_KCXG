package net_secutriy;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

public class SHA_Test_A {
    private static Map<String, String> map;

    static {
        try {
            map = RSA.generateKeyPair();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    

    /**
     * ʹ�öԷ���Կ���м���
     * @param data
     * @return
     * @throws Exception
     */
    public static String AEncrypt(String data,String pub) throws Exception {
        return RSA.encrypt(data, pub);
    }
    
    /**
     * ������ϢժҪ
     * @param data
     * @return
     * @throws NoSuchAlgorithmException 
     * @throws UnsupportedEncodingException 
     * @throws Exception
     */
    public static String Create_Info(String data) throws NoSuchAlgorithmException, UnsupportedEncodingException{
    	MessageDigest messageDigest=MessageDigest.getInstance("SHA-256"); 
		 messageDigest.update(data.getBytes("UTF-8")); 
		 String info=new String(Base64.encode(messageDigest.digest())); 
		 return info;
    }
    
    /**
     * ˽Կ����ϢժҪ���м��� ��������ǩ��
     * @param data
     * @return
     * @throws Exception
     */
    public static String Create_Signature(String info,String pri) throws Exception{
    	return RSA.encrypt(info, pri);
    }
    
    

    /**
     * ��ȡ������Ĺ�Կ
     * @return
     * @throws Exception
     */
    public static String APublicKey() throws Exception {
        return map.get("publicKey"); 
    }
    
    /**
     * ��ȡ�������˽Կ
     * @return
     * @throws Exception
     */
    public static String APrivateKey() throws Exception {
        return map.get("privateKey"); 
    }
    

    /**
     * ʹ������˽Կ���н���
     * @param en_result
     * @return
     * @throws Exception
     */
    public static String ADecrypt(String en_result) throws Exception {
        String pri = map.get("privateKey");
        return RSA.decrypt(en_result, pri);
    }

}
