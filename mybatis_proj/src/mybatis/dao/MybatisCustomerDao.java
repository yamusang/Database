package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.SqlSessionBean;
import mybatis.vo.CustomerVo;

public class MybatisCustomerDao {
	// SqlSessionBean 클래스는 config 패키지에 있는 개발작 작성 클래스입니다.
	private SqlSessionFactory sessionFactory = SqlSessionBean.getSessionFactory();

	/*
	 * 마이바티스의 SqlSession 객체가 SQL 을 실행합니다.
	 * SQL 실행 메소드(CRUD) : insert() , update() , delete() 메소드 데이터 조작(추가/삭제/변경)
	 * selectOne() 메소드는 select 조회 결과가 1개 행 일때
	 * selectList() 메소드는 select 조회 결과가 여러개 행 일때 구분해서 사용
	 * 위 5개 메소드의 인자 : 문자열 -> 매퍼 XML의 네임스페이스.id 값
	 * 선택적인 두번째 인자 -> SQL 실행에 필요한 파라미터값
	 */
	// 0~1개 행 리턴하는 SQL. customerId 는 SQL 실행 매개변수 값(매퍼 ParameterType="String")
	public CustomerVo selectByPk(String customerId) {
		SqlSession sqlSession = sessionFactory.openSession();

		// select SQL 조회 결과 행이 1개 : selectOne 메소드
		// sql 에 매개변수(파라미터)가 있으면 두번째 인자로 전달
		CustomerVo vo = sqlSession.selectOne("tblcustomer.selectByPk", customerId);
		sqlSession.close(); // 리팩토링 : sql 실행의 오류 발생할 때 close 실행 보장 못함. try(){}로 변경
		return vo;
	}

	// 0~n개 행 리턴하는 SQL. SQL 실행 매개변수 값 없습니다.(매퍼 resultType="CustomerVo")
	public List<CustomerVo> selectAll() {
		SqlSession sqlSession = sessionFactory.openSession();
		// select SQL 조회 결과 행이 여러개 : selectList 메소드
		List<CustomerVo> list = sqlSession.selectList("tblcustomer.selectAll");
		sqlSession.close();
		return list;
	}

	// 마이바티스는 auto commit 이 아닙니다.
	public int insert(CustomerVo vo) {
		SqlSession sqlSession = sessionFactory.openSession();

		int result = sqlSession.insert("tblcustomer.insert", vo);
		// sqlSession.commit(); autocommit 기본값 : false -> spring에서 Service 클래스에서 트랜젝션 처리
		sqlSession.close();
		return result;
	}

	public int update(CustomerVo vo) {
		SqlSession sqlSession = sessionFactory.openSession();
		int result = sqlSession.update("tblcustomer.update", vo);
		sqlSession.commit();
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
