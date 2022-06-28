package kr.or.zipcoock.board.vo;

import java.util.ArrayList;


import kr.or.zipcoock.board.vo.ReviewImg;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	ProductPageReview r;
	ArrayList<ReviewImg> img;

}
