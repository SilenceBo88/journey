package com.xawl.dao;

import com.xawl.model.TourGuide;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zb on 2018/4/7.
 */
@Repository
public class TourGuideDao extends BaseDao<TourGuide>{

    public List<TourGuide> findByType(Integer type) {
        String hql = "from "+ TourGuide.class.getName() + " u where u.type=:type and u.status = 0 and u.pass = 1 order by u.created desc";
        Query query = getSession().createQuery(hql);
        query.setInteger("type", type);
        return query.list();
    }
}
