package dao.impl;

import dao.PersonDao;
import domain.Person;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/22.
 */
@Component("PersonDaoHibernate4")
public class PersonDaoHibernate4 extends BaseDaoHibernate4<Person> implements PersonDao {
    @Override
    public void addPerson(Person person) {
        super.save(person);
    }

    @Override
    public Person findPersonByAccount(String account) {

        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Person where account = ?");
        query.setString(0, account);

        List<Person> persons = query.list();

        if (persons.size() > 0)
            return persons.get(0);
        else return null;

    }

    @Override
    public Person findPersonByAccountAndPassword(String account, String password) {
        Person person = null;

        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Person where account = ? and password = ?");
        query.setString(0, account);
        query.setString(1, password);

        List<Person> persons = query.list();
        if (persons.size() > 0)
            person = persons.get(0);

        return person;
    }

    @Override
    public List<Person> findPersonByName(String name) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Person where name like ?");//from PersonInfo where name = ?XXX
        query.setString(0, "%" + name + "%");//这里是模糊查询，表示查询名字里面只要有这个名字就算一个查询结果
        List<Person> persons = query.list();
        if (persons.size() > 0)
            return persons;
        else return null;
    }

    @Override
    public List<Person> findAllPerson() {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Person");
        List<Person> persons = query.list();
        if (persons.size() > 0)
            return persons;
        else return null;
    }

    @Override
    public void updatePerson(Person person) {
        super.update(person);
    }

    @Override
    public void deletePerson(Person person) {
        super.delete(person);
    }

    @Override
    public Person retrivePersonById(int id) {
        return super.get(Person.class, id);
    }
}
