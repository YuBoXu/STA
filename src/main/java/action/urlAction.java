package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.*;

import java.util.Map;

/**
 * Created by ZaraN on 2016/1/13.
 */
@Namespace("")
@ParentPackage("struts-default")
public class urlAction extends ActionSupport {

    @Action(value = "test")
    public void test() throws Exception {
        ActionContext actionContext = ActionContext.getContext();
        Map<String, Object> session = actionContext.getSession();
        session.put("username","111");
    }
}
