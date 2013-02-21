package jl.info.domain;

public class Message {
	private String messageid;
	private String itemid;
	private String title;
	private String content;
	private String author;
	private String infodate;
	
	public String getMessageid() {
		return messageid;
	}
	public void setMessageid(String messageid) {
		this.messageid = messageid;
	}
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getInfodate() {
		return infodate;
	}
	public void setInfodate(String infodate) {
		this.infodate = infodate;
	}
	
}
