package kr.co.one;

public class BoardVO {    //Alt + s + r
	private String brd_no;
	private String brd_title;
	private String brd_writer;
	private String brd_contents;
	private String brd_write_date;
	private String brd_view_cnt;
	private String brd_like_cnt;
	public String getBrd_no() {
		return brd_no;
	}
	public void setBrd_no(String brd_no) {
		this.brd_no = brd_no;
	}
	public String getBrd_title() {
		return brd_title;
	}
	public void setBrd_title(String brd_title) {
		this.brd_title = brd_title;
	}
	public String getBrd_writer() {
		return brd_writer;
	}
	public void setBrd_writer(String brd_writer) {
		this.brd_writer = brd_writer;
	}
	public String getBrd_contents() {
		return brd_contents;
	}
	public void setBrd_contents(String brd_contents) {
		this.brd_contents = brd_contents;
	}
	public String getBrd_write_date() {
		return brd_write_date;
	}
	public void setBrd_write_date(String brd_write_date) {
		this.brd_write_date = brd_write_date;
	}
	public String getBrd_view_cnt() {
		return brd_view_cnt;
	}
	public void setBrd_view_cnt(String brd_view_cnt) {
		this.brd_view_cnt = brd_view_cnt;
	}
	public String getBrd_like_cnt() {
		return brd_like_cnt;
	}
	public void setBrd_like_cnt(String brd_like_cnt) {
		this.brd_like_cnt = brd_like_cnt;
	}
}