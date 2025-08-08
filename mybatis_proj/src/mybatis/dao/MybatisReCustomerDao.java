package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.SqlSessionBean;
import mybatis.vo.CustomerVo;

public class MybatisReCustomerDao {
	// SqlSessionBean 클래스는 config 패키지에 있는 개발작 작성 클래스입니다.
	private SqlSessionFactory sessionFactory = SqlSessionBean.getSessionFactory();

	public CustomerVo selectByPk(String customerId) {
		try (SqlSession sqlSession = sessionFactory.openSession()) {
			return sqlSession.selectOne("tblcustomer.selectByPk", customerId);
		}

	}

	public List<CustomerVo> selectAll() {
		try (SqlSession sqlSession = sessionFactory.openSession()) {
			return sqlSession.selectList("tblcustomer.selectAll");
		}
	}

	public int insert(CustomerVo vo) {
		// sqlSession.commit(); autocommit 기본값 : false -> spring에서 Service 클래스에서 트랜젝션 처리
		// 우리는 spring이 아니므로 오토커밋 true로 하여 리팩토링
		try (SqlSession sqlSession = sessionFactory.openSession(true)) {
			return sqlSession.insert("tblcustomer.insert", vo);
		}
	}

	public int update(CustomerVo vo) {
		SqlSession sqlSession = sessionFactory.openSession();
		int result = sqlSession.update("tblcustomer.update", vo);
		sqlSession.close();
		return result;
	}

	public int delete(String customerId) {
		SqlSession sqlSession = sessionFactory.openSession();
		int result = sqlSession.delete("tblcustomer.delete", customerId);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}

}
