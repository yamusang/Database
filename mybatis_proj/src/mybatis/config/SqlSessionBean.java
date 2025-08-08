package mybatis.config;

import java.io.IOException;
import java.io.InputStream;
//Mybatis 프레임웍의 클래스들..
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionBean {
	/*
	 * SQL 실행을 위한 기존 객체 : Connection 과 PreparedStatement
	 * Mybatis 프레임웍 객체 : SqlSession 구현 객체
	 * SqlSesseionFactoryBuilder 가 SqlSessionFactory 객체 생성
	 * dao에서는 SqlSessionFactory 객체가 SqlSession 객체 생성 : 클래스 의존관계
	 * => SqlSession 객체로 db sql을 실행합니다.
	 * 
	 * https://mybatis.org/mybatis-3/ko/getting-started.html 참고로 작성합니다.
	 * 위의 사이트에서 알려준 코드는 아래 3줄 입니다. ----------------------
	 * String resource = "org/mybatis/example/mybatis-config.xml";
	 * InputStream inputStream = Resources.getResourceAsStream(resource);
	 * SqlSessionFactory sqlSessionFactory = new
	 * SqlSessionFactoryBuilder().build(inputStream);
	 * 
	 */
	public static SqlSessionFactory sqlSessionFactory;
	// static 블럭{} : static 변수를 대상으로 실행하는 코드 모아놓았습니다.
	static { // 변수들이 static 영역에 저장됩니다. why: sqlSessionFactory 를 static으로 만들기 위함.
		String resource = "mybatis/config/mybatis-config.xml"; // mybatis 설정파일
		// resource 변수에 지정된 파일을 읽기위한 입력 스트림 선언
		InputStream inputStream = null;

		try {
			inputStream = Resources.getResourceAsStream(resource); // 리소스 파일 자원 읽어오기
		} catch (IOException e) {
			System.out.println("mybatis 설정 파일 읽기 오류입니다.");
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		// 실제 db연결이 성공했을 때 정상적으로 객체가 생성.
		// 읽어온 파일로 factory 생성
	}

	// dao 에서 필요한 SqlSessionFactory 객체를 리턴 --Connection 역할
	public static SqlSessionFactory getSessionFactory() {

		return sqlSessionFactory;
	}
}

/*
 * ✅ SqlSessionFactory
 * MyBatis의 핵심 객체로, 데이터베이스 연결과 SQL 실행을 담당하는 SqlSession을 생성합니다.
 * Connection 역할
 * ✅ SqlSession
 * 실제 SQL 실행을 담당하는 객체입니다. 데이터베이스와의 연결을 관리하고 트랜잭션을 처리합니다.
 * PreparedStatement 역할
 * 🔥SQL Mapper를 설정하는 방식 : 1) 문자열로 지정하기 vs 매퍼인터페이스 만들기
 * 1) 컴파일 오류에 대한 검증을 못합니다.
 * 2) 잘못 지정하면 컴파일 오류 발생. 협업에서는 필수 - spring 에는 인터페이스 사용합니다.
 * ✅ Mapper Interface
 * SQL 매핑 정보와 연결되는 Java 인터페이스입니다. 메서드 호출을 통해 SQL을 실행할 수 있습니다.
 */
