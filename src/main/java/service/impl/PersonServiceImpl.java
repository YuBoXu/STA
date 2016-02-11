package service.impl;

import dao.PersonDao;
import domain.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.PersonService;

/**
 * Created by martsforever on 2016/1/22.
 */
@Service("PersonService")
public class PersonServiceImpl implements PersonService {

    @Autowired
    PersonDao personDao;

    @Override
    public Person login(String account, String password) {
        return personDao.retriveByAccountAndPassword(account, password);
    }

    @Override
    public Person retriveByAccount(String account) {
        return personDao.retriveByAccount(account);
    }

    @Override
    public void register(Person person) {
        personDao.add(person);
    }

    @Override
    public boolean isAccountExist(String name) {
        Boolean isExist = false;
        Person person = personDao.retriveByAccount(name);
        if (person == null) isExist = false;
        else isExist = true;
        return isExist;
    }

    @Override
    public Person retriveById(int id) {
        return personDao.retriveById(id);
    }

    @Override
    public Person savePersonInfo(Person person, String saveItem) {
        Person oldPerson = retriveByAccount(person.getAccount());

        if (saveItem.equals("personInfo")){
            oldPerson.setClasses(person.getClasses());
            oldPerson.setQq(person.getQq());
            oldPerson.setTel(person.getTel());
            oldPerson.setMail(person.getMail());
            oldPerson.setWechat(person.getWechat());
            oldPerson.setHobby(person.getHobby());
            oldPerson.setSpeciality(person.getSpeciality());
            oldPerson.setIntroduce(person.getIntroduce());
        }else if (saveItem.equals("password")){
            oldPerson.setPassword(person.getPassword());
        }else if (saveItem.equals("avatar")){
            oldPerson.setProtrait(person.getProtrait());
        }
        personDao.update(oldPerson);
        return oldPerson;
    }
}
