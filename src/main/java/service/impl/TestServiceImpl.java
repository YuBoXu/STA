package service.impl;

import dao.TestDao;
import domain.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.TestService;

/**
 * Created by ZaraN on 2015/10/15.
 * test service impl
 */
@Service
public class TestServiceImpl implements TestService {

    @Autowired
    private TestDao testDao;

    public void setTestDao(TestDao testDao) {
        this.testDao = testDao;
    }

    public TestDao getTestDao() {
        return testDao;
    }

    public int addTest(Test test) {
        return (Integer)testDao.save(test);
    }
}
