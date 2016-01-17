package service.impl;

import dao.UserDao;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;

/**
 * Created by ZaraN on 2015/12/11.
 */
@Service("UserService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public int addUser(User user) {
        return (Integer)userDao.save(user);
    }

    public boolean login(String username,String password) {
        return userDao.login(username,password);
    }

    public long getCount() {
        return userDao.findCount(User.class);
    }
}
