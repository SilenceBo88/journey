package com.xawl.model;

import javax.persistence.*;

/**
 * 管理员
 * Created by zb on 2018/4/23.
 */
@Entity
@Table(name = "t_admin")
public class Admin {

    @Id
    @GeneratedValue
    @Column
    private Integer id;

    @Column
    private String uname;

    @Column
    private String pwd;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", uname='" + uname + '\'' +
                ", pwd='" + pwd + '\'' +
                '}';
    }
}
