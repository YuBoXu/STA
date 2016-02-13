package dao.impl;

import dao.TeamDAO;
import domain.Team;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;
import util.ConstantUtil;

import java.util.List;

/**
 * Created by martsforever on 2016/1/24.
 */
@Component
public class TeamDaoHibernate4 extends BaseDaoHibernate4<Team> implements TeamDAO {

    private int pageSize;

    /*初始化groupList每页显示的记录的个数*/
    public TeamDaoHibernate4() {
        pageSize = ConstantUtil.NUMBER_OF_RECORDS_IN_GROUPLIST;
    }

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
        Query query = session.createQuery("from Team order by id desc");
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

    @Override
    public List<Team> retriveByPageNumber(int number) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Team order by id desc");
        query.setFirstResult((number - 1) * pageSize);
        query.setMaxResults(pageSize);
        List<Team> teams = query.list();
        return teams;
    }

    @Override
    public List<Team> retriveByPageAndKey(int number, String key) {

        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Team where name like ? order by id desc");
        query.setString(0, "%" + key + "%");
        query.setFirstResult((number - 1) * pageSize);
        query.setMaxResults(pageSize);

        return query.list();
    }

    @Override
    public int retriveCounts() {

        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("select count(id) from Team");
        int result = Integer.parseInt(query.uniqueResult().toString());
        session.close();
        return result;
    }

    @Override
    public int retrivePageNumber() {
        int count = retriveCounts();
        int pagenumber = (count / pageSize);
        if (count % pageSize != 0 && count > 0) {
            pagenumber++;
        }
        return pagenumber;
    }

    @Override
    public int retrivePageNumberByKey(String key) {
        int count = retriveCountsByKey(key);
        int pagenumber = (count/pageSize);
        if (count%pageSize != 0 && count > 0){
            pagenumber ++;
        }
        return pagenumber;
    }

    @Override
    public int retriveCountsByKey(String key) {

        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("select count(id) from Team where name like ?");
        query.setString(0, "%" + key + "%");
        int result = Integer.parseInt(query.uniqueResult().toString());
        return result;
    }

    @Override
    public Team retriveById(int id) {
        return super.get(Team.class, id);
    }

    @Override
    public List<Team> retriveRelesasedTeamsById(int personId) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Team where ministerId = ? order by id desc");
        query.setInteger(0, personId);
        List<Team> teams = query.list();
        return teams;
    }
}
