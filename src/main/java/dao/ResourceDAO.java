package dao;

import domain.Resource;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/13.
 */
@Component
public interface ResourceDAO extends BaseDao<Resource> {

    /**添加一个资源
     * @param resource
     */
    public void addOneResource(Resource resource);

    /**根据资源名称查找资源信息
     * @param name 资源名称
     * @return
     */
    public Resource retriveResourceByName(String name);

    /**查找所有的资源的信息
     * @return
     */
    public List<Resource> retriveAllResource();

    /**更新资源信息
     * @param resource
     */
    public void updateResource(Resource resource);

    /**删除一个资源信息
     * @param resource
     */
    public void deleteResource(Resource resource);

}
