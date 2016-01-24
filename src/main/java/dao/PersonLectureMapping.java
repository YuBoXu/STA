package dao;


import domain.Lecture;
import domain.Person;
import org.springframework.stereotype.Component;

/**
 * Created by martsforever on 2016/1/17.
 */
@Component
public interface PersonLectureMapping {
    /**
     * 添加一个讲座与一个会员之间的对应关系
     *
     * @param lecture
     * @param person
     */
    public void addMapping(Lecture lecture, Person person);

    /**
     * 删除一个讲座一个会员之间的对应关系
     *
     * @param lecture
     * @param person
     */
    public void deleteMapping(Lecture lecture, Person person);

}
