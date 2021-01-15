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
     * ʹ�öԷ���Կ���м���
     * @param data
     * @return
     * @throws Exception
     */
    public static String AEncrypt(String data,String pub) throws Exception {
        return RSA.encrypt(data, pub);
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
