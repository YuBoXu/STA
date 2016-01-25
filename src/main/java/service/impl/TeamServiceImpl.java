package service.impl;

import dao.TeamDAO;
import domain.Team;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.TeamService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/1/25.
 */
@Service("TeamService")
public class TeamServiceImpl implements TeamService {

    @Autowired
    private TeamDAO teamDAO;

    @Override
    public void add(Team team) {
        teamDAO.add(team);
    }

    @Override
    public boolean isTeamNameExist(String name) {
        if (teamDAO.retriveByName(name) == null)
            return false;
        else return true;
    }

    @Override
    public List<Team> retriveByPageNumber(String number) {
        int pageNumber = Integer.parseInt(number);
        return teamDAO.retriveByPageNumber(pageNumber);
    }

    @Override
    public int retriveCounts() {
        return teamDAO.retriveCounts();
    }

    @Override
    public int retrivePageNumber() {
        return teamDAO.retrivePageNumber();
    }

    @Override
    public Map<String, Integer> getStartAndEnd(int targetPage,int pageNumber) {
        int start = targetPage - 2;
        int end = targetPage + 2;

        if (pageNumber > 5) {
            while (start < 1) {
                start++;
                end++;
            }
            while (end > pageNumber) {
                start--;
                end--;
            }
        } else {
            start = 1;
            end = pageNumber;
        }
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("start", start);
        map.put("end", end);
        return map;
    }
}
