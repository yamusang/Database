package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.CustomerVo;

//DAO : Data Access Object. db를 대상으로 SQL 실행을 담당하는 메소드 정의하는 클래스
public class TblCustomerDao {

    // db연결 정보를 상수로 정의합니다.
    private static final String URL = "jdbc:oracle:thin:@//localhost:1521/xe";
    private static final String USERNAME = "c##idev";
    private static final String PASSWORD = "1234";

    // db연결 객체 만드는 메소드를 dao 에서만 사용할 수 있도록 정의
    // 메소드는 Connection 객체를 리턴합니다.
    private Connection getConnection() throws SQLException {
        // db 드라이버를 자동으로 로드하여 드라이버에 맞는(dbms 종류에 따라)
        // url, 계정정보로 db와 연결되도록 객체를 만듭니다.
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    // sql 실행 메소드 정의 -> 각 sql connection 만들어서 사용하고 sql 실행 후 close()
    public int insert(CustomerVo vo) {
        int result = 0;
        String sql = "INSERT INTO tbl_customer# (customer_id, name, email, age, reg_date) " +
                "VALUES (?, ?, ?, ? , sysdate) ";
        try (Connection connection = getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, vo.getCustomerId());
            pstmt.setString(2, vo.getName());
            pstmt.setString(3, vo.getEmail());
            pstmt.setInt(4, vo.getAge());

            result = pstmt.executeUpdate(); // 정상적으로 행 추가하면 1 리턴
        } catch (Exception e) {
            // 롤백
            // insert,update,delete 중 하나만 처리하는 경우는 롤백 안해도 됩니다.
            System.out.println("예외 : " + e.getMessage());
        }
        return result;
    }

    public int update(CustomerVo vo) {
        int result = 0;
        // 이메일, 우편번호 업데이트
        String sql = "UPDATE tbl_customer# SET email = ? WHERE customer_id = ?";
        try (Connection connection = getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, vo.getEmail());
            pstmt.setString(2, vo.getCustomerId());
            result = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("예외 : " + e.getMessage());
        }
        return result;
    }

    // 기본키 값으로 삭제
    public int delete(String customerId) {
        int result = 0;
        String sql = "DELETE FROM tbl_customer# WHERE customer_id = ?";
        try (Connection connection = getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, customerId);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("예외 : " + e.getMessage());
        }
        return result;
    }

    // 기본키 custom_id 컬럼 값으로 조회 -> 결과 0 또는 1개 행
    public CustomerVo selectByPk(String customer_id) {
        String sql = "SELECT * FROM tbl_customer# WHERE customer_id = ?";
        CustomerVo customer = null;
        try (Connection connection = getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, customer_id); // selectByPk 메소드 인자값을 매개변수로 전달함.
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                customer = new CustomerVo(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4), // age 컬럼
                        rs.getDate(5)); // reg_date 컬럼
            }

        } catch (Exception e) {
            System.out.println("예외 : " + e.getMessage());
        }
        return customer;
    }
}