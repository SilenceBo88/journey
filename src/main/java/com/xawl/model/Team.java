package com.xawl.model;

import javax.persistence.*;
import java.util.Date;

/**
 * 旅行团
 * Created by zb on 2018/4/7.
 */
@Entity
@Table(name = "t_team")
public class Team {
    @Id
    @GeneratedValue
    @Column
    private Integer id;

    @Column
    private Integer lid;//对应线路id

    @Column
    private String lname;//对应线路名称

    @Column
    private String teamName;//团队名称

    @Column
    private String goTime;//出发时间

    @Column
    private Integer tgid;//对应导游id

    @Column
    private String tg_name;//导游名字

    @Column
    private String tg_phone;//导游电话

    @Column
    private Integer maxNum;//团队最大人数

    @Column
    private Integer hasNum;//团队已有人数

    @Column
    private Integer status;//团队状态：0，未出发；1，已出发；2，已结束

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

    public Integer getLid() {
        return lid;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public void setLid(Integer lid) {
        this.lid = lid;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getGoTime() {
        return goTime;
    }

    public void setGoTime(String goTime) {
        this.goTime = goTime;
    }

    public Integer getTgid() {
        return tgid;
    }

    public void setTgid(Integer tgid) {
        this.tgid = tgid;
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

    public Integer getMaxNum() {
        return maxNum;
    }

    public void setMaxNum(Integer maxNum) {
        this.maxNum = maxNum;
    }

    public Integer getHasNum() {
        return hasNum;
    }

    public void setHasNum(Integer hasNum) {
        this.hasNum = hasNum;
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
        return "Team{" +
                "id=" + id +
                ", lid=" + lid +
                ", teamName='" + teamName + '\'' +
                ", goTime='" + goTime + '\'' +
                ", tgid=" + tgid +
                ", tg_name=" + tg_name +
                ", tg_phone=" + tg_phone +
                ", maxNum=" + maxNum +
                ", hasNum=" + hasNum +
                ", status=" + status +
                ", created=" + created +
                ", updated=" + updated +
                '}';
    }
}
