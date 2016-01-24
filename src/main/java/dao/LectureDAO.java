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
    public void addLecture(Lecture lecture);

    /**
     * 根据讲座名称查找讲座信息
     *
     * @param name
     * @return
     */
    public Lecture findLectureByName(String name);

    /**
     * 查找所有讲座的信息
     *
     * @return
     */
    public List<Lecture> findAllLecture();

    /**
     * 更新一个讲座的信息
     *
     * @param lecture
     */
    public void updateLecture(Lecture lecture);

    /**
     * 删除一个讲座信息
     *
     * @param lecture
     */
    public void deletelecture(Lecture lecture);

}
