package com.xawl.action;

import com.opensymphony.xwork2.ActionSupport;
import com.xawl.model.Admin;
import com.xawl.service.AdminService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zb on 2018/4/23.
 */
@Controller
public class AdminAction extends ActionSupport{

    private Admin admin;

    private Map<String, Object> jsonResult;

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public Map<String, Object> getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(Map<String, Object> jsonResult) {
        this.jsonResult = jsonResult;
    }

    @Autowired
    private AdminService adminService;

    public String login(){
        HttpServletRequest request = ServletActionContext.getRequest();
        Map<String, Object> map = new HashMap<String, Object>();
        List<Admin> adminList = this.adminService.findByUserAndPass(admin);
        if (adminList.size() == 0){
            map.put("status", 500);
            map.put("message", "用户名或密码错误");
            jsonResult=map;
            return "success";
        }
        if(adminList.get(0).getUname().equals(admin.getUname())
                && adminList.get(0).getPwd().equals(admin.getPwd())){
            map.put("status", 200);
            map.put("message", "成功");
            jsonResult=map;
            request.getSession().setAttribute("admin", adminList.get(0));
            return "success";
        }else {
            map.put("status", 500);
            map.put("message", "用户名或密码错误");
            jsonResult=map;
            return "success";
        }
    }
}
