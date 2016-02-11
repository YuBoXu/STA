package dao.impl;

import dao.PersonLectureMapping;
import dao.PersonTeamMapping;
import domain.Person;
import domain.Team;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

/**
 * Created by martsforever on 2016/1/24.
 */
@Component
public class PersonTeamMappingHibernate4 extends BaseDaoHibernate4 implements PersonTeamMapping {
    @Override
    public void addMapping(Team team,Person person) {
        Session session = getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        Person p = (Person) session.get(Person.class, person.getId());
        Team t = (Team) session.get(Team.class, team.getId());

        p.getTeamList().add(t);
        t.getPersonList().add(p);

        transaction.commit();
        session.close();
    }

    @Override
    public void deleteMapping(Team team,Person person) {
        Session session = getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        Person p = (Person) session.get(Person.class, person.getId());
        Team t = (Team) session.get(Team.class, team.getId());

        p.getTeamList().remove(t);
        t.getPersonList().remove(p);

        transaction.commit();
        session.close();
    }
}
