package com.xawl.service;

import com.xawl.dao.NoticeDao;
import com.xawl.model.Notice;
import com.xawl.util.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by zb on 2018/4/11.
 */
@Service
public class NoticeService {

    @Autowired
    private NoticeDao noticeDao;

    public PageInfo<Notice> findPageAll(Integer page, Integer pageSize) {
        return this.noticeDao.findPageAll(page, pageSize);
    }

    public Integer insertNotice(Notice notice) {
        notice.setCreated(new Date());
        notice.setUpdated(new Date());
        return this.noticeDao.insert(notice);
    }

    public List<Notice> findOneNotice(Notice notice) {
        return this.noticeDao.findOne(notice.getId());
    }

    public Integer updateNotice(Notice notice) {
        List<Notice> list = this.noticeDao.findOne(notice.getId());
        notice.setCreated(list.get(0).getCreated());
        notice.setUpdated(new Date());
        return this.noticeDao.update(notice);
    }

    public Integer deleteNotice(Notice notice) {
        return this.noticeDao.delete(notice);
    }

    public List<Notice> findoToNotice() {
        return this.noticeDao.findAll();
    }
}
