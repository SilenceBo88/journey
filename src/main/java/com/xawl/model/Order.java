package com.xawl.model;

import javax.persistence.*;
import java.util.Date;

/**
 * 订单
 * Created by zb on 2018/4/7.
 */
@Entity
@Table(name = "t_order")
public class Order {
    @Id
    @GeneratedValue
    @Column
    private Integer id;

    @Column
    private Integer tid;//对应旅行团id

    @Column
    private Integer uid;//对应用户id

    @Column
    private String t_Name;//对应旅行团名字

    @Column
    private String goTime;//出发时间

    @Column
    private String tg_name;//导游真实姓名

    @Column
    private String tg_phone;//导游电话

    @Column
    private String u_name;//用户真实姓名

    @Column
    private String u_phone;//用户电话

    @Column
    private Integer status;//订单状态：0，未开始；1，进行中；2，已结束

    @Column
    private Date created;

    @Column
    private Date updated;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getT_Name() {
        return t_Name;
    }

    public void setT_Name(String t_Name) {
        this.t_Name = t_Name;
    }

    public String getGoTime() {
        return goTime;
    }

    public void setGoTime(String goTime) {
        this.goTime = goTime;
    }

    public String getTg_name() {
        return tg_name;
    }

    public void setTg_name(String tg_name) {
        this.tg_name = tg_name;
    }

    public String getTg_phone() {
        return tg_phone;
    }

    public void setTg_phone(String tg_phone) {
        this.tg_phone = tg_phone;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getU_phone() {
        return u_phone;
    }

    public void setU_phone(String u_phone) {
        this.u_phone = u_phone;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    @Override
    public String toString() {
        return "OrderAction{" +
                "id=" + id +
                ", tid=" + tid +
                ", uid=" + uid +
                ", t_Name='" + t_Name + '\'' +
                ", goTime='" + goTime + '\'' +
                ", tg_name='" + tg_name + '\'' +
                ", tg_phone='" + tg_phone + '\'' +
                ", u_name='" + u_name + '\'' +
                ", u_phone='" + u_phone + '\'' +
                ", status=" + status +
                ", created=" + created +
                ", updated=" + updated +
                '}';
    }
}
