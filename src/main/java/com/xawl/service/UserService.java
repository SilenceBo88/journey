package com.xawl.service;

import com.xawl.dao.UserDao;
import com.xawl.model.User;
import com.xawl.util.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by zb on 2018/3/23.
 */
@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public PageInfo<User> findPageAll(Integer page, Integer pageSize) {
        return this.userDao.findPageAll(page, pageSize);
    }

    public Integer insert(User user) {
        user.setCreated(new Date());
        user.setUpdated(new Date());
        return this.userDao.insert(user);
    }

    public List<User> findOneByPhone(String phone) {
        return this.userDao.findOneByPhone(phone);
    }

    public List<User> findOneByPhoneAndPwd(String phone, String pwd) {
        return this.userDao.findOneByPhoneAndPwd(phone, pwd);
    }

    public List<User> findOneById(Integer id) {
        return this.userDao.findOne(id);
    }

    public Integer update(User user) {
        List<User> userList = this.userDao.findOne(user.getId());
        user.setPassWord(userList.get(0).getPassWord());
        user.setPhone(userList.get(0).getPhone());
        user.setCreated(userList.get(0).getCreated());
        user.setUpdated(new Date());

        return this.userDao.update(user);
    }

    public Integer updatePassById(User user) {
        return this.userDao.updatePassById(user);
    }
}
