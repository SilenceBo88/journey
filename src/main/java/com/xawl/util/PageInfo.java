package com.xawl.util;

import java.util.List;

/**
 * Created by zb on 2018/3/25.
 */
public class PageInfo<T> {

    private Integer pageSize;//每页数据数

    private Integer count;//总记录数

    private List<T> pageList;//当前页记录的集合

    private Integer pageIndex;//当前页号

    private Integer totalPage;//总页数

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public List<T> getPageList() {
        return pageList;
    }

    public void setPageList(List<T> pageList) {
        this.pageList = pageList;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getTotalPage() {
        this.totalPage = this.count / this.pageSize;
        if (this.count % this.pageSize != 0){
            this.totalPage++;
        }
        return this.totalPage;
    }

    @Override
    public String toString() {
        return "PageInfo{" +
                "pageSize=" + pageSize +
                ", count=" + count +
                ", pageList=" + pageList +
                ", pageIndex=" + pageIndex +
                ", totalPage=" + totalPage +
                '}';
    }
}
