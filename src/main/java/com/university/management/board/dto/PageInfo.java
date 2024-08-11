package com.university.management.board.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PageInfo {

	private int currentPage; // 현재 페이지
	private int pageLimit; // 한 페이지에 보여질 하단의 페이지 수
	private int listCount; // 총 게시글의 수
	private int listLimit = 5; // 한 페이지에 보여질 게시글 수

	private int firstRow;		 // 게시글 첫번째 행
	private int lastRow; 		// 게시글 마지막 행
	private int totalPageCount; // 총 페이지 건수
	private int firstPage; // 페이지 리스트에서 첫 페이지
	private int lastPage; // 페이지 리스트에서 마지막 페이지


	public PageInfo(int currentPage, int listCount, int listLimit) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.listLimit = listLimit;
	}

	public void pageSetting(int totalRowCount) {
		System.out.println("[pageSetting] 실행");

		totalPageCount = (int) Math.ceil((double) totalRowCount / listLimit);
		System.out.println("totalPageCount : " + totalPageCount);

		firstRow = (currentPage - 1) * listLimit;
		lastRow = Math.min(totalRowCount, currentPage * listLimit);
		
		pageLimit = totalRowCount;

		firstPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		System.out.println("firstPage : " + firstPage);

		lastPage = firstPage + pageLimit - 1;
		System.out.println("lastPage1 : " + lastPage);
		if (lastPage > totalPageCount) {
			lastPage = totalPageCount;
			System.out.println("lastPage2 : " + lastPage);
		}

		System.out.println("lastPage3 : " + lastPage);

	}

	// 전체 페이지 중 가장 마지막 페이지
	public int getMaxPage() {
		return (int) Math.ceil((double) this.listCount / this.listLimit);
	}

	// 이전 페이지로 이동
	public int getPrevPage() {
		int prevPage = this.currentPage - 1;
		return prevPage < 1 ? 1 : prevPage;
	}

	// 다음 페이지로 이동 public
	public int getNextPage() {
		int nextPage = this.currentPage + 1;
		return nextPage > getMaxPage() ? getMaxPage() : nextPage;
	}

	// 페이징 중 가장 첫번째 페이지로 이동
	public int getStartPage() {
		// this.pageLimit : 한 페이지 그룹당 페이지 수를 나타냄.
		int page = (((this.currentPage - 1) / this.pageLimit) * this.pageLimit) + 1;
		System.out.println("currentPage : " + currentPage);
		System.out.println("getStartPage : " + page);
		return page;
	}

	// 페이징 중 가장 마지막으로 이동하는 페이지 함수
//	public int getLastPage() { 
//	int endPage = getStartPage() + this.pageLimit - 1; 
//	System.out.println("endPage : " + endPage); 
//	return endPage > getMaxPage() ? getMaxPage() : endPage; 
//	}

	// 현재 페이지에 대한 OFFSET 계산
	public int getOffset() {
		return (this.currentPage - 1) * this.listLimit;
	}

}
