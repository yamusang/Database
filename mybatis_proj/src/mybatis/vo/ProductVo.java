package mybatis.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class ProductVo {
    private String pcode;
    private String category;
    private String pname;
    private int price;
}
