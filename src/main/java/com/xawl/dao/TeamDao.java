package com.xawl.dao;

import com.xawl.model.Team;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zb on 2018/4/10.
 */
@Repository
public class TeamDao extends BaseDao<Team>{

    public void updateLname(String lname, Integer lid) {
        String hql = "update "+ Team.class.getName() + " t set t.lname = :lname where t.lid= :id";
        Query query = getSession().createQuery(hql);
        query.setString("lname", lname);
        query.setInteger("id", lid);
        query.executeUpdate();
    }

    public List<Team> findByLid(Integer lid) {
        String hql = "from "+ Team.class.getName()+" t where t.lid=:lid order by t.created desc";
        Query query = getSession().createQuery(hql);
        query.setInteger("lid", lid);
        return query.list();
    }

    public Integer updatNum(Integer id) {
        String hql = "update "+ Team.class.getName() + " t set t.hasNum = t.hasNum + 1 where t.id= :id";
        Query query = getSession().createQuery(hql);
        query.setInteger("id", id);
        query.executeUpdate();
        return 1;
    }
}
