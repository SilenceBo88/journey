package com.xawl.service;

import com.xawl.dao.TourGuideDao;
import com.xawl.model.TourGuide;
import com.xawl.util.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by zb on 2018/4/7.
 */
@Service
public class TourGuideService {

    @Autowired
    private TourGuideDao tourguideDao;

    public PageInfo<TourGuide> findPageAll(Integer page, Integer pageSize) {
        return this.tourguideDao.findPageAll(page, pageSize);
    }

    public Integer updatePass(TourGuide tourGuide) {
        List<TourGuide> list = this.tourguideDao.findOne(tourGuide.getId());
        tourGuide.setCreated(list.get(0).getCreated());
        tourGuide.setUpdated(list.get(0).getUpdated());
        tourGuide.setRealName(list.get(0).getRealName());
        tourGuide.setAge(list.get(0).getAge());
        tourGuide.setSex(list.get(0).getSex());
        tourGuide.setPhone(list.get(0).getPhone());
        tourGuide.setIntroduce(list.get(0).getIntroduce());
        tourGuide.setStatus(list.get(0).getStatus());
        tourGuide.setType(list.get(0).getType());
        tourGuide.setHeadImage(list.get(0).getHeadImage());

        return this.tourguideDao.update(tourGuide);
    }

    public List<TourGuide> findByType(Integer type) {
        return this.tourguideDao.findByType(type);
    }

    public Integer insertGuide(TourGuide tourGuide) {
        tourGuide.setStatus(0);
        tourGuide.setPass(0);
        tourGuide.setCreated(new Date());
        tourGuide.setUpdated(new Date());

        return this.tourguideDao.insert(tourGuide);
    }
}
