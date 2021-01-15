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
     * 使用对方公钥进行加密
     * @param data
     * @return
     * @throws Exception
     */
    public static String AEncrypt(String data,String pub) throws Exception {
        return RSA.encrypt(data, pub);
    }
    
    /**
     * 生成信息摘要
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
     * 私钥对信息摘要进行加密 生成数字签名
     * @param data
     * @return
     * @throws Exception
     */
    public static String Create_Signature(String info,String pri) throws Exception{
    	return RSA.encrypt(info, pri);
    }
    
    

    /**
     * 获取本对象的公钥
     * @return
     * @throws Exception
     */
    public static String APublicKey() throws Exception {
        return map.get("publicKey"); 
    }
    
    /**
     * 获取本对象的私钥
     * @return
     * @throws Exception
     */
    public static String APrivateKey() throws Exception {
        return map.get("privateKey"); 
    }
    

    /**
     * 使用自身私钥进行解密
     * @param en_result
     * @return
     * @throws Exception
     */
    public static String ADecrypt(String en_result) throws Exception {
        String pri = map.get("privateKey");
        return RSA.decrypt(en_result, pri);
    }

}
