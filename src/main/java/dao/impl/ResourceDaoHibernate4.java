package dao.impl;

import dao.ResourceDAO;
import domain.Resource;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/24.
 */
@Component
public class ResourceDaoHibernate4 extends BaseDaoHibernate4<Resource> implements ResourceDAO {
    @Override
    public void addOneResource(Resource resource) {
        super.save(resource);
    }

    @Override
    public Resource retriveResourceByName(String name) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Resource where name = ?");
        query.setString(0, name);
        List<Resource> resources = query.list();
        if (resources.size() > 0) {
            return resources.get(0);
        } else return null;
    }

    @Override
    public List<Resource> retriveAllResource() {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Resource");
        List<Resource> resources = query.list();
        return resources;
    }

    @Override
    public void updateResource(Resource resource) {
        super.update(resource);
    }

    @Override
    public void deleteResource(Resource resource) {
        super.delete(resource);
    }
}
