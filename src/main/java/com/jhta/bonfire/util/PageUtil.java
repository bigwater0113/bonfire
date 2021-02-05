package com.jhta.bonfire.util;

public class PageUtil {
    private int page; //���� ������ ��ȣ
    private int listSize; //�� �������� ������ �� ����
    private int pageSize; //�� �������� ������ ������ ����
    private int listCount; //��ü �� ����
    private int pageCount; //��ü ������ ����
    private int startRow; //���� �� ��ȣ
    private int endRow; //�� �� ��ȣ
    private int startPage; //���� ������ ��ȣ
    private int endPage; //�� ������ ��ȣ

    public PageUtil(){}

    /**
     * 
     * @param page ��������ȣ
     * @param listSize �� �������� ������ �� ����
     * @param pageSize �� �������� ������ ������ ����
     * @param listCount ��ü ���� ����
     */
    public PageUtil(int page, int listSize, int pageSize, int listCount) {
        this.page=page;
        this.listSize=listSize;
        this.pageSize=pageSize;
        this.listCount=listCount;
        this.pageCount = listCount/listSize;
        if (listCount%listSize!=0) pageCount++;
        this.endRow=page*listSize;
        this.startRow=endRow-listSize+1;
        this.startPage=((page-1)/pageSize)*pageSize+1;
        this.endPage = startPage+pageSize-1;
        if (endPage>pageCount) endPage=pageCount;
    }

    public int getPage() {
        return this.page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getListSize() {
        return this.listSize;
    }

    public void setListSize(int listSize) {
        this.listSize = listSize;
    }

    public int getPageSize() {
        return this.pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getListCount() {
        return this.listCount;
    }

    public void setListCount(int listCount) {
        this.listCount = listCount;
    }

    public int getPageCount() {
        return this.pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getStartRow() {
        return this.startRow;
    }

    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    public int getEndRow() {
        return this.endRow;
    }

    public void setEndRow(int endRow) {
        this.endRow = endRow;
    }

    public int getStartPage() {
        return this.startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return this.endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    @Override
    public String toString() {
        return "{" +
            " page='" + getPage() + "'" +
            ", listSize='" + getListSize() + "'" +
            ", pageSize='" + getPageSize() + "'" +
            ", listCount='" + getListCount() + "'" +
            ", pageCount='" + getPageCount() + "'" +
            ", startRow='" + getStartRow() + "'" +
            ", endRow='" + getEndRow() + "'" +
            ", startPage='" + getStartPage() + "'" +
            ", endPage='" + getEndPage() + "'" +
            "}";
    }
    
}
