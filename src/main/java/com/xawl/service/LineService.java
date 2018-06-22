package com.xawl.service;

import com.xawl.dao.LineDao;
import com.xawl.dao.TeamDao;
import com.xawl.dao.TourGuideDao;
import com.xawl.model.Line;
import com.xawl.model.Team;
import com.xawl.model.TourGuide;
import com.xawl.util.PageInfo;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by zb on 2018/3/30.
 */
@Service
public class LineService {

    @Autowired
    private LineDao lineDao;

    @Autowired
    private TeamDao teamDao;

    public PageInfo<Line> findPageAll(Integer page, Integer pageSize) {
        return this.lineDao.findPageAll(page, pageSize);
    }

    public Integer insertLine(Line line) {
        line.setCreated(new Date());
        line.setUpdated(new Date());
        return this.lineDao.insert(line);
    }

    public Integer deleteLine(Line line, String path) {
        List<Line> list = this.lineDao.findOne(line.getId());
        String image = list.get(0).getImage();
        String imgPath = path + image;
        try {
            FileUtils.forceDelete(new File(imgPath));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return this.lineDao.delete(line);
    }

    public List<Line> findOneLine(Line line) {
        return this.lineDao.findOne(line.getId());
    }

    public Integer updateLine(Line line, String path) {
        List<Line> list = this.lineDao.findOne(line.getId());
        Date created = list.get(0).getCreated();

        System.out.println(line.getImage());
        if (line.getImage() != null){
            String image = list.get(0).getImage();
            String imgPath = path + image;
            try {
                FileUtils.forceDelete(new File(imgPath));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            line.setImage(list.get(0).getImage());
        }
        line.setCreated(created);
        line.setUpdated(new Date());

        this.teamDao.updateLname(line.getTitle(), line.getId());
        return this.lineDao.update(line);
    }

    public List<Line> findByRecommend() {
        return this.lineDao.findByRecommend();
    }

    public List<Line> findToRoute() {
        return this.lineDao.findToRoute();
    }


    public List<Line> findToDetail(Integer id) {
        return this.lineDao.findOne(id);
    }

    public List<Line> findOne(Integer lid) {
        return this.lineDao.findOne(lid);
    }
}
