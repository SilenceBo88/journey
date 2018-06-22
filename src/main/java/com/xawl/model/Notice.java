package com.xawl.model;

import javax.persistence.*;
import java.util.Date;

/**
 * 公告
 * Created by zb on 2018/4/11.
 */
@Entity
@Table(name = "t_notice")
public class Notice {

    @Id
    @GeneratedValue
    @Column
    private Integer id;

    @Column
    private String title;//标题

    @Column
    private String context;//内容

    @Column
    private Integer type;//类型：0，一般通知；1，重要通知

    @Column
    private Integer isSend;//是否发送：0，未发送；1，已发送

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

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getIsSend() {
        return isSend;
    }

    public void setIsSend(Integer isSend) {
        this.isSend = isSend;
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
        return "Notice{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", context='" + context + '\'' +
                ", type=" + type +
                ", isSend=" + isSend +
                ", created=" + created +
                ", updated=" + updated +
                '}';
    }
}
