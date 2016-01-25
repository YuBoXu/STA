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

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by martsforever on 2016/1/22.
 */
@Namespace("")
@ParentPackage("struts-default")
public class RegisterAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
    Map session;
    HttpServletRequest request;
    HttpServletResponse response;
    PersonService personService;
    Person person;
    private File portrait;
    private String portraitFileName;
    private String portraitContentType;

    @Action(value = "register", results = {
            /*用户注册成功，跳转到用户信息界面*/
            @Result(name = ActionSupport.SUCCESS, location = "/personInfo.jsp"),
            /*用户名已存在，什么事也不干，直接跳转到用户信息界面*/
            @Result(name = ActionSupport.NONE, location = "/personInfo.jsp")})
    public String register() throws ServletException, IOException {

        if (personService.isAccountExist(person.getAccount())){
            return ActionSupport.NONE;
        }

        if (portrait != null) {
            /*System.out.println(portrait == null);//判断头像文件是否为空
            System.out.println(portraitFileName);//查看上传的图片的名称(包括文件类型，比如helloman.jpg)
            System.out.println(portraitContentType);//查看文件的类型，比如image/jpeg*/

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
            person.setProtrait("person_portraits/" + portraitFileName);
            /*System.out.println("protrait" + person.getProtrait());
            System.out.println("文件上传成功：" + saveFile.getAbsolutePath());*/
        }
        else{
            person.setProtrait("img/avatar/avatar.png");
        }
        personService.register(person);//将用户数据持久化
        session.put("person", person);
        return SUCCESS;
    }

    @Action(value = "usernameIsExist")
    public void isUsernameExist() throws Exception {
        String username = request.getParameter("username");
        System.out.println(username);
        Boolean isExist = personService.isAccountExist(username);

        JSONObject jsonObject = new JSONObject();

        if (isExist) {
            jsonObject.put("isExist", "yes");
        } else {
            jsonObject.put("isExist", "no");
        }

        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();

        System.out.println(jsonObject.toString());
        writer.write(jsonObject.toString());
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

    public RegisterAction() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
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

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }
}
