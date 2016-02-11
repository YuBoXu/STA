package dao;

import dao.BaseDao;
import domain.Competition;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/13.
 */
@Component
public interface CompetitionDAO extends BaseDao<Competition> {
    /**添加一个比赛信息
     * @param competition
     */
    public void add(Competition competition);

    /**根据比赛名称查询一个比赛的信息
     * @param name 比赛的名称
     * @return
     */
    public Competition retriveByName(String name);

    /**查找所有比赛信息
     * @return
     */
    public List<Competition> retriveAll();

    /**更新一个比赛的信息
     * @param competition
     */
    public void update(Competition competition);

    /**删除一个比赛信息
     * @param competition
     */
    public void delete(Competition competition);
}
