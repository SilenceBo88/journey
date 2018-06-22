package com.xawl.dao;

import com.xawl.model.Admin;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zb on 2018/4/23.
 */
@Repository
public class AdminDao extends BaseDao<Admin>{

    public List<Admin> findByUserAndPass(Admin admin) {
        String hql = "from "+ Admin.class.getName()+" a where a.uname=:uname and a.pwd=:pwd";
        Query query = getSession().createQuery(hql);
        query.setString("uname", admin.getUname());
        query.setString("pwd", admin.getPwd());
        return query.list();
    }
}
