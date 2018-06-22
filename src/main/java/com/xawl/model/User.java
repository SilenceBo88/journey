package com.xawl.model;

import javax.persistence.*;
import java.util.Date;

/**
 * 用户
 * Created by zb on 2018/3/23.
 */
@Entity
@Table(name = "t_user")
public class User{

    @Id
    @GeneratedValue
    @Column
    private Integer id;

    @Column
    private String userName;//用户名

    @Column
    private String passWord;//密码

    @Column
    private String realName;//真实姓名

    @Column
    private Integer sex;//性别：0，男；1，女

    @Column
    private Integer age;//年龄

    @Column
    private String phone;//电话

    @Column
    private String headImage;//头像

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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHeadImage() {
        return headImage;
    }

    public void setHeadImage(String headImage) {
        this.headImage = headImage;
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
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", passWord='" + passWord + '\'' +
                ", realName='" + realName + '\'' +
                ", sex=" + sex +
                ", age=" + age +
                ", phone='" + phone + '\'' +
                ", headImage='" + headImage + '\'' +
                ", created=" + created +
                ", updated=" + updated +
                '}';
    }
}
