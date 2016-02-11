package dao;

import domain.Person;
import domain.Team;
import org.springframework.stereotype.Component;

/**
 * Created by martsforever on 2016/1/17.
 */
@Component
public interface PersonTeamMapping {
    /**
     * 添加一个团队与一个会员之间的对应关系
     *
     * @param person
     * @param team
     */
    public void addMapping(Team team, Person person);

    /**
     * 删除一个团队与一个会员之间的对应关系
     *
     * @param person
     * @param team
     */
    public void deleteMapping(Team team, Person person);

}
