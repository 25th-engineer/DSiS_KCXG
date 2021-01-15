package net_secutriy;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class AES_Image {

	public static void main(String[] args) throws Exception  {
		File file = new File("test.png"); 
		 BufferedImage bi = null; 
		 try { 
		 bi = ImageIO.read(file); 
		 } catch (IOException e) { 
		 e.printStackTrace(); 
		 } 
	}
}
