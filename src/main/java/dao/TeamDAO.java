package dao;


import domain.Team;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/17.
 */
@Component
public interface TeamDAO {

    /**
     * 添加一个团队信息
     */
    public void add(Team team);

    /**
     * 根据团队名称查找团队信息
     *
     * @param name
     * @return
     */
    public Team retriveByName(String name);

    /**
     * 查找所有的团队的信息
     *
     * @return
     */
    public List<Team> retriveAll();

    /**
     * 更新一个团队的信息
     *
     * @param team
     */
    public void update(Team team);

    /**
     * 删除一个团队的信息
     *
     * @param team
     */
    public void delete(Team team);


    /**分页查找团队信息
     * @param number
     * @return
     */
    public List<Team> retriveByPageNumber(int number);


    /**查询所有记录的个数
     * @return
     */
    public int retriveCounts();

    /**查询分页之后总页数
     * @return
     */
    public int retrivePageNumber();

    /**根据id查询团队信息
     * @param id
     * @return
     */
    public Team retriveById(int id);

}
