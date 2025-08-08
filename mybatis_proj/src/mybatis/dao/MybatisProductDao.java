package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.SqlSessionBean;
import mybatis.vo.CustomerVo;
import mybatis.vo.ProductVo;

public class MybatisProductDao {
    private SqlSessionFactory sessionFactory = SqlSessionBean.getSessionFactory();

    public CustomerVo selectByPk(String productId) {
        try (SqlSession sqlSession = sessionFactory.openSession()) {
            return sqlSession.selectOne("tblproduct.selectByPk");
        }
    }

    public List<ProductVo> selectAll() {
        try (SqlSession sqlSession = sessionFactory.openSession()) {
            return sqlSession.selectList("tblproduct.selectAll");
        }
    }

    public int insert(ProductVo vo) {
        try (SqlSession sqlSession = sessionFactory.openSession(true)) {
            return sqlSession.insert("tblproduct.insert", vo);
        }

    }

    public int update(ProductVo vo) {
        SqlSession sqlSession = sessionFactory.openSession(true);
        return sqlSession.update("tblproduct.update", vo);

    }

    public int delete(String pcode) {
        SqlSession sqlSession = sessionFactory.openSession(true);
        return sqlSession.delete("tblproduct.delete", pcode);
    }
}
