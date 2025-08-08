package app;

import dao.TblCustomerDao;
import vo.CustomerVo;

public class CustomerManagerApp {
    public static void main(String[] args) {
        System.out.println("============고객관리 App===========");
        boolean run = true;
        while (run) {
            System.out.println("선택 메뉴 : 1. 고객 등록 2. 고객 정보 조회");
            System.out.println("\t3.고객 이메일 변경 4. 회원 탈퇴");
            String menu = System.console().readLine("메뉴 선택 >>>>>");
            switch (menu) {
                case "1":
                    register();
                    break;
                case "2":
                    printInfo();
                default:
                    System.out.println("없는 메뉴입니다.");
                    break;
            }
        }
    }

    private static void printInfo() {
        System.out.println("\t :: 고객 정보 조회 ::");
        String customerid = System.console().readLine("아이디 입력 >>>");
        TblCustomerDao dao = new TblCustomerDao();
        CustomerVo customer = dao.selectByPk(customerid);
        System.out.println("[이름]" + customer.getName());
        System.out.println("[이메일]" + customer.getEmail());
        System.out.println("[나이]" + (customer.getAge() == 0 ? "미입력" : customer.getAge()));
        System.out.println("[가입일자]" + customer.getRegDate());

    }

    private static void register() {
        System.out.println("\t ::고객 등록 ::");
        boolean run = true;
        TblCustomerDao dao = new TblCustomerDao();
        String customerId = null;
        while (run) {
            customerId = System.console().readLine("사용할 아이디 >>>");
            if (dao.selectByPk(customerId) != null) {
                System.out.println("이미 사용중인 고객 아이디 입니다.");
                continue;
            } else

                run = false;

            // customerId는 PK -중복 검사 필요

        }
        String name = System.console().readLine("성명 >>>");
        String email = System.console().readLine("이메일 >>>");

        int age = 0;
        run = true;
        while (run) {
            String temp = System.console().readLine("나이(미입력은 엔터) >>>");
            if (temp.length() == 0)
                break;
            try {

                age = Integer.parseInt(temp);
                if (age < 0 || age > 100) {
                    throw new Exception("나이 값은 0~100입니다.");
                } else {
                    run = false;
                }

            } catch (NumberFormatException e) {
                // TODO: handle exception
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

        }
        // 예외처리 NumberFormatException 필요
        CustomerVo vo = new CustomerVo(customerId, name, email, age, null);
        // 🔥dao의 insert 실행

        if (dao.insert(vo) == 0)
            System.out.println("고객 등록 실패!!");
        else
            System.out.println("고객 등록 완료");
    }
}