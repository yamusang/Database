package mybatis.mapper;

import java.util.List;
import java.util.Map;

import mybatis.vo.BuyVo;

public class BuyMapperTest {
    public static void main(String[] args) {
        BuyMapperDao dao = new BuyMapperDao();
        for (BuyVo vo : dao.selectId("mina012")) {
            System.out.print(vo.getBuy_seq() + ",");
            System.out.print(vo.getPcode() + ",");
            System.out.print(vo.getCustomer_id() + ",");
            System.out.println(vo.getQuantity() + ",");
            System.out.println(vo.getBuydate());
        }
        System.out.println("=================");
        for (BuyVo vo : dao.selectPcode("JINRMn5")) {
            System.out.print(vo.getBuy_seq() + ",");
            System.out.print(vo.getPcode() + ",");
            System.out.print(vo.getCustomer_id() + ",");
            System.out.print(vo.getQuantity() + ",");
            System.out.println(vo.getBuydate());
        }

        System.out.println("=================");
        for (BuyVo vo : dao.selectYQ("2024")) {
            System.out.print(vo.getBuy_seq() + ",");
            System.out.print(vo.getPcode() + ",");
            System.out.print(vo.getCustomer_id() + ",");
            System.out.print(vo.getQuantity() + ",");
            System.out.println(vo.getBuydate());
        }

        System.out.println(dao.selectSum("JINRMn5"));
        System.out.println("==============================");
        String customerId = "hongGD";
        System.out.println(dao.saleByCustomer(customerId));
        // 리턴 타입이 Map인 경우
        System.out.println("============================");
        String year = "2024";
        Map<String, Integer> result = dao.countByYear(year);
        System.out.println(year + "년도 구매 건수 : " + dao.countByYear(year));
        // 2024년도 구매 건수 : {YEAR=2024, COUNT=3} : year는 key, 2024는 값(value), count는 key,
        System.out.println(result.get("YEAR"));
        System.out.println(result.get("COUNT"));
        // 3은 값
        System.out.println("============================");
        System.out.println("--년도\t구매건수\t수량합계--");
        // Map에서는 오라클 타입 number의 자리수가 없으면 BigDecimal로 가져옵니다.
        // Map의 제너릭 타입을 Integer 사용 ❌ Object로 대체 %d, %s 포맷 문자는 사용 못함.
        List<Map<String, Object>> list = dao.allcountByYear();
        for (Map<String, Object> one : list) {
            System.out.println(String.format(one.get("YEAR") + "\t" + one.get("COUNT") + "\t\t" + one.get("SUM")));
        }

    }
}
