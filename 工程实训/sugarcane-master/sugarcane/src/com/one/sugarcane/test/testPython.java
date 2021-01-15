package com.one.sugarcane.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.one.sugarcane.stringUtil.*;

/**
 * java程序里调用python以及python的第三方模块
 * 
 * @author 秦晓宇
 * @time 2018.5.3
 */
public class testPython {
	public List<String[]> recommend() {
		String[] args1 = new String[] { "python", "E:\\gitRepository\\sugarcane\\sugarcane\\src\\com\\one\\sugarcane\\test\\k-means\\recommend.py" };
		ProcessBuilder builder = new ProcessBuilder();
		builder.command(args1);
		Process process;
		List<String[]> list = new ArrayList<String[]>();
		try {
			process = builder.start();
			process.waitFor();
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
			Iterator<String> a = bufferedReader.lines().iterator();
			while (a.hasNext()) {
				Convert b = new Convert(a.next());
				String c[] = b.function(); 
				list.add(c);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
