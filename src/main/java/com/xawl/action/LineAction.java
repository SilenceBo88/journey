package com.xawl.action;

import com.opensymphony.xwork2.ActionSupport;
import com.xawl.model.Line;
import com.xawl.model.Team;
import com.xawl.service.LineService;
import com.xawl.service.TeamService;
import com.xawl.util.PageInfo;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Created by zb on 2018/3/30.
 */
@Controller
public class LineAction extends ActionSupport {

    private String url = "./";

    private Line line;

    // 文件上传需要的参数
    private File upload;// 上传的文件

    private String uploadFileName;//上传的文件名陈

    private String uploadContentType;// 接收文件上传的MIME类型

    private void setUrl(String url) {
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    @Autowired
    private LineService lineService;

    @Autowired
    private TeamService teamService;

    /**
     * 查询所有线路并分页显示
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


        PageInfo<Line> pageInfo = this.lineService.findPageAll(page, pageSize);

        request.setAttribute("pageInfo", pageInfo);
        this.setUrl("/admin/lineList.jsp");
        return this.SUCCESS;

    }

    /**
     * 添加线路，图片上传
     * @return
     */
    public String add(){
        HttpServletRequest request = ServletActionContext.getRequest();
        if (upload != null){
            //文件要保存的路径
            String savepath = request.getSession().getServletContext().getRealPath("/images/line");
            //String savepath ="D:\\upload\\images\\line";
            //获取扩展名
            String ext = uploadFileName.substring(uploadFileName.lastIndexOf(".")+1, uploadFileName.length());
            //重命名文件
            uploadFileName = new SimpleDateFormat("yyyyMMddHHmmssSSS") .format(new Date()) +"_" +((int)(Math.random()*(1000))) + '.' + ext;
            // 创建一个文件
            File diskFile = new File(savepath + File.separator + uploadFileName);
            //line.setImage(savepath +  File.separator + uploadFileName);
            line.setImage("/images/line/" + uploadFileName);
            // 文件上传,使用FileUtils工具类
            try {
                FileUtils.copyFile(upload, diskFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        Integer row = this.lineService.insertLine(line);
        if (row == 1) {
            this.setUrl("/Line/all");
            return "redirect";
        }else{
            return this.ERROR;
        }
    }

    /**
     * 删除线路，删除图片
     * @return
     */
    public String del(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String path = request.getSession().getServletContext().getRealPath("");

        Integer row = this.lineService.deleteLine(line, path);
        if (row == 1) {
            this.setUrl("/Line/all");
            return "redirect";
        }else{
            return this.ERROR;
        }
    }

    /**
     * 去修改页面
     * @return
     */
    public String updatePage(){
        HttpServletRequest request = ServletActionContext.getRequest();
        List<Line> list = this.lineService.findOneLine(line);
        if (list == null){
            return this.ERROR;
        }else{
            Line line = list.get(0);
            //System.out.println(line);
            request.setAttribute("line", line);
            this.setUrl("/admin/lineUpdate.jsp");
            return this.SUCCESS;
        }
    }

    /**
     * 修改线路，修改图片
     * @return
     */
    public String update(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String path = request.getSession().getServletContext().getRealPath("");
        if (upload != null){
            //文件要保存的路径
            String savepath = request.getSession().getServletContext().getRealPath("/images/line");
            //获取扩展名
            String ext = uploadFileName.substring(uploadFileName.lastIndexOf(".")+1, uploadFileName.length());
            //重命名文件
            uploadFileName = new SimpleDateFormat("yyyyMMddHHmmssSSS") .format(new Date()) +"_" +((int)(Math.random()*(1000))) + '.' + ext;
            // 创建一个文件
            File diskFile = new File(savepath + File.separator + uploadFileName);
            line.setImage("/images/line/" + uploadFileName);
            // 文件上传,使用FileUtils工具类
            try {
                FileUtils.copyFile(upload, diskFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        //System.out.println(line);
        Integer row = this.lineService.updateLine(line, path);
        if (row == 1) {
            this.setUrl("/Line/all");
            return "redirect";
        }else{
            return this.ERROR;
        }
    }

    /**
     * 查询广告
     * @return
     */
    public String findByRecommend(){
        HttpServletRequest request = ServletActionContext.getRequest();

        List<Line> lineList = this.lineService.findByRecommend();

        request.getSession().setAttribute("lineList", lineList);
        this.setUrl("/front/index.jsp");
        return "redirect";
    }

    /**
     * 查询到线路
     * @return
     */
    public String findToRoute(){
        HttpServletRequest request = ServletActionContext.getRequest();

        List<Line> lineList = this.lineService.findToRoute();

        request.getSession().setAttribute("lineList", lineList);
        this.setUrl("/front/other/route.jsp");
        return "redirect";
    }

    /**
     * 查询到线路
     * @return
     */
    public String findToDetail(){
        HttpServletRequest request = ServletActionContext.getRequest();
        Integer id = Integer.valueOf(request.getParameter("id"));

        List<Line> line = this.lineService.findToDetail(id);
        List<Team> teamList = this.teamService.findByLid(id);

        request.getSession().setAttribute("line", line.get(0));
        request.getSession().setAttribute("teamList", teamList);
        this.setUrl("/front/other/detail.jsp");
        return "redirect";
    }
}
