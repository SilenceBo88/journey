package com.xawl.service;

import com.xawl.dao.AdminDao;
import com.xawl.model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by zb on 2018/4/23.
 */
@Service
public class AdminService {

    @Autowired
    private AdminDao adminDao;

    public List<Admin> findByUserAndPass(Admin admin) {
        return this.adminDao.findByUserAndPass(admin);
    }
}
