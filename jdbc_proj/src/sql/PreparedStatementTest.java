package sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.OracleConnection;

public class PreparedStatementTest {
    public static void main(String[] args) {
        PreparedStatement pstat = null;
        Connection conn = OracleConnection.getConnection();
        try {
            String sql = "INSERT INTO tbl_javadict(idx,english,korean,step) VALUES (?,?,?,?)";
            pstat = conn.prepareStatement(sql); // 아직 실행 값이 정해지지 않은 상태에서 객체가 생성
            // ㄴ 오라클에게 sql 이거 실행할거야....

            int idx = 36;
            String english = "exception2";
            String korean = "예외";
            String step = "3";
            // sql 실행에 필요한 값?은 파라미터. 값을 바인딩(binding)
            pstat.setInt(1, idx);
            pstat.setString(2, english);
            pstat.setString(3, korean);
            pstat.setString(4, step);
            pstat.executeUpdate();// 오라클은 구문 파싱 -> 컴파일 완료 된 상황에서 값을 대입항 실행
            System.out.println("SQL 실행 완료 : " + sql); // 오라클에게 완성된 sql 전달. 오라클 파싱->컴파일->실행
        } catch (SQLException e) {
            System.out.println("SQL 예외 : " + e.getMessage());
        } finally {
            OracleConnection.close(conn);
        }
    }
}
