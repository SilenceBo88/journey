package com.xawl.service;

import com.xawl.dao.OrderDao;
import com.xawl.model.Order;
import com.xawl.util.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by zb on 2018/4/10.
 */
@Service
public class OrderService {

    @Autowired
    private OrderDao orderDao;

    public PageInfo<Order> findPageAll(Integer page, Integer pageSize) {
        return this.orderDao.findPageAll(page, pageSize);
    }

    public Integer insert(Order order) {
        order.setCreated(new Date());
        order.setUpdated(new Date());
        return this.orderDao.insert(order);
    }

    public List<Order> findByUid(Integer uid) {
        return this.orderDao.findByUid(uid);
    }
}
