package kr.or.zipcoock.mypage.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class QnaPage {
	private int qnaNo;
	private int qnaRefNo;
	private int qnaLevel;
	private String qnaTitle;
	private String qnaContent;
	private String writeDate;
	private String aQnaWriter;
	private String aQnaTitle;
	private String aQnaContent;
	private String aWriteDate;
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public int getQnaRefNo() {
		return qnaRefNo;
	}
	public void setQnaRefNo(int qnaRefNo) {
		this.qnaRefNo = qnaRefNo;
	}
	public int getQnaLevel() {
		return qnaLevel;
	}
	public void setQnaLevel(int qnaLevel) {
		this.qnaLevel = qnaLevel;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getaQnaWriter() {
		return aQnaWriter;
	}
	public void setaQnaWriter(String aQnaWriter) {
		this.aQnaWriter = aQnaWriter;
	}
	public String getaQnaTitle() {
		return aQnaTitle;
	}
	public void setaQnaTitle(String aQnaTitle) {
		this.aQnaTitle = aQnaTitle;
	}
	public String getaQnaContent() {
		return aQnaContent;
	}
	public void setaQnaContent(String aQnaContent) {
		this.aQnaContent = aQnaContent;
	}
	public String getaWriteDate() {
		return aWriteDate;
	}
	public void setaWriteDate(String aWriteDate) {
		this.aWriteDate = aWriteDate;
	}
	
	
}
