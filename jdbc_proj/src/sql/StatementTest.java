package sql;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import util.OracleConnection;

public class StatementTest {
    public static void main(String[] args) {
        Statement stat = null; // 마지막에 close 필요
        Connection conn = OracleConnection.getConnection();
        try {
            stat = conn.createStatement(); // SQL 실행 객체를 connection으로 생성.
            String sql = "INSERT INTO tbl_javadict(idx,english,korean,step) VALUES (33,'connection','연결. 접속','2')";
            int idx = 34;
            String english = "statement";
            String korean = "표현법,진술,성명서";
            String step = "2";
            sql = "INSERT INTO tbl_javadict(idx,english,korean,step) VALUES (" + idx +
                    ",'" + english + "','" + korean
                    + "', '" + step + "')";
            // 변수 처리를 했지만 최종적으로 sql 변수에 하나의 실행 SQL 이 저장되어 있습니다.
            stat.execute(sql); // sql을 컴파일하여 오라클에 전달
            System.out.println("SQL 실행 완료 : " + sql);
        } catch (SQLException e) {
            System.out.println("SQL 예외 : " + e.getMessage());
        } finally {
            OracleConnection.close(conn);
        }
    }
}
