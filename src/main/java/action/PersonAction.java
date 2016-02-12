package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.Person;
import domain.Team;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.PersonService;
import service.TeamService;
import util.ImageUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by martsforever on 2016/1/24.
 */
@Namespace("")
@ParentPackage("struts-default")
public class PersonAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
    Map session;
    HttpServletRequest request;
    HttpServletResponse response;
    PersonService personService;
    TeamService teamService;
    String saveItem;
    private Person person;

    private File portrait;
    private String portraitFileName;
    private String portraitContentType;

    public PersonAction() {
        super();
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        personService = (PersonService) applicationContext.getBean("PersonService");
        teamService = (TeamService) applicationContext.getBean("TeamService");
    }

    @Action(value = "savePersonInfo")
    public void savePersonInfo() throws Exception {

        System.out.println(person.toString());

        Person oldPerson = (Person) session.get("person");
        person.setAccount(oldPerson.getAccount());

        Person newPerson = personService.savePersonInfo(person, saveItem);
        session.put("person", newPerson);

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("saveStatus", "success");
        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "isOldPasswordRight")
    public void isOldPasswordRight() throws Exception {
        String oldPassword = ((Person) session.get("person")).getPassword();
        System.out.println(person.toString());
        JSONObject jsonObject = new JSONObject();
        if (oldPassword.equals(person.getPassword())) {
            jsonObject.put("isOldPasswordRight", "yes");
        } else {
            jsonObject.put("isOldPasswordRight", "no");
        }

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "saveProtrait")
    public void savePortrait() throws Exception {

        System.out.println(saveItem);

        JSONObject jsonObject = new JSONObject();
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");


        if (portrait != null) {
            person = personService.retriveByAccount(((Person) session.get("person")).getAccount());
            portraitContentType = portraitFileName.substring(portraitFileName.lastIndexOf(".") + 1);//获得正真的文件类型
            System.out.println("portraitContentType:" + portraitContentType);
            portraitFileName = person.getAccount() + "." + portraitContentType;//存储的文件名称为用户账号名

            String realpath = ServletActionContext.getServletContext().getRealPath("/person_portraits");
            /*System.out.println("realpath:" + realpath);*/

            File saveFile = new File(new File(realpath), portraitFileName);
            if (!saveFile.getParentFile().exists()) {
                System.out.println("目录不存在，重新创建目录！");
                saveFile.getParentFile().mkdirs();
            }

            FileUtils.copyFile(portrait, saveFile);
            String savePath = saveFile.getAbsolutePath();
            ImageUtils.scaleByHeightOrWodth(savePath, savePath, 200, -1);
            person.setProtrait("person_portraits/" + portraitFileName);
            personService.savePersonInfo(person, saveItem);
            session.put("person", person);

            jsonObject.put("saveStatus", "success");
        } else {
            jsonObject.put("saveStatus", "fail");
        }
        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "briefPersonInfo", results = {
            @Result(name = ActionSupport.SUCCESS, location = "/briefPersonInfo.jsp")
    })
    public String briefPersonInfo() throws Exception {
        System.out.println("hello");
        String personId = request.getParameter("id");
        System.out.println(personId);
        Person briefPersonInfo = personService.retriveById(Integer.parseInt(personId));
        session.put("briefPersonInfo", briefPersonInfo);
        return SUCCESS;
    }

    @Action(value = "siteGroupMessage", results = {
            @Result(name = ActionSupport.SUCCESS, location = "/siteGroup.jsp")
    })
    public String siteGroupMessage() throws Exception {
        person = (Person) session.get("person");
        person = personService.retriveById(person.getId());
        List<Team> releaseTeams = teamService.retriveRelesasedTeamsById(person.getId());
        Set<Team> joinTeams = person.getTeamList();
        List<Person> ministers = new ArrayList<Person>();
        System.out.println("joinTeamSize:" + joinTeams.size());
        for (Team team : joinTeams) {
            Person minister = personService.retriveById(team.getMinisterId());
            ministers.add(minister);
            System.out.println("minister" + minister.getId());
        }
        session.put("releaseTeams", releaseTeams);
        session.put("joinTeams", joinTeams);
        session.put("ministers", ministers);

        request.setAttribute("site", "siteGroup");
        return SUCCESS;
    }

    @Action(value = "groupDetail")
    public void groupDetail() throws Exception {
        String teamId = request.getParameter("teamId");
        System.out.println(teamId);
        Team team = teamService.retriveById(Integer.parseInt(teamId));
        Set<Person> groupDetail = (Set<Person>) team.getPersonList();

        List<Person> personIdANdName = new ArrayList<Person>();
        for (Person person1 : groupDetail) {
            Person person2 = new Person();
            person2.setId(person1.getId());
            person2.setName(person1.getName());
            personIdANdName.add(person2);
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("personIdANdName", personIdANdName);

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "getRidOfGroup")
    public void getRidOfGroup() throws Exception {
        String personId = request.getParameter("pId");
        String teamId = request.getParameter("pTeamId");
        teamService.getRidOfGroup(Integer.parseInt(teamId), Integer.parseInt(personId));

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("operateStatus", "success");

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "teamFallingApart")
    public void teamFallingApart() throws Exception {
        String teamId = request.getParameter("teamId");
        teamService.removeTeam(Integer.parseInt(teamId));

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("operateStatus", "success");

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().write(jsonObject.toString());
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

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public String getSaveItem() {
        return saveItem;
    }

    public void setSaveItem(String saveItem) {
        this.saveItem = saveItem;
    }

    public File getPortrait() {
        return portrait;
    }

    public void setPortrait(File portrait) {
        this.portrait = portrait;
    }

    public String getPortraitFileName() {
        return portraitFileName;
    }

    public void setPortraitFileName(String portraitFileName) {
        this.portraitFileName = portraitFileName;
    }

    public String getPortraitContentType() {
        return portraitContentType;
    }

    public void setPortraitContentType(String portraitContentType) {
        this.portraitContentType = portraitContentType;
    }
}
