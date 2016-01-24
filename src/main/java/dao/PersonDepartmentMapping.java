package dao;


import domain.Department;
import domain.Person;
import org.springframework.stereotype.Component;

/**
 * Created by martsforever on 2016/1/17.
 */
@Component
public interface PersonDepartmentMapping {
    /**
     * 添加一个部门与会员之间的对应关系
     *
     * @param department
     * @param person
     */
    public void addMapping(Department department, Person person);

    /**
     * 删除一个部门与会员之间的对应关系
     *
     * @param department
     * @param person
     */
    public void deleteMapping(Department department, Person person);

}
