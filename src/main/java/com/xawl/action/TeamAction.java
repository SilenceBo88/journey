package com.xawl.action;

import com.opensymphony.xwork2.ActionSupport;
import com.xawl.model.Line;
import com.xawl.model.Team;
import com.xawl.model.TourGuide;
import com.xawl.service.LineService;
import com.xawl.service.TeamService;
import com.xawl.service.TourGuideService;
import com.xawl.util.PageInfo;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by zb on 2018/4/8.
 */
@Controller
public class TeamAction extends ActionSupport{

    private String url = "./";

    private Team team;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    @Autowired
    private TeamService teamService;

    @Autowired
    private LineService lineService;

    @Autowired
    private TourGuideService tourguideService;

    /**
     * 去团队添加页面
     * @return
     */
    public String addPage(){
        HttpServletRequest request = ServletActionContext.getRequest();

        Line line = new Line();
        line.setId(team.getLid());
        List<Line> list = this.lineService.findOneLine(line);
        team.setTeamName(list.get(0).getTitle() + "_" + ((int)(Math.random()*(1000))));
        Integer type = Integer.valueOf(request.getParameter("type"));
        List<TourGuide> tourGuides = this.tourguideService.findByType(type);

        System.out.println(tourGuides);
        request.setAttribute("team", team);
        request.setAttribute("tourGuides", tourGuides);
        this.setUrl("/admin/teamAdd.jsp");
        return this.SUCCESS;

    }

    /**
     * 添加团队
     * @return
     */
    public String add(){
        Integer row = this.teamService.insertTeam(team);
        if (row == 1) {
            this.setUrl("/Team/all");
            return "redirect";
        }else{
            return this.ERROR;
        }
    }

    /**
     * 查询团队分页
     * @return
     */
    public String all(){

        HttpServletRequest request = ServletActionContext.getRequest();

        String pageStr = request.getParameter("page");
        String pageSizeStr = request.getParameter("pageSize");
        if (pageStr == null){
            pageStr = "1";
        }
        if (pageSizeStr == null){
            pageSizeStr = "10";
        }

        Integer page = Integer.valueOf(pageStr);
        Integer pageSize = Integer.valueOf(pageSizeStr);


        PageInfo<Team> pageInfo = this.teamService.findPageAll(page, pageSize);

        request.setAttribute("pageInfo", pageInfo);
        this.setUrl("/admin/teamList.jsp");
        return this.SUCCESS;
    }

    /**
     * 去修改页面
     * @return
     */
    public String updatePage(){
        HttpServletRequest request = ServletActionContext.getRequest();
        List<Team> list = this.teamService.findOneLine(team);
        Line line = new Line();
        line.setId(list.get(0).getLid());
        List<Line> lines = this.lineService.findOneLine(line);
        List<TourGuide> tourGuides = this.tourguideService.findByType(lines.get(0).getType());

        if (list == null){
            return this.ERROR;
        }else{
            Team team = list.get(0);
            //System.out.println(team);
            request.setAttribute("team", team);
            request.setAttribute("tourGuides", tourGuides);
            this.setUrl("/admin/teamUpdate.jsp");
            return this.SUCCESS;
        }
    }

    /**
     * 修改
     * @return
     */
    public String update(){
        HttpServletRequest request = ServletActionContext.getRequest();
        Integer row = this.teamService.updateTeam(team);
        if (row == 1) {
            this.setUrl("/Team/all");
            return "redirect";
        }else{
            return this.ERROR;
        }
    }

    /**
     *去团队页面
     * @return
     */
    public String findToTeam(){
        HttpServletRequest request = ServletActionContext.getRequest();
        Integer id = Integer.valueOf(request.getParameter("id"));
        List<Team> teamList = this.teamService.findOne(id);
        List<Line> lineList = this.lineService.findOne(teamList.get(0).getLid());

        request.getSession().setAttribute("team", teamList.get(0));
        request.getSession().setAttribute("image", lineList.get(0).getImage());
        this.setUrl("/front/other/team.jsp");
        return "redirect";
    }
}
