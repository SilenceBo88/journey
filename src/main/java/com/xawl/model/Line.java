package com.xawl.model;

import javax.persistence.*;
import java.util.Date;

/**
 * 旅游线路
 * Created by zb on 2018/3/30.
 */
@Entity
@Table(name = "t_line")
public class Line {

    @Id
    @GeneratedValue
    @Column
    private Integer id;

    @Column
    private String title;//线路标题

    @Column
    private String introduce;//线路介绍

    @Column
    private String route;//旅游路线，json？

    @Column
    private String image;//图片

    @Column
    private Double price;//价格

    @Column
    private Integer type;//线路类型：0，周边游；1，国内游；2，国际游

    @Column
    private Integer status;//线路状态：0，开放；1，未开放

    @Column
    private Integer recommend;//线路推荐：0，不推荐；1，首页推荐；2，轮播推荐

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getRecommend() {
        return recommend;
    }

    public void setRecommend(Integer recommend) {
        this.recommend = recommend;
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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Line{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", introduce='" + introduce + '\'' +
                ", route='" + route + '\'' +
                ", image='" + image + '\'' +
                ", price=" + price +
                ", type=" + type +
                ", status=" + status +
                ", recommend=" + recommend +
                ", created=" + created +
                ", updated=" + updated +
                '}';
    }
}
