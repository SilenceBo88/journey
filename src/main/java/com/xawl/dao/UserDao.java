package com.xawl.dao;

import com.xawl.model.User;
import com.xawl.util.PageInfo;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaQuery;
import java.util.List;

/**
 * Created by zb on 2018/3/23.
 */
@Repository
public class UserDao extends BaseDao<User>{

    public List<User> findOneByPhone(String phone) {
        String hql = "from "+ User.class.getName()+" u where u.phone=:phone order by u.created desc";
        Query query = getSession().createQuery(hql);
        query.setString("phone", phone);
        return query.list();
    }

    public List<User> findOneByPhoneAndPwd(String phone, String pwd) {
        String hql = "from "+ User.class.getName()+" u where u.phone=:phone and u.passWord=:passWord order by u.created desc";
        Query query = getSession().createQuery(hql);
        query.setString("phone", phone);
        query.setString("passWord", pwd);
        return query.list();
    }

    public Integer updatePassById(User user) {
        String hql = "update "+ User.class.getName() + " u set u.passWord =:passWord where u.id=:id";
        Query query = getSession().createQuery(hql);
        query.setInteger("id", user.getId());
        query.setString("passWord", user.getPassWord());
        query.executeUpdate();
        return 1;
    }
}
