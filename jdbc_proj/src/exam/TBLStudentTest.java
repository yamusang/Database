package exam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.OracleConnection;

public class TBLStudentTest {
    public static void main(String[] args) {

        // updateAddress("2025005", "서울시 구로구 구로동");
        addStudent();

    }

    public static void addStudent() {
        String stuno = System.console().readLine("학번>>>");
        String name = System.console().readLine("이름>>>");
        String temp = System.console().readLine("나이>>>");
        String address = System.console().readLine("주소>>>");

        if (stuno.length() == 0 || name.length() == 0) {
            System.out.println("필수 입력입니다.");
        } else {
            Integer age = null;
            if (address.length() == 0)
                address = null;

            if (temp.length() != 0) {
                age = Integer.parseInt(temp);
            }
            insert(stuno, name, age, address);

        }

    }

    private static void updateAddress(String stuno, String address) {
        String sql = "update tbl_student set address = ? where stuno = ?";
        try (// try with resources : 자동 close
                Connection connection = OracleConnection.getConnection();
                PreparedStatement pstat = connection.prepareStatement(sql);) {
            connection.setAutoCommit(false);
            // ⭕직접 commit을 해야 테이블에 반영. '오라클'은 commit은 자동, rollback은 명령어로.
            pstat.setString(1, address);
            pstat.setString(2, stuno);
            pstat.executeUpdate();
            // conn.rollback(); insert 명령이 테이블에 반영이 안됩니다.
        } catch (SQLException e) {
            System.out.println("SQL 예외" + e.getMessage());
            // finally 없음. 자동 close 구문
        }
    }

    private static void insert(String stuno, String name, int age, String address) {
        Connection conn = OracleConnection.getConnection();
        PreparedStatement pstat = null;
        String sql = "insert into tbl_student(stuno,name,age,address) values (?,?,?,?)";
        try {
            conn.setAutoCommit(false);
            pstat = conn.prepareStatement(sql);

            pstat.setString(1, stuno);
            pstat.setString(2, name);
            pstat.setInt(3, age);
            pstat.setString(4, address);
            pstat.execute(); // 오토커밋 반영하는 메소드
            int test = Integer.parseInt(name);
            // conn.commit();
            System.out.println("1개 행이 저장되었습니다.");

        } catch (SQLException | NumberFormatException e) {
            try {
                conn.rollback();
                System.out.println("롤백 했습니다.");
                System.out.println("insert 예외" + e.getMessage());
            } catch (SQLException e1) {
                // TODO: handle exception
            }
        } finally {
            // OracleConnection.close(conn); // close가 없으면 세션이 유지. commit안됨.
            try {
                if (pstat != null)
                    pstat.close();
            } catch (SQLException e) {
            }
        }
    }
}
