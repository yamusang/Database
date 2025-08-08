
import mybatis.dao.MybatisProductDao;
import mybatis.vo.ProductVo;

public class App {
    public static void main(String[] args) throws Exception {
        // MybatisReCustomerDao dao = new MybatisReCustomerDao();
        // int result = dao.insert(new CustomerVo("hongGS3", "홍길순3", "hgs2@a.com", 22,
        // null));
        // System.out.println("result : " + result);

        // System.out.println(dao.selectByPk("hongGS")); // 있는 PK 값
        // System.out.println(dao.selectByPk("hongGSS")); // 없는 pk 값

        MybatisProductDao dao = new MybatisProductDao();
        for (ProductVo pv : dao.selectAll()) {
            System.out.print(pv.getPcode() + ",");
            System.out.print(pv.getCategory() + ",");
            System.out.print(pv.getPname() + ",");
            System.out.println(pv.getPrice());
        }

        ProductVo vo = new ProductVo("D533243", "D1", null, 120000);

        dao.insert(vo);
        // dao.update(vo);
        // dao.delete("A35623");
    }

}
