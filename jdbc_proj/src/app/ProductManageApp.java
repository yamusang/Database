package app;

import java.util.List;

import dao.TblProductDao;
import vo.ProductVo;

public class ProductManageApp {
    public static void main(String[] args) {
        System.out.println("============상품관리 App===========");
        boolean run = true;
        while (run) {
            System.out.println("선택 메뉴 : 1. 등록 2. 조회");
            System.out.println("\t3. 변경 4. 삭제");
            String menu = System.console().readLine("메뉴 선택 >>>>>");
            switch (menu) {
                case "1":
                    insert();
                    break;
                case "2":
                    search();
                    break;
                case "3":
                    update();
                    break;
                case "4":
                    delete();
                    break;
                default:
                    System.out.println("없는 메뉴입니다.");
                    break;
            }
        }
    }

    private static void update() {
        boolean run = true;
        while (run) {
            String input = System.console().readLine("1. 상품명 2. 가격 3. 종료");
            TblProductDao dao = new TblProductDao();
            if (input.equals("1")) {
                String pcode = System.console().readLine("변경할 상품 코드>>>");
                String pname = System.console().readLine("변경할 이름>>>");
                ProductVo vo = new ProductVo(pcode, null, pname, 0);
                dao.updatePname(vo);
            } else if (input.equals("2")) {
                String pcode = System.console().readLine("변경할 상품 코드>>>");
                int price = Integer.parseInt(System.console().readLine("변경할 가격>>>"));
                dao.updatePrice(price, pcode);

            } else if (input.equals("3")) {
                run = false;
            } else {
                System.out.println("잘못 입력하셨습니다.");
            }
        }
    }

    private static void delete() {
        String pcode = System.console().readLine("삭제하실 상품 코드를 입력하시오>>>");
        TblProductDao dao = new TblProductDao();
        dao.delete(pcode);
    }

    private static void insert() {
        String pcode = System.console().readLine("코드 >>>");
        String category = System.console().readLine("카테고리(2자리) >>>");
        String pname = System.console().readLine("상품이름 >>>");
        int price = Integer.parseInt(System.console().readLine("가격 >>>"));
        ProductVo vo = new ProductVo(pcode, category, pname, price);
        TblProductDao dao = new TblProductDao();
        dao.insert(vo);
    }

    private static void search() {
        System.out.println("\t 상품 검색");
        String keyword = System.console().readLine("검색어 입력 >>>");
        TblProductDao dao = new TblProductDao();
        List<ProductVo> list = dao.searchByKeyword(keyword);
        for (ProductVo vo : list) {
            System.out.println("====상품정보====");
            System.out.println("[상품코드]" + vo.getPcode());
            System.out.println("[카테고리]" + vo.getCategory());
            System.out.println("[상품이름]" + vo.getPname());
            System.out.println("[상품가격]" + vo.getPrice());
        }
    }
}

// insert, update(상품명, 가격 변경), delete

// 주의 : 새 insert 한것을 delete, update 하세요. 기존 데이터는 가급적 수정X