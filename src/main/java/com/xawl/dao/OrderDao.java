package com.xawl.dao;

import com.xawl.model.Order;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zb on 2018/4/10.
 */
@Repository
public class OrderDao extends BaseDao<Order>{

    public void updateNameAndGoTime(String t_Name, String goTime, Integer tid) {
        String hql = "update "+ Order.class.getName() + " o set o.t_Name = :t_Name, o.goTime = :goTime where o.tid= :tid";
        Query query = getSession().createQuery(hql);
        query.setString("t_Name", t_Name);
        query.setString("goTime", goTime);
        query.setInteger("tid", tid);
        query.executeUpdate();
    }

    public List<Order> findByUid(Integer uid) {
        String hql = "from "+ Order.class.getName()+" o where o.uid=:uid order by o.created desc";
        Query query = getSession().createQuery(hql);
        query.setInteger("uid", uid);
        return query.list();
    }
}
