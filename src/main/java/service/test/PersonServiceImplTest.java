package service.test;

import com.sun.org.apache.xpath.internal.operations.Bool;
import domain.Person;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import service.PersonService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class PersonServiceImplTest extends TestCase {
    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    PersonService personService = (PersonService) applicationContext.getBean("PersonService");

    @Test
    public void testGetPerson() throws Exception {
        Person person = personService.retriveByAccount("zhangsan");
        System.out.println(person.toString());
    }

    @Test
    public void testLogin() throws Exception {
        Person zhangsan = personService.login("zhangsan", "12346");
        if (zhangsan != null) {
            System.out.println(zhangsan.toString());
        } else System.out.println("zhangsan is null");

    }
    @Test
    public void testRegisterPerson() throws Exception {
        Person person = new Person();
        person.setName("haha");
        person.setMail("zhaoliu@qq.com");
        person.setAccount("zhaoliu");
        person.setPassword("123456");
        person.setTel("1234567891234");
        person.setQq("324324243");
        person.setWechat("1234567891234");
        person.setIntroduce("没有介绍");
        person.setJob("干事");
        person.setProtrait("#");
        person.setHobby("喜欢打篮球，游戏什么的");
        person.setSpeciality("前端设计");

        personService.register(person);
    }
    @Test
    public void testIsUsernameExist() throws Exception {
        Boolean isAccountExist = personService.isAccountExist("zhangsan");
        System.out.println(isAccountExist);
    }
}