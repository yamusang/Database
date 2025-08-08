package mybatis.mapper;

import java.util.List;
import java.util.Map;

import mybatis.vo.BuyVo;
import mybatis.vo.CustomerBuyVo;

public interface BuyMapper {
    List<BuyVo> selectId(String customerId);

    List<BuyVo> selectPcode(String pcode);

    List<BuyVo> selectYQ(String date);

    Integer selectSum(String pcode);

    // join

    List<CustomerBuyVo> selectMoneyByCustomer(String customer_id);

    // count 집계 함수

    Map<String, Integer> selectCountByYear(String year);

    List<Map<String, Object>> selectAllCountByYear();
}
