package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.Person;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.PersonService;
import util.ImageUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Map;

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
    String saveItem;
    private Person person;

    private File portrait;
    private String portraitFileName;
    private String portraitContentType;

    public PersonAction() {
        super();
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        personService = (PersonService) applicationContext.getBean("PersonService");
    }

    @Action(value = "savePersonInfo")
    public void savePersonInfo() throws Exception{

        System.out.println(person.toString());

        Person oldPerson = (Person) session.get("person");
        person.setAccount(oldPerson.getAccount());

        Person newPerson = personService.savePersonInfo(person,saveItem);
        session.put("person",newPerson);

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("saveStatus","success");
        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "isOldPasswordRight")
    public void isOldPasswordRight() throws Exception{
        String oldPassword = ((Person)session.get("person")).getPassword();
        System.out.println(person.toString());
        JSONObject jsonObject = new JSONObject();
        if (oldPassword.equals(person.getPassword())){
            jsonObject.put("isOldPasswordRight","yes");
        }else {
            jsonObject.put("isOldPasswordRight","no");
        }

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "saveProtrait")
    public void savePortrait() throws Exception{

        System.out.println(saveItem);

        JSONObject jsonObject = new JSONObject();
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");


        if (portrait != null){
            person = personService.retriveByAccount(((Person)session.get("person")).getAccount());
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
            personService.savePersonInfo(person,saveItem);
            session.put("person",person);

            jsonObject.put("saveStatus","success");
        }
        else {
            jsonObject.put("saveStatus","fail");
        }
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
