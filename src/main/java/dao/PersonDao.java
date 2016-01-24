package dao;

import domain.Person;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/14.
 */
@Component
public interface PersonDao extends BaseDao<Person> {
    /**
     * 添加一个会员信息
     *
     * @param person
     */
    public void add(Person person);

    /**
     * 根据会员账号查找会员信息
     *
     * @param account
     */
    public Person retriveByAccount(String account);


    /**根据用户名以及密码查找用户信息
     * @param account
     * @param password
     * @return
     */
    public Person retriveByAccountAndPassword(String account, String password);

    /**
     * 根据会员名称查找会员信息
     *
     * @param name
     * @return
     */
    public List<Person> retriveByName(String name);

    /**
     * 查找所有会员的信息
     *
     * @return
     */
    public List<Person> retriveAll();

    /**
     * 更新一个会员的信息
     *
     * @param person
     */
    public void update(Person person);

    /**
     * 删除一个会员的信息
     *
     * @param person
     */
    public void delete(Person person);

    /**根据会员id查找会员信息
     * @param id
     */
    public Person retriveById(int id);
}
