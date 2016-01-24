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

    /**根据团队名称查找团队信息
     * @param name
     * @return
     */
    public Team retriveByName(String name);

    /**查找所有的团队的信息
     * @return
     */
    public List<Team> retriveAll();

    /**更新一个团队的信息
     * @param team
     */
    public void update(Team team);

    /**删除一个团队的信息
     * @param team
     */
    public void delete(Team team);

}
