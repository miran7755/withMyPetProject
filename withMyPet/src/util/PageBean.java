package util;

import java.util.ArrayList;
//JSP EL에서 ${requestScope.pb.startPage }사용가능
//pb타입인 PageBean클래스가 자바빈의 조건에 만족해야함

public class PageBean<T> {
	private ArrayList<T> list;
	private int startPage;
	private int endPage;
	private int totalPage;
	public PageBean() {
		super();
	}
	public PageBean(ArrayList<T> list, int startPage, int endPage, int totalPage) {
		super();
		this.list = list;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
	}
	/**
	 * @param list 목록
	 * @param totalCnt 총목록수
	 * @param currentPage 현재페이지
	 * @param cntPerPage 페이지별 보여줄 목록수
	 * @param cntPerPageGroup 페이지그룹목록수
	 */
	public PageBean(ArrayList<T> list, 
			        int totalCnt, 
			        int currentPage, 
			        int cntPerPage, 
			        int cntPerPageGroup){
		this.list = list;
		this.totalPage = (int)Math.ceil((double)totalCnt /cntPerPage); //총페이지수 계산
		this.startPage = util.PageUtil.getStartPage(currentPage, cntPerPageGroup);
		this.endPage = util.PageUtil.getEndPage(currentPage, cntPerPageGroup);
	}
	public ArrayList<T> getList() {
		return list;
	}
	public void setList(ArrayList<T> list) {
		this.list = list;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	@Override
	public String toString() {
		return "PageBean [list=" + list + "]";
	}
	
	
}