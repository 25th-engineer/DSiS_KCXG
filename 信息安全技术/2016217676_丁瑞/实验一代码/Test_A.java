package net_secutriy;
import java.util.Map;

public class Test_A {
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
     * 获取本对象的公钥
     * @return
     * @throws Exception
     */
    public static String APublicKey() throws Exception {
        return map.get("publicKey"); 
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
