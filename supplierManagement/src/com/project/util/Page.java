package com.project.util;

import java.util.ArrayList;
import java.util.List;


public class Page {
	private int size = Constant.PAGE_COUNT;//每页显示记录数
	private int index = 1;// 当前页号
	private int totalPageCount = 1;// 总页数
	private int totalCount = 0;// 记录总数
	private int[] numbers;//展示页数集合
	protected List<Object> list;//要显示到页面的数据集合
	private List<Integer> prevPages;
	private List<Integer> nextPages;

	/**
	 * 得到开始记录数
	 * @return
	 */
	public int getStartRow() {
		return (index - 1) * size;
	}

	/**
	 * 得到结束记录数
	 * @return
	 */
	public int getEndRow() {
		return index * size;
	}

	/**
	 * @return Returns the size.
	 */
	public int getSize() {
		if(this.size==0){
			this.size = Constant.PAGE_COUNT;
		}
		return size;
	}

	/**
	 * @param size
	 * The size to set.
	 */
	public void setSize(int size) {
		if (size > 0) {
			this.size = size;
		}
	}
	/**
	 * @return Returns the currentPageNo.
	 */
	public int getIndex() {
		if (totalPageCount == 0) {
			return 0;
		}
		return index;
	}

	/**
	 * @param currentPageNo
	 * The currentPageNo to set.
	 */
	public void setIndex(int index) {
		if (index > 0) {
			this.index = index;
		}
	}

	/**
	 * @return Returns the totalCount.
	 */
	public int getTotalCount() {
		return totalCount;
	}

	/**
	 * @param totalCount
	 *  The totalCount to set.
	 */
	public void setTotalCount(int totalCount) {
		if (totalCount >= 0) {
			this.totalCount = totalCount;
			setTotalPageCountByRs();//根据总记录数计算总页数
		}
	}

	
	public int getTotalPageCount() {
		return this.totalPageCount;
	}

	/**
	 * 根据总记录数计算总页数
	 */
	private void setTotalPageCountByRs() {
		if (this.size > 0 && this.totalCount > 0 && this.totalCount % this.size == 0) {
			this.totalPageCount = this.totalCount / this.size;
		} else if (this.size > 0 && this.totalCount > 0 && this.totalCount % this.size > 0) {
			this.totalPageCount = (this.totalCount / this.size) + 1;
		} else {
			this.totalPageCount = 0;
		}
		setNumbers(totalPageCount);//获取展示页数集合
	}

	public int[] getNumbers() {
		return numbers;
	}
	
	/**
	 * 设置显示页数集合
	 * @param totalPageCount
	 */
	public void setNumbers(int totalPageCount) {
		if(totalPageCount>0){
			int[] numbers = new int[totalPageCount>10?10:totalPageCount];//页面要显示的页数集合
			int k =0;
			for(int i = 0;i < totalPageCount;i++){
				//保证当前页为集合的中间
				if((i>=index- (numbers.length/2+1) || i >= totalPageCount-numbers.length) && k<numbers.length){
					numbers[k] = i+1;
					k++;
				}else if(k>=numbers.length){
					break;
				}
				
			}
			
			this.numbers = numbers;
		}
		
	}
	
	public void setNumbers(int[] numbers) {
		this.numbers = numbers;
	}

	public List<Object> getList() {
		return list;
	}

	public void setList(List<Object> list) {
		this.list = list;
	}
	
	public void setPageNo(){
		this.prevPages = new ArrayList<Integer>();
		this.nextPages = new ArrayList<Integer>();
		
		for(int i=index;i<this.totalPageCount && i<=index+3;i++){
				nextPages.add(i+1);
		}
		for(int i=index;i>1 && i>=index-3;i--){
				prevPages.add(0, i-1);
		}
		if(index==1){
			this.prevPages=null;
		}
		if(index==totalPageCount){
			this.nextPages=null;
		}
		
	}

	public List<Integer> getPrevPages() {
		return prevPages;
	}

	public void setPrevPages(List<Integer> prevPages) {
		this.prevPages = prevPages;
	}

	public List<Integer> getNextPages() {
		return nextPages;
	}

	public void setNextPages(List<Integer> nextPages) {
		this.nextPages = nextPages;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}


/*
	public static int getTotalPageCount(int iTotalRecordCount, int iPageSize) {
		if (iPageSize == 0) {
			return 0;
		} else {
			return (iTotalRecordCount % iPageSize) == 0 ? (iTotalRecordCount / iPageSize) : (iTotalRecordCount / iPageSize) + 1;
		}
	}*/
}
