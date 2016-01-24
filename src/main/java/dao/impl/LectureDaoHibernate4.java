package dao.impl;

import dao.LectureDAO;
import domain.Lecture;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/24.
 */
@Component
public class LectureDaoHibernate4 extends BaseDaoHibernate4<Lecture> implements LectureDAO {
    @Override
    public void addLecture(Lecture lecture) {
        super.save(lecture);
    }

    @Override
    public Lecture findLectureByName(String name) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Lecture where name = ?");
        query.setString(0, name);
        List<Lecture> lectures = query.list();
        if (lectures.size() > 0) return lectures.get(0);
        else return null;
    }

    @Override
    public List<Lecture> findAllLecture() {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Lecture");
        List<Lecture> lectures = query.list();
        return lectures;
    }

    @Override
    public void updateLecture(Lecture lecture) {
        super.update(lecture);
    }

    @Override
    public void deletelecture(Lecture lecture) {
        super.delete(lecture);
    }
}
