package dao.impl;

import dao.CompetitionDAO;
import domain.Competition;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/24.
 */
@Component
public class CompetitionDaoHibernate4 extends BaseDaoHibernate4<Competition> implements CompetitionDAO {
    @Override
    public void addOneCompetition(Competition competition) {
        super.save(competition);
    }

    @Override
    public Competition retriveOneCompetitionByName(String name) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Competition where name = ?");
        query.setString(0, name);
        List<Competition> competitions = query.list();
        if (competitions.size() > 0) {
            return competitions.get(0);
        } else return null;
    }

    @Override
    public List<Competition> getAllCompetitionInfo() {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Competition");
        List<Competition> competitions = query.list();
        return competitions;
    }

    @Override
    public void updateCompetition(Competition competition) {
        super.update(competition);
    }

    @Override
    public void deleteCompetition(Competition competition) {
        super.delete(competition);
    }
}
