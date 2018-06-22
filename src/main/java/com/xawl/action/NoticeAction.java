package com.xawl.action;

import com.opensymphony.xwork2.ActionSupport;
import com.xawl.model.Notice;
import com.xawl.service.NoticeService;
import com.xawl.util.PageInfo;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by zb on 2018/4/11.
 */
@Controller
public class NoticeAction extends ActionSupport{

    private String url = "./";

    private Notice notice;

    private void setUrl(String url) {
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public Notice getNotice() {
        return notice;
    }

    public void setNotice(Notice notice) {
        this.notice = notice;
    }

    @Autowired
    private NoticeService noticeService;

    /**
     * 查询通知，分页
     * @return
     */
    public String all(){
        HttpServletRequest request = ServletActionContext.getRequest();

        String pageStr = request.getParameter("page");
        String pageSizeStr = request.getParameter("pageSize");
        if (pageStr == null){
            pageStr = "1";
        }
        if (pageSizeStr == null){
            pageSizeStr = "10";
        }

        Integer page = Integer.valueOf(pageStr);
        Integer pageSize = Integer.valueOf(pageSizeStr);


        PageInfo<Notice> pageInfo = this.noticeService.findPageAll(page, pageSize);

        request.setAttribute("pageInfo", pageInfo);
        this.setUrl("/admin/noticeList.jsp");
        return this.SUCCESS;
    }

    /**
     * 添加通知
     * @return
     */
    public String add(){
        Integer row = this.noticeService.insertNotice(notice);
        if (row == 1) {
            this.setUrl("/Notice/all");
            return "redirect";
        }else{
            return this.ERROR;
        }
    }

    /**
     * 去修改页面
     * @return
     */
    public String updatePage(){
        HttpServletRequest request = ServletActionContext.getRequest();
        List<Notice> list = this.noticeService.findOneNotice(notice);
        if (list == null){
            return this.ERROR;
        }else{
            Notice notice = list.get(0);
            //System.out.println(line);
            request.setAttribute("notice", notice);
            this.setUrl("/admin/noticeUpdate.jsp");
            return this.SUCCESS;
        }
    }

    /**
     * 修改通知
     * @return
     */
    public String update(){

        Integer row = this.noticeService.updateNotice(notice);
        if (row == 1) {
            this.setUrl("/Notice/all");
            return "redirect";
        }else{
            return this.ERROR;
        }
    }

    /**
     * 删除通知
     * @return
     */
    public String del(){
        Integer row = this.noticeService.deleteNotice(notice);
        if (row == 1) {
            this.setUrl("/Notice/all");
            return "redirect";
        }else{
            return this.ERROR;
        }
    }

    /**
     * 返回到通知页面
     * @return
     */
    public String findoToNotice(){
        HttpServletRequest request = ServletActionContext.getRequest();
        List<Notice> noticeList = this.noticeService.findoToNotice();

        request.getSession().setAttribute("noticeList", noticeList);
        this.setUrl("/front/other/notice.jsp");
        return "redirect";
    }
}
