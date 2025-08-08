package mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.SqlSessionBean;
import mybatis.vo.BuyVo;
import mybatis.vo.CustomerBuyVo;

public class BuyMapperDao {
    private SqlSessionFactory sqlSessionFactory = SqlSessionBean.getSessionFactory();

    public List<BuyVo> selectId(String customerId) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession();) {
            // BuyMapper 인터페이스의 구현체(클래스로 만든 객체)는 sqlSession 객체가 getMapper 메소드로 만듭니다.
            BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
            return mapper.selectId(customerId);
        }

    }

    public List<BuyVo> selectPcode(String pcode) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession();) {
            BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
            return mapper.selectPcode(pcode);

        }
    }

    public List<BuyVo> selectYQ(String date) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession();) {
            BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
            return mapper.selectYQ(date);

        }
    }

    public Integer selectSum(String pcode) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession();) {
            BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
            return mapper.selectSum(pcode);

        }
    }

    // 조인
    public List<CustomerBuyVo> saleByCustomer(String customer_id) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
            return mapper.selectMoneyByCustomer(customer_id);
        }
    }

    public Map<String, Integer> countByYear(String year) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
            return mapper.selectCountByYear(year);
        }
    }

    // List<Map<String, Integer>> selectAllCountByYear();

    public List<Map<String, Object>> allcountByYear() {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
            return mapper.selectAllCountByYear();
        }
    }
}
