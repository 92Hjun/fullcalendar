package kr.co.fribel.vo;

import java.util.Date;

public class Event {
	
	private int id;
	private String title;
	private Date start;
	private Date end;
	private String description;
	private Member member;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", title=" + title + ", start=" + start + ", end=" + end + ", description="
				+ description + ", member=" + member + "]";
	}
}
