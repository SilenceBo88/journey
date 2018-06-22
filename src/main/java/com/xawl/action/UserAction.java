package com.xawl.action;

import com.opensymphony.xwork2.ActionSupport;
import com.xawl.model.Order;
import com.xawl.model.User;
import com.xawl.service.OrderService;
import com.xawl.service.UserService;
import com.xawl.util.PageInfo;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zb on 2018/3/23.
 */
@Controller
public class UserAction extends ActionSupport {

    private String url = "./";

    private Map<String, Object> jsonResult;

    private User user;

    private void setUrl(String url) {
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public Map<String, Object> getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(Map<String, Object> jsonResult) {
        this.jsonResult = jsonResult;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    /**
     * 查询所有用户并分页显示
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


        PageInfo<User> pageInfo = this.userService.findPageAll(page, pageSize);

        request.setAttribute("pageInfo", pageInfo);
        this.setUrl("/admin/userList.jsp");
        return this.SUCCESS;
    }

    /**
     * 注册
     * @return
     */
    public String register(){
        Map<String, Object> map = new HashMap<String, Object>();
        List<User> userList = this.userService.findOneByPhone(user.getPhone());
        if (userList.size() != 0){
            map.put("status", 300);
            map.put("message", "该手机已经被注册");
            jsonResult=map;
            return "success";
        }

        Integer row = this.userService.insert(user);
        if (row == 1) {
            map.put("status", 200);
            map.put("message", "成功");
            jsonResult=map;
            return "success";
        }else{
            return this.ERROR;
        }
    }

    /**
     * 登录
     * @return
     */
    public String login(){
        HttpServletRequest request = ServletActionContext.getRequest();
        Map<String, Object> map = new HashMap<String, Object>();
        List<User> userList = this.userService.findOneByPhoneAndPwd(user.getPhone(), user.getPassWord());
        if (userList.size() == 0){
            map.put("status", 500);
            map.put("message", "用户名或密码错误");
            jsonResult=map;
            return "success";
        }
        if(userList.get(0).getPhone().equals(user.getPhone())
                && userList.get(0).getPassWord().equals(user.getPassWord())){
            map.put("status", 200);
            map.put("message", "成功");
            jsonResult=map;
            request.getSession().setAttribute("user", userList.get(0));
            return "success";
        }else {
            map.put("status", 500);
            map.put("message", "用户名或密码错误");
            jsonResult=map;
            return "success";
        }
    }

    /**
     * 个人中心
     * @return
     */
    public String myCenter(){
        HttpServletRequest request = ServletActionContext.getRequest();
        Integer id = Integer.valueOf(request.getParameter("id"));

        List<User> userList = this.userService.findOneById(id);
        List<Order> orderList = this.orderService.findByUid(id);
        request.getSession().setAttribute("myUser", userList.get(0));
        request.getSession().setAttribute("myOrderList", orderList);

        this.setUrl("/front/other/selfCenter.jsp");
        return "redirect";
    }

    /**
     * 修改
     * @return
     */
    public String update(){
        Map<String, Object> map = new HashMap<String, Object>();
        Integer row = this.userService.update(user);
        if (row == 1) {
            map.put("status", 200);
            map.put("message", "成功");
            jsonResult=map;
            return "success";
        }else{
            return this.ERROR;
        }
    }

    public String updatePass(){
        HttpServletRequest request = ServletActionContext.getRequest();
        Map<String, Object> map = new HashMap<String, Object>();
        Integer row = this.userService.updatePassById(user);
        if (row == 1) {
            map.put("status", 200);
            map.put("message", "成功");
            request.getSession().removeAttribute("user");
            jsonResult=map;
            return "success";
        }else{
            return this.ERROR;
        }
    }
}
