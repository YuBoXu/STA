package action;

import com.opensymphony.xwork2.ActionSupport;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    public PersonAction() {
        super();
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
}
