package exam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.OracleConnection;

public class TblBuySelectTest {
    public static void main(String[] args) {
        selectBuyCustomerId();
    }

    public static void selectBuyCustomerId() {
        String customerid = System.console().readLine("구매 내역 조회 고객ID 입력 >>>");
        String sql = "SELECT * FROM tbl_buy WHERE customer_id = ?"; // buy_seq 컬럼 조회하기
        Connection connection = OracleConnection.getConnection();
        try (PreparedStatement pstat = connection.prepareStatement(sql);) {

            // 매개변수값 전달하기
            pstat.setString(1, customerid);
            // 실행한 결과 행집합 ResultSet 타입으로 참조하기
            ResultSet rs = pstat.executeQuery();
            boolean result = rs.next();
            // 순차적으로 결과 행 가져오기 - 컬럼 출력
            int count = 0;
            while (result) {
                System.out.println("#조회 결과 출력값");
                System.out.print("시퀀스:" + rs.getInt(1) + ",");
                System.out.print("아이디:" + rs.getString(2) + ",");
                System.out.print("코드:" + rs.getString(3) + ",");
                System.out.print("수량:" + rs.getInt(4) + ",");
                System.out.print("날짜:" + rs.getDate(5));
                System.out.println();
                result = rs.next();
            }
            if (count == 0)
                System.out.println("조회된 시퀀스 없습니다.");
            else
                System.out.println("조회 시퀀스가" + count + " 개 입니다.");
        } catch (SQLException | NumberFormatException e) {
            System.out.println("selectByPk 예외 : " + e.getMessage());
        } finally {
            OracleConnection.close(connection);
        }
    }

    public static void selectByPk() {
        String customerid = System.console().readLine("구매 내역 조회 고객ID 입력 >>>");
        String sql = ""; // buy_seq 컬럼 조회하기
        Connection connection = OracleConnection.getConnection();
        try {
            PreparedStatement pstat = connection.prepareStatement(sql);
            // 매개변수값 전달하기

            // 실행한 결과 행집합 ResultSet 타입으로 참조하기

            // 순차적으로 결과 행 가져오기 - 컬럼 출력
        } catch (SQLException | NumberFormatException e) {
            System.out.println("selectByPk 예외 : " + e.getMessage());
        } finally {
            OracleConnection.close(connection);
        }
    }
}
