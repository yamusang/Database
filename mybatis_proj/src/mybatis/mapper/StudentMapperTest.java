package mybatis.mapper;

import mybatis.vo.StudentVo;

public class StudentMapperTest {
    public static void main(String[] args) {
        StudentMapperDao dao = new StudentMapperDao();
        // System.out.println("insert result : " + dao.insert(new StudentVo("2024999",
        // "최구", 21, "서울시")));
        System.out.println("insert result : " + dao.insert(new StudentVo("2024990", "최구영", null, "서울시"))); // Wrapper클래스
        // 타입일 때만 null값을 가질 수 있습니다.
    }
}
