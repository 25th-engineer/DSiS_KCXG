package com.one.sugarcane.entity;

public class Searcher {

	private String title;
	private String brief;
	private String noHighLighteTitle;
	private String id;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;  
	}
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {      
		this.brief = brief;  
	}
	public String getNoHighLighteTitle() {
		return noHighLighteTitle;
	}
	public void setNoHighLighteTitle(String noHighLighteTitle) {
		this.noHighLighteTitle = noHighLighteTitle;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Searcher() {
		
	}
	@Override
	public String toString() {
		return "Searcher [title=" + title + ", brief=" + brief + ", noHighLighteTitle=" + noHighLighteTitle + ", id="
				+ id + "]";
	}
	
}
