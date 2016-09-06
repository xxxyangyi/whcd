package com.hand.paging;

import java.util.List;

/**
 * Created by tuberose on 16-9-4.
 */
public class Pager {

    public Pager(int pageSize, int pageNo, int rowCount, List result) {
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.rowCount = rowCount;
        this.result = result;
    }

    private int pageSize;
    private int pageNo;
    private int rowCount;
    private List result;

    public int getPageSize() {
        return pageSize;
    }

    public int getRowCount() {
        return rowCount;
    }

    public int getPageNo() {
        return pageNo;
    }

    public List getResult() {
        return result;
    }

    @Override
    public String toString() {
        return "Pager{" +
                " （每页条数）pageSize=" + pageSize +
                ", （当前页）pageNo=" + pageNo +
                ", （数据行数）rowCount=" + rowCount +
                ", （结果集）result=" + result +
                '}';
    }
}
