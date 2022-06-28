package kr.or.delivery.model.vo;

import kr.or.table.model.vo.Member;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ZcdSeller extends Member {
	private String businessNo;
}
