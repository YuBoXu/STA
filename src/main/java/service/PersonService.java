package service;

import domain.Person;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by martsforever on 2016/1/22.
 */
@Service()
@Transactional
public interface PersonService {

    /**
     * 根据用户名密码进行登录，登录成功则返回用户信息，失败返回null值
     *
     * @param account
     * @param password
     * @return
     */
    public Person login(String account, String password);

    /**
     * 根据用户账号获取用户信息
     *
     * @param account
     * @return
     */
    public Person getPerson(String account);


    /**
     * 注册用户信息
     *
     * @param person
     */
    public void registerPerson(Person person);

    /**判断用户名是否存在
     * @param name
     * @return
     */
    public boolean isUsernameExist(String name);

}
