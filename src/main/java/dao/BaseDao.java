package dao;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ZaraN on 2015/10/15.
 * base dao interface,other can extends this
 */
public interface BaseDao<T> {
    /**
     * get entity by id
     * @param entityClazz entity class name
     * @param id id you want
     * @return entity whose id is id you want
     */
    T get(Class<T> entityClazz,Serializable id);

    /**
     * save one entity to database
     * @param entity the entity you want to save
     * @return >0 means successfully
     */
    Serializable save(T entity);

    /**
     * update one entity
     * @param entity the entity you want to update
     */
    void update(T entity);

    /**
     * delete one entity
     * @param entity the entity you want to delete
     */
    void delete(T entity);

    /**
     * delete one entity whose id is id you want
     * @param entityClazz class name
     * @param id id you want
     */
    void delete(Class<T> entityClazz,Serializable id);

    /**
     * get all entity whit class Clazz
     * @param entityClazz the all class's entities you want
     * @return a list with all entities
     */
    List<T> findAll(Class<T> entityClazz);

    /**
     * get count
     * @param entityClazz class name
     * @return count
     */
    long findCount(Class<T> entityClazz);
}
