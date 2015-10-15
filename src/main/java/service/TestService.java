package service;

import domain.Test;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by ZaraN on 2015/10/15.
 * service interface of test domain
 */
@Service
@Transactional
public interface TestService {
    int addTest(Test test);
}
