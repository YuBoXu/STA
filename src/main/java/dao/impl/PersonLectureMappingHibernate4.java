package dao.impl;

import dao.PersonLectureMapping;
import domain.Lecture;
import domain.Person;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

/**
 * Created by martsforever on 2016/1/24.
 */
@Component
public class PersonLectureMappingHibernate4 extends BaseDaoHibernate4 implements PersonLectureMapping {
    @Override
    public void addMapping(Lecture lecture, Person person) {
        Session session = getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();

        Lecture l = (Lecture) session.get(Lecture.class, lecture.getId());
        Person p = (Person) session.get(Person.class, person.getId());

        l.getPersonList().add(p);
        p.getLectures().add(l);

        transaction.commit();
    }

    @Override
    public void deleteMapping(Lecture lecture, Person person) {
        Session session = getSessionFactory().getCurrentSession();
        Transaction transaction = session.beginTransaction();

        Lecture l = (Lecture) session.get(Lecture.class, lecture.getId());
        Person p = (Person) session.get(Person.class, person.getId());

        l.getPersonList().remove(p);
        p.getLectures().remove(l);

        transaction.commit();
    }
}
