package dao;


import domain.Lecture;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/17.
 */
@Component
public interface LectureDAO extends BaseDao<Lecture>{
    /**
     * 添加一个讲座信息
     *
     * @param lecture
     */
    public void add(Lecture lecture);

    /**
     * 根据讲座名称查找讲座信息
     *
     * @param name
     * @return
     */
    public Lecture retriveByName(String name);

    /**
     * 查找所有讲座的信息
     *
     * @return
     */
    public List<Lecture> retriveAll();

    /**
     * 更新一个讲座的信息
     *
     * @param lecture
     */
    public void update(Lecture lecture);

    /**
     * 删除一个讲座信息
     *
     * @param lecture
     */
    public void delete(Lecture lecture);

}
