package com.xawl.dao;

import com.xawl.model.Line;
import com.xawl.model.User;
import com.xawl.util.PageInfo;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.criteria.CriteriaQuery;
import java.lang.reflect.ParameterizedType;
import java.util.Date;
import java.util.List;

/**
 * Created by zb on 2018/3/25.
 */
public class BaseDao<T> {

    @Autowired
    SessionFactory sessionFactory;

    // 存储泛型的实际参数
    private Class<T> clazz;

    @SuppressWarnings("unchecked")
    public BaseDao(){
        //使用反射技术得到T的真实类型
        //获取当前new的对象的泛型的父类
        ParameterizedType pt =(ParameterizedType) this.getClass().getGenericSuperclass();
        //获取第一个类型参数的真实类型
        this.clazz = (Class<T>) pt.getActualTypeArguments()[0];
    }

    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    /**
     * 查询所有不带分页
     * @return
     */
    public List<T> findAll() {
        String hql = "from "+ this.clazz.getName()+" u order by u.created desc";
        Query query = getSession().createQuery(hql);
        return query.list();
    }

    /**
     * 查询一个
     * @return
     */
    public List<T> findOne(Integer id) {
        String hql = "from "+ this.clazz.getName()+" u where u.id=:id order by u.created desc";
        Query query = getSession().createQuery(hql);
        query.setInteger("id", id);
        return query.list();
    }

    /**
     * 查询所有带分页
     * @param page
     * @param pageSize
     * @return
     */
    public PageInfo<T> findPageAll(Integer page, Integer pageSize){

        String hql = "from "+ this.clazz.getName() +" u order by u.created desc";
        Query query = getSession().createQuery(hql);

        //总记录数
        Integer count = query.list().size();
        //要查询的第一行
        Integer firstCount = (page-1) * 10;

        //分页条件
        query.setFirstResult(firstCount);
        query.setMaxResults(pageSize);
        //根据分页查出来的数据
        List<T> list= query.list();

        //封装PageInfo类
        PageInfo<T> pageInfo = new PageInfo<T>();
        pageInfo.setPageSize(pageSize);
        pageInfo.setCount(count);
        pageInfo.setPageIndex(page);
        pageInfo.setPageList(list);
        pageInfo.getTotalPage();

        //返回结果
        return pageInfo;
    }

    public Integer insert(T t) {
        Integer row = 0;
        try {
            this.getSession().save(t);
            row = 1;
        }catch (Exception e){
            e.printStackTrace();
        }
        return row;
    }

    public Integer delete(T t) {
        Integer row = 0;
        try {
            this.getSession().delete(t);
            row = 1;
        }catch (Exception e){
            e.printStackTrace();
        }
        return row;
    }

    public Integer update(T t) {
        Integer row = 0;
        try {
            this.getSession().update(t);
            row = 1;
        }catch (Exception e){
            e.printStackTrace();
        }
        return row;
    }
}
