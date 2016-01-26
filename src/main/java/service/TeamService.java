package service;

import domain.Team;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/1/25.
 */
@Service()
@Transactional
public interface TeamService {

    /**
     * 添加一个团队信息
     *
     * @param team
     */

    public void add(Team team);

    /**
     * 查询团队名称是否存在
     *
     * @return
     */
    public boolean isTeamNameExist(String name);

    /**
     * 分页查询团队信息
     *
     * @param number
     * @return
     */

    public List<Team> retriveByPageNumber(String number);

    /**
     * 查询所有记录的个数
     *
     * @return
     */
    public int retriveCounts();

    /**查询分页之后总页数
     * @return
     */
    public int retrivePageNumber();

    /**计算开始与结束页的位置
     * @return
     */
    public Map<String,Integer> getStartAndEnd(int targetPage,int pageNumber);

}
