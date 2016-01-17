import domain.Test;
import domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.TestService;
import service.UserService;

/**
 * Created by ZaraN on 2015/10/15.
 * this class is built to test spring and hibernate
 */
public class MainForTest {

    private UserService userService;

    public static void main(String[] args) {
        User user = new User();
        user.setID(1);
        user.setUsername("123");
        user.setPassword("1234");
        MainForTest m = new MainForTest();

        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        m.userService = (UserService)applicationContext.getBean("UserService");
        try{
            System.out.println(m.userService.getCount());
            if(m.userService.login("123","1234"))
                System.out.println("successfully");
            else
                System.out.println("fail");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
