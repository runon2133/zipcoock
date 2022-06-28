package kr.or.delivery.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RiderStatistics {
	private int rstatisNo;
	private int riderNo;
	private int rdayStatistics;
	private int rmonthStatistics;
}
