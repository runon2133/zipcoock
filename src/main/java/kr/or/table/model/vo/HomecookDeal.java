package kr.or.table.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HomecookDeal {
private int dealNo;
private int productNo;
private int discountRate;
private String discountDate;
private String discountendDate;
}
