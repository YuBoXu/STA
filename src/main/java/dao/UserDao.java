package dao;

import domain.User;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

/**
 * Created by ZaraN on 2015/12/11.
 */
@Repository
public interface UserDao extends BaseDao<User> {
     boolean login(String username,String password);
}
