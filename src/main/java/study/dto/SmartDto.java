package study.dto;

import java.sql.Timestamp;

public class SmartDto {
	private int num;
	private int likes;
	private int readcount;
	private String writer;
	private String subject;
	private String content;
	private Timestamp writeday;

	public SmartDto() {
		super();
	}
	
	public SmartDto(int num, int likes, int readcount, String writer, String subject, String content,
			Timestamp writeday) {
		super();
		this.num = num;
		this.likes = likes;
		this.readcount = readcount;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.writeday = writeday;
	}

	public int getNum() {
		return num;
	}
	
	public int getLikes() {
		return likes;
	}
	
	public int getReadcount() {
		return readcount;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public String getSubject() {
		return subject;
	}
	
	public String getContent() {
		return content;
	}
	
	public Timestamp getWriteday() {
		return writeday;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
}
