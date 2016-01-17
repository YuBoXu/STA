package dao;

import domain.User;
import org.springframework.stereotype.Component;

/**
 * Created by ZaraN on 2015/12/11.
 */
@Component
public interface UserDao extends BaseDao<User> {
     boolean login(String username,String password);
}
