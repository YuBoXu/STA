package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.Person;
import domain.Team;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.PersonService;
import service.TeamService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/1/25.
 */
@Namespace("")
@ParentPackage("struts-default")
public class TeamAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {

    Map session;
    HttpServletRequest request;
    HttpServletResponse response;
    TeamService teamService;
    PersonService personService;
    public TeamAction() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        teamService = (TeamService) applicationContext.getBean("TeamService");
        personService = (PersonService) applicationContext.getBean("PersonService");
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        response = httpServletResponse;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        session = map;
    }

    @Action(value = "retriveTeamByPage", results = {
            @Result(name = ActionSupport.SUCCESS, location = "/groupList.jsp")})
    public String retriveTeamByPage() throws Exception {

        String targetPage = request.getParameter("targetPage");
        int pageNumber = teamService.retrivePageNumber();
        List<Team> teams = teamService.retriveByPageNumber(targetPage);
        if (teams.size() > 0){

            List<Person> ministers = new ArrayList<Person>();
            for (Team team:teams){
                Person minister = personService.retriveById(team.getMinisterId());
                ministers.add(minister);
            }

            Map<String,Integer> startAndEnd = teamService.getStartAndEnd(Integer.parseInt(targetPage),pageNumber);
            session.put("startAndEnd",startAndEnd);
            session.put("ministers",ministers);//每个团队的队长
            session.put("targetPage",targetPage);//目标页的号码
            session.put("pageNumber",pageNumber);//总页数
            session.put("teams",teams);//团队信息数组
            session.put("retriveStatus","success");//查询结果
        }
        else {
            session.put("retriveStatus","fail");//查询结果
        }
        return SUCCESS;
    }

}
