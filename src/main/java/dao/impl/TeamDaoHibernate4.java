package dao.impl;

import dao.TeamDAO;
import domain.Team;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/24.
 */
@Component
public class TeamDaoHibernate4 extends BaseDaoHibernate4<Team> implements TeamDAO {
    @Override
    public void add(Team team) {
        super.save(team);
    }

    @Override
    public Team retriveByName(String name) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Team where name = ?");
        query.setString(0, name);
        List<Team> teams = query.list();
        if (teams.size() > 0) return teams.get(0);
        else return null;
    }

    @Override
    public List<Team> retriveAll() {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Team");
        List<Team> teams = query.list();
        return teams;
    }

    @Override
    public void update(Team team) {
        super.update(team);
    }

    @Override
    public void delete(Team team) {
        super.delete(team);
    }
}
