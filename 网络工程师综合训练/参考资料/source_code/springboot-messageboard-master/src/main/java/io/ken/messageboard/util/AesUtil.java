package io.ken.messageboard.util;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.*;
import java.util.Base64;

public class AesUtil {

    private static byte[] iv = "0123456789123456".getBytes();
    private static String password = "ken...0123456789";

    // 加密
    public static String encrypt(String value, String key) throws Exception {
        if (key == null) {
            System.out.print("Key为空null");
            return null;
        }
        // 判断Key是否为16位
        if (key.length() != 16) {
            System.out.print("Key长度不是16位");
            return null;
        }
        byte[] raw = key.getBytes();
        IvParameterSpec ivspec = new IvParameterSpec(iv);
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");//"算法/模式/补码方式"
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec, ivspec);
        byte[] encrypted = cipher.doFinal(value.getBytes("UTF-8"));

        return new String(Base64.getEncoder().encode(encrypted));//此处使用BASE64做转码功能，同时能起到2次加密的作用。
    }

    // 解密
    public static String decrypt(String value, String key) throws Exception {
        try {
            // 判断Key是否正确
            if (key == null) {
                System.out.print("Key为空null");
                return null;
            }
            // 判断Key是否为16位
            if (key.length() != 16) {
                System.out.print("Key长度不是16位");
                return null;
            }
            byte[] raw = key.getBytes();
            IvParameterSpec ivspec = new IvParameterSpec(iv);
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, skeySpec, ivspec);
            byte[] encrypted1 = Base64.getDecoder().decode(value);//先用base64解密
            try {
                byte[] original = cipher.doFinal(encrypted1);
                String originalString = new String(original, "UTF-8");
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

    public static String encrypt(String value) throws Exception {
        return encrypt(value, password);
    }

    public static String decrypt(String value) throws Exception {
        return decrypt(value, password);
    }

    public static void write(String filename, String data) throws IOException {
        File fout = new File(filename);
        BufferedWriter _bufferedWriter = new BufferedWriter(new FileWriter(fout));
        _bufferedWriter.write(data);
        _bufferedWriter.flush();
        _bufferedWriter.close();
        System.out.println("加密后的字串是保存在：" + fout.getAbsolutePath());
    }

    public static String read(String filename) throws IOException {
        BufferedReader _bufferedReader = new BufferedReader(new FileReader(filename));
        StringBuffer buffer = new StringBuffer();
        String _data = "";
        while ((_data = _bufferedReader.readLine()) != null) {
            buffer.append(_data);
        }
        _bufferedReader.close();
        return buffer.toString();
    }

}

