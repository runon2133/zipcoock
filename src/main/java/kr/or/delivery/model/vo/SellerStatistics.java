package kr.or.delivery.model.vo;

import kr.or.table.model.vo.Member;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SellerStatistics extends Member {
	private int sstatisNo;
	private int sdayStatistics;
	private int smonthStatistics;
}
