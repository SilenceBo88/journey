package com.xawl.action;

import com.opensymphony.xwork2.ActionSupport;
import com.xawl.model.Order;
import com.xawl.service.OrderService;
import com.xawl.service.TeamService;
import com.xawl.util.PageInfo;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by zb on 2018/4/10.
 */
@Controller
public class OrderAction extends ActionSupport{

    private String url = "./";

    private Order order;

    private void setUrl(String url) {
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    @Autowired
    private OrderService orderService;

    @Autowired
    private TeamService teamService;

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


        PageInfo<Order> pageInfo = this.orderService.findPageAll(page, pageSize);

        request.setAttribute("pageInfo", pageInfo);
        this.setUrl("/admin/orderList.jsp");
        return this.SUCCESS;
    }

    /**
     * 添加订单
     * @return
     */
    public String add(){
        Integer row = this.orderService.insert(order);
        Integer row2 = this.teamService.updatNum(order.getTid());
        if (row == 1 && row2 == 1) {
            this.setUrl("/front/other/orderSuccess.jsp");
            return "redirect";
        }else{
            return this.ERROR;
        }
    }

}
