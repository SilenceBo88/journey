package com.xawl.model;

import javax.persistence.*;
import java.util.Date;

/**
 * 导游
 * Created by zb on 2018/4/7.
 */
@Entity
@Table(name = "t_tourGuide")
public class TourGuide {
    @Id
    @GeneratedValue
    @Column
    private Integer id;

    @Column
    private String realName;//导游的真实姓名

    @Column
    private Integer sex;//性别：0，男；1，女

    @Column
    private Integer age;//年纪

    @Column
    private String phone;//电话

    @Column
    private String introduce;//个人介绍

    @Column
    private Integer status;//导游状态：0，空闲；1，繁忙

    @Column
    private Integer type;//导游类型：0，周边游；1，国内游；2，国际游

    @Column
    private Integer pass;//导游审核是否通过：0，未通过；1，通过

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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public Integer getPass() {
        return pass;
    }

    public void setPass(Integer pass) {
        this.pass = pass;
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
        return "TourGuideAction{" +
                "id=" + id +
                ", realName='" + realName + '\'' +
                ", sex=" + sex +
                ", age=" + age +
                ", phone='" + phone + '\'' +
                ", introduce='" + introduce + '\'' +
                ", status=" + status +
                ", type=" + type +
                ", pass=" + pass +
                ", headImage='" + headImage + '\'' +
                ", created=" + created +
                ", updated=" + updated +
                '}';
    }
}
