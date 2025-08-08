package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.ProductVo;

public class TblProductDao {

    private static final String URL = "jdbc:oracle:thin:@//localhost:1521/xe";
    private static final String USERNAME = "c##idev";
    private static final String PASSWORD = "1234";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    // 상품 조회 : 키워드로 조회(0~n개 행 조회)
    // select * from tbl_product where pname like '%kg%'
    public List<ProductVo> searchByKeyword(String keyword) {
        String sql = "SELECT * FROM tbl_product WHERE pname like '%' || ? || '%'";
        List<ProductVo> list = new ArrayList<>();
        try {
            Connection connection = getConnection();// 커넥션
            PreparedStatement pstat = connection.prepareStatement(sql);// sql 실행 준비
            // sql매개변수

            pstat.setString(1, keyword);
            // select 실행

            ResultSet rs = pstat.executeQuery();

            // rs 결과를 활용
            ProductVo vo = null;
            while (rs.next()) {// rs의 행집합은 n개 -> 반복으로 접근
                vo = new ProductVo(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4));
                // vo는 리스트에 추가
                list.add(vo);
            }
        } catch (Exception e) {
            System.out.println("예외" + e.getMessage());
            e.printStackTrace(); // 임시(상세한 예외 원인 파악)
        }
        return list;
    }

    public int insert(ProductVo vo) {
        int result = 0;
        String sql = "INSERT INTO tbl_product VALUES (?,?,?,?)";
        try (Connection connection = getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, vo.getPcode());
            pstmt.setString(2, vo.getCategory());
            pstmt.setString(3, vo.getPname());
            pstmt.setInt(4, vo.getPrice());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("예외 : " + e.getMessage());
        }
        return result;
    }

    public int delete(String pcode) {
        int result = 0;
        String sql = "DELETE FROM tbl_product WHERE pcode = ?";
        try (Connection connection = getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, pcode);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("예외 :" + e.getMessage());
        }
        return result;
    }

    public int updatePname(ProductVo vo) {
        int result = 0;
        String sql = "UPDATE tbl_product SET pname = ? WHERE pcode = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, vo.getPname());
            pstmt.setString(2, vo.getPcode());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("예외 : " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    public int updatePrice(int price, String pcode) {
        int result = 0;
        String sql = "UPDATE tbl_product SET price = ? WHERE pcode = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, price);
            pstmt.setString(2, pcode);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("예외 : " + e.getMessage());
        }
        return result;
    }

    public ProductVo selectByPk(String pcode) {
        String sql = "SELECT * FROM TBL_PRODUCT WHERE pcode = ?";
        ProductVo vo = null;
        try (Connection connection = getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, pcode);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                vo = new ProductVo(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4));
            }
        } catch (Exception e) {
            System.out.println("예외 : " + e.getMessage());
        }
        return vo; // 조회 결과(행)가 없으면 product는 null
    }

}
