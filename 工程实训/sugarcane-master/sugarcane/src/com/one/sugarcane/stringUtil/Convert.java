package com.one.sugarcane.stringUtil;

import java.util.ArrayList;
import java.util.List;

public class Convert {

	private String a;

	public Convert(String a) {
		super();
		this.a = a;
	}

	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
	}

	public String[] function() {
		String s = this.a;
		List<String> ss = new ArrayList<String>();
		for (String sss : s.replaceAll("[^0-9]", ",").split(",")) {
			if (sss.length() > 0)
				ss.add(sss);
		}
		String d[] = (String[])ss.toArray(new String[ss.size()]);
		return d;
	}
}
