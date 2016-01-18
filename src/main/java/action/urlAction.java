package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.deploy.net.HttpResponse;
import org.apache.struts2.convention.annotation.*;

import java.util.Map;

/**
 * Created by ZaraN on 2016/1/13.
 */
@Namespace("")
@ParentPackage("struts-default")
public class urlAction extends ActionSupport {

    @Action(value = "testLogin",results = {
            @Result(name = ActionSupport.SUCCESS,location = "/index.jsp")})
    public String testLogin() throws Exception {
        ActionContext actionContext = ActionContext.getContext();
        Map<String, Object> session = actionContext.getSession();
        session.put("username","zaranengap");
        session.put("class","1304");
        session.put("qq","597699567");
        session.put("tel","15773181012");
        session.put("introduce","啦啦啦，这里是个人简介有可能会很长所以我就多写点哈哈哈反正测试也没人看见");
        return ActionSupport.SUCCESS;
    }

    @Action(value = "testLogout")
    public void testLogout() throws Exception {
        ActionContext actionContext = ActionContext.getContext();
        Map<String, Object> session = actionContext.getSession();
        session.clear();
    }
}
