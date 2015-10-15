import domain.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.TestService;

/**
 * Created by ZaraN on 2015/10/15.
 * this class is built to test spring and hibernate
 */
public class MainForTest {

    private TestService testService;

    public static void main(String[] args) {
        Test test = new Test();
        test.setUsername("66");
        test.setPassword("55");
        MainForTest m = new MainForTest();
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        m.testService = (TestService)applicationContext.getBean("TestService");
        try{
            if(m.testService.addTest(test) > 0)
                System.out.println("add successfully");
            else
                System.out.println("add fail");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
