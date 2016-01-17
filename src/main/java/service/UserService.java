package service;

import domain.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by ZaraN on 2015/12/11.
 */
@Service()
@Transactional
public interface UserService {
    int addUser(User user);
    boolean login(String username,String password);
    long getCount();
}
