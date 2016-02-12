package dao.impl;

import dao.ResourceDAO;
import domain.Resource;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;
import util.ConstantUtil;

import java.util.List;

/**
 * Created by martsforever on 2016/1/24.
 */
@Component
public class ResourceDaoHibernate4 extends BaseDaoHibernate4<Resource> implements ResourceDAO {

    private int pageSize;

    public ResourceDaoHibernate4() {
        pageSize = ConstantUtil.NUMBER_OF_RECORDS_IN_RESOURCE;
    }

    @Override
    public void add(Resource resource) {
        super.save(resource);
    }

    @Override
    public Resource retriveByName(String name) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Resource where name = ?");
        query.setString(0, name);
        List<Resource> resources = query.list();
        if (resources.size() > 0) {
            return resources.get(0);
        } else return null;
    }

    @Override
    public List<Resource> retriveAll() {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Resource");
        List<Resource> resources = query.list();
        return resources;
    }

    @Override
    public void update(Resource resource) {
        super.update(resource);
    }

    @Override
    public void delete(Resource resource) {
        super.delete(resource);
    }

    @Override
    public List<Resource> retriveByPageNumber(int targetPage) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Resource order by id desc");
        query.setFirstResult((targetPage-1)*pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }

    @Override
    public int retriveCounts() {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("select count(id) from Resource");
        int result = Integer.parseInt(query.uniqueResult().toString());
        return result;
    }

    @Override
    public List<Resource> retriveByPageAndKey(int targetPage, String Key) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Resource where name like ? order by id desc");
        query.setString(0, "%" + Key + "%");
        query.setFirstResult((targetPage-1)*pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }

    @Override
    public int retriveCountsByKey(String key) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("select count(id) from Resource where name like ?");
        query.setString(0, "%" + key + "%");
        int result = Integer.parseInt(query.uniqueResult().toString());
        return result;
    }

    @Override
    public int retrivePageNumber() {
        int count = retriveCounts();
        int pagenumber = (count/pageSize);
        if (count%pageSize != 0 && count > 0){
            pagenumber ++;
        }
        return pagenumber;
    }

    @Override
    public int retrivePageNumberOfKey(String key) {
        int count = retriveCountsByKey(key);
        int pagenumber = (count/pageSize);
        if (count%pageSize != 0 && count > 0){
            pagenumber ++;
        }
        return pagenumber;
    }

    @Override
    public Resource retriveById(int id) {
        return super.get(Resource.class,id);
    }
}
