package com.xawl.service;

import com.sun.org.apache.xpath.internal.operations.Or;
import com.xawl.dao.LineDao;
import com.xawl.dao.OrderDao;
import com.xawl.dao.TeamDao;
import com.xawl.dao.TourGuideDao;
import com.xawl.model.Line;
import com.xawl.model.Team;

import com.xawl.model.TourGuide;
import com.xawl.util.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by zb on 2018/4/8.
 */
@Service
public class TeamService {

    @Autowired
    private TourGuideDao tourguideDao;

    @Autowired
    private TeamDao teamDao;

    @Autowired
    private LineDao lineDao;

    @Autowired
    private OrderDao orderDao;

    public Integer insertTeam(Team team) {
        List<TourGuide> list = this.tourguideDao.findOne(team.getTgid());
        List<Line> lines = this.lineDao.findOne(team.getLid());

        team.setLname(lines.get(0).getTitle());
        team.setTg_name(list.get(0).getRealName());
        team.setTg_phone(list.get(0).getPhone());
        team.setHasNum(0);
        team.setStatus(0);
        team.setCreated(new Date());
        team.setUpdated(new Date());

        return this.teamDao.insert(team);
    }

    public PageInfo<Team> findPageAll(Integer page, Integer pageSize) {
        return this.teamDao.findPageAll(page, pageSize);
    }

    public List<Team> findOneLine(Team team) {
        return this.teamDao.findOne(team.getId());
    }

    public Integer updateTeam(Team team) {
        List<Team> list = this.teamDao.findOne(team.getId());
        List<TourGuide> tgs = this.tourguideDao.findOne(team.getTgid());

        team.setLid(list.get(0).getLid());
        team.setLname(list.get(0).getLname());
        team.setTg_name(tgs.get(0).getRealName());
        team.setTg_phone(tgs.get(0).getPhone());
        team.setHasNum(list.get(0).getHasNum());
        team.setCreated(list.get(0).getCreated());
        team.setUpdated(new Date());

        this.orderDao.updateNameAndGoTime(team.getTeamName(), team.getGoTime(), team.getId());
        return this.teamDao.update(team);
    }

    public List<Team> findByLid(Integer id) {
        return this.teamDao.findByLid(id);
    }

    public List<Team> findOne(Integer id) {
        return this.teamDao.findOne(id);
    }

    public Integer updatNum(Integer tid) {
        return this.teamDao.updatNum(tid);
    }
}
