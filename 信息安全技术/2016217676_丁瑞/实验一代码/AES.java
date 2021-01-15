package net_secutriy;

import java.io.UnsupportedEncodingException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class AES {

	public static void main(String[] args) throws UnsupportedEncodingException {
		// TODO Auto-generated method stub
		String string = "guosujietest12341234";
		String key = "1234123412341234";
		byte[] result = encrypt(string.getBytes("UTF-8"), key.getBytes("UTF-8"));
		System.out.println("加密:"+bytes_String16(result));
		byte[] dresult = decrypt(result, key.getBytes("UTF-8"));
		System.out.println("解密:");
		for (int i = 0; i < dresult.length; i++) {
			System.out.print((char) dresult[i]);
		}
	}
	
	public static void  print_bytes(byte[] b){
		System.out.print("\n iv \n");
		for (int i=0;i<16;i++){
			System.out.print(b[i]);
		}
		System.out.print("\n");
	}

	public static String bytes_String16(byte[] b) {
		char[] _16 = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < b.length; i++) {
			sb.append(_16[b[i] >> 4 & 0xf]).append(_16[b[i] & 0xf]);
		}
		return sb.toString();
	}

	public static byte[] encrypt(byte[] data, byte[] key) {
		if (key.length != 16) {
			throw new RuntimeException("Invalid AES key length (must be 16 bytes)");
		}
		try {
			SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
			byte[] enCodeFormat = secretKey.getEncoded();
			SecretKeySpec seckey = new SecretKeySpec(enCodeFormat, "AES");
			// 创建密码器
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			byte[] iv = new byte[cipher.getBlockSize()];
			
			SecureRandom secureRandom = new SecureRandom();
			secureRandom.setSeed(key);
			secureRandom.nextBytes(iv);
			IvParameterSpec niv = new IvParameterSpec(iv);
			cipher.init(Cipher.ENCRYPT_MODE, seckey, niv);// 初始化
			print_bytes(iv);
			byte[] result = cipher.doFinal(data);
			return result; // 加密
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("encrypt fail!", e);
		}
	}

	public static byte[] decrypt(byte[] data, byte[] key) {
		if (key.length != 16) {
			throw new RuntimeException("Invalid AES key length (must be 16 bytes)");
		}
		try {
			SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
			byte[] enCodeFormat = secretKey.getEncoded();
			SecretKeySpec seckey = new SecretKeySpec(enCodeFormat, "AES");
			// 创建密码器
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			byte[] iv = new byte[cipher.getBlockSize()];
			
			SecureRandom secureRandom = new SecureRandom();
			secureRandom.setSeed(key);
			secureRandom.nextBytes(iv);
			IvParameterSpec niv = new IvParameterSpec(iv);
			cipher.init(Cipher.DECRYPT_MODE, seckey, niv);// 初始化
			print_bytes(iv);
			byte[] result = cipher.doFinal(data);
			return result; // 解密
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("decrypt fail!", e);
		}
	}

	public static byte[] genarateRandomKey() {
		KeyGenerator keygen = null;
		try {
			keygen = KeyGenerator.getInstance("AES/CBC/PKCS5Padding");
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(" genarateRandomKey fail!", e);
		}
		SecureRandom random = new SecureRandom();
		keygen.init(random);
		Key key = keygen.generateKey();
		return key.getEncoded();
	}
}
