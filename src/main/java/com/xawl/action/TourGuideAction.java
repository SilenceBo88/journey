package com.xawl.action;

import com.opensymphony.xwork2.ActionSupport;
import com.xawl.model.TourGuide;
import com.xawl.service.TourGuideService;
import com.xawl.util.PageInfo;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by zb on 2018/4/7.
 */
@Controller
public class TourGuideAction extends ActionSupport {

    private String url = "./";

    private Map<String, Object> jsonResult;

    private TourGuide tourGuide;

    private void setUrl(String url) {
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public TourGuide getTourGuide() {
        return tourGuide;
    }

    public void setTourGuide(TourGuide tourGuide) {
        this.tourGuide = tourGuide;
    }

    public Map<String, Object> getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(Map<String, Object> jsonResult) {
        this.jsonResult = jsonResult;
    }

    @Autowired
    private TourGuideService tourGuideService;

    /**
     * 查询导游有分页
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


        PageInfo<TourGuide> pageInfo = this.tourGuideService.findPageAll(page, pageSize);

        request.setAttribute("pageInfo", pageInfo);
        this.setUrl("/admin/tourguideList.jsp");
        return this.SUCCESS;
    }

    /**
     * 是否通过审核
     * @return
     */
    public String updatePass(){
        System.out.println(tourGuide);
        Integer row = this.tourGuideService.updatePass(tourGuide);
        if (row == 1) {
            this.setUrl("/TourGuide/all");
            return "redirect";
        }else{
            return this.ERROR;
        }
    }

    public String register(){
        Map<String, Object> map = new HashMap<String, Object>();
        Integer row = this.tourGuideService.insertGuide(tourGuide);
        if (row == 1) {
            map.put("status", 200);
            map.put("message", "成功");
            jsonResult=map;
            return "success";
        }else{
            return this.ERROR;
        }
    }
}
