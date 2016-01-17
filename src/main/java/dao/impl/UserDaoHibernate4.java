package dao.impl;

import dao.UserDao;
import domain.User;
import org.springframework.stereotype.Component;

/**
 * Created by ZaraN on 2015/12/11.
 */
@Component
public class UserDaoHibernate4 extends BaseDaoHibernate4<User> implements UserDao {

    public boolean login(String username, String password) {
        return getSessionFactory().getCurrentSession().
                createQuery("from User u where u.username = ?1 and u.password = ?2").
                setParameter("1", username).setParameter("2",password).
                list().size() == 1;
    }
}
