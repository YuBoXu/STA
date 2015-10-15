package dao.impl;

import dao.TestDao;
import domain.Test;
import org.springframework.stereotype.Component;

/**
 * Created by ZaraN on 2015/10/15.
 * test dao interface impl
 */
@Component
public class TestDaoHibernate4 extends BaseDaoHibernate4<Test> implements TestDao {
}
