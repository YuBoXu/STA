package dao.impl;

import dao.BaseDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ZaraN on 2015/10/15.
 * base dao interface impl
 */
@Component
public class BaseDaoHibernate4<T> implements BaseDao<T> {

    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @SuppressWarnings("unchecked")
    public T get(Class<T> entityClazz, Serializable id) {
        return (T) getSessionFactory().openSession().get(entityClazz, id);
    }

    public Serializable save(T entity) {
        return getSessionFactory().getCurrentSession().save(entity);
    }

    public void update(T entity) {
        Session session = getSessionFactory().openSession();
        Transaction transaction =session.beginTransaction();
        session.update(session.merge(entity));
        transaction.commit();
    }

    public void delete(T entity) {
        getSessionFactory().getCurrentSession().delete(entity);
    }

    public void delete(Class<T> entityClazz, Serializable id) {
        getSessionFactory().getCurrentSession()
                .createQuery("delete " + entityClazz.getSimpleName() + " en where en.id = ?1")
                .setParameter("1", id).executeUpdate();
    }

    public List<T> findAll(Class<T> entityClazz) {
        return find("select en from " + entityClazz.getSimpleName() + " en");
    }

    public long findCount(Class<T> entityClazz) {
        List<?> l = find("select count(*) from " + entityClazz.getSimpleName());
        if (l != null && l.size() == 1)
            return (Long) l.get(0);
        return 0;
    }

    @SuppressWarnings("unchecked")
    protected List<T> find(String hql) {
        return (List<T>) getSessionFactory().getCurrentSession().createQuery(hql).list();
    }
}
