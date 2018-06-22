package com.xawl.dao;

import com.xawl.model.Line;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaQuery;
import java.util.Date;
import java.util.List;

/**
 * Created by zb on 2018/3/30.
 */
@Repository
public class LineDao extends BaseDao<Line>{

    public List<Line> findByRecommend() {
        String hql = "from "+ Line.class.getName() +" li where li.recommend != 0 and li.status = 0 order by li.created desc";
        Query query = getSession().createQuery(hql);
        return query.list();
    }

    public List<Line> findToRoute() {
        String hql = "from "+ Line.class.getName() +" li where li.status = 0 order by li.created desc";
        Query query = getSession().createQuery(hql);
        return query.list();
    }
}
