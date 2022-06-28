package kr.or.zipcoock.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.member.model.service.MemberService;
import kr.or.table.model.vo.Member;
import kr.or.table.model.vo.ProductLike;
import kr.or.table.model.vo.PwChangeVO;
import kr.or.zipcoock.cart.service.CartService;
import kr.or.zipcoock.mypage.service.MypageService;
import kr.or.zipcoock.mypage.vo.DeleteObj1;
import kr.or.zipcoock.mypage.vo.HQnaPage;
import kr.or.zipcoock.mypage.vo.InsertObj;
import kr.or.zipcoock.mypage.vo.QnaPage;
import kr.or.zipcoock.mypage.vo.SearchTool;
import kr.or.zipcoock.mypage.vo.UpdateObj1;

@Controller
public class MypageController {
	@Autowired
	MypageService service;
	@Autowired
	MemberService memberService;
	@Autowired
	CartService cartService;

	
//	addr / qna / hp /r / like
	@RequestMapping(value = "/insert.do")
	public String insert(InsertObj obj) {

		service.insert(obj);

		return "redirect:"+obj.getUrl();
	}

//	 m / pwM 
//	 addr / qna / hp /r / like
	@RequestMapping(value = "/update.do")
	public String update(UpdateObj1 obj) {

		service.update(obj);

		return "redirect:"+obj.getUrl();
	}

//	m 
//	addr / qna / hp /r + (review_img) / like
	@RequestMapping(value = "/delete.do")
	public String delete(DeleteObj1 obj) {

		System.out.println(obj.getLike());
		service.delete(obj);

		
		return "redirect:"+obj.getUrl();

	}
	
	@ResponseBody
	@RequestMapping(value = "/changePw.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String changePw(PwChangeVO pwchangeVo) {
		String msg = service.ChangePw(pwchangeVo);		 
		return new Gson().toJson(msg);
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteLike.do")
	public void deleteLike(ProductLike like) {
		DeleteObj1 obj = new DeleteObj1();
		obj.setLike(like);
		service.delete(obj);
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertLike.do")
	public void insertLike(ProductLike like) {
		InsertObj obj = new InsertObj();
		obj.setLike(like);
		service.insert(obj);
	}

	@RequestMapping(value = "/mypageGoGo.do")
	public String mypageGoGo(HttpSession session,Model model) {
		Member member = (Member)session.getAttribute("m");		
		System.out.println(member);
		session.setAttribute("m", memberService.selectOneMemberId(member.getMemberId()));
		
		return "zipcoock/mypage2/mypage";		
	}

	
	@RequestMapping(value="zcdMypage1.do")
	public String zcdMypage() {
		service.selectList(new SearchTool());
		
		return "zipcoock/mypage2/mypage";
	}
	
	@RequestMapping(value="zcdMyCoupon1.do")
	public String zcdMyCoupon() {
		return "zipcoock/mypage2/mypage/myCoupon";
	}
	
	@RequestMapping(value="zcdBookmarks1.do")
	public String zcdBookmarks() {
		return "zipcoock/mypage2/mypage/bookmarks";
	}
	
	@RequestMapping(value="zcdMyReview1.do")
	public String zcdMyReview() {
		return "zipcoock/mypage2/mypage/myReview";
	}
	
	@RequestMapping(value="zcdMyQnA1.do")
	public String zcdMyQnA() {
		return "zipcoock/mypage2/mypage/myQnA";
	}
	@RequestMapping(value="myAddrList.do")
	public String myAddrList(HttpSession session,Model model) {
		Member m = (Member)session.getAttribute("m");		
		model.addAttribute("addr", cartService.selectAddress(m.getMemberNo()));

		return "zipcoock/mypage2/mypage/myAddr";
	}

	@RequestMapping(value="zcdMyAddr.do")
	public String myAddrList2(HttpSession session,Model model) {
		Member m = (Member)session.getAttribute("m");		
		model.addAttribute("addr", cartService.selectAddress(m.getMemberNo()));
		
		return "delivery/buyer/mypage/myAddr";
	}
	
	
	@RequestMapping(value="/myLikeList.do")
	public String myLikeList(SearchTool tool, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("m");		
		tool.setMemberNo(m.getMemberNo()); 
		tool.setBasic("/myLikeList.do?");
		model.addAttribute("tool", tool);
		model.addAttribute("list", service.selectMyLike(tool));				
		return "zipcoock/mypage2/mypage/hompageQna";
	}
	@RequestMapping(value="/myReviewList.do")
	public String myReviewList(SearchTool tool, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("m");		
		tool.setMemberNo(m.getMemberNo()); 
		tool.setBasic("/myReviewList.do?");
		model.addAttribute("tool", tool);
		model.addAttribute("list", service.selectMyReview(tool));				
		return "zipcoock/mypage2/mypage/myReviews";
	}
	@RequestMapping(value="/myQnaList.do")
	public String myQnaList(SearchTool tool, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("m");		
		tool.setMemberNo(m.getMemberNo()); 
		tool.setBasic("/myQnaList.do?");
		System.out.println(tool);
		model.addAttribute("tool", tool);
		model.addAttribute("list", service.selectMyQna(tool));				
		return "zipcoock/mypage2/mypage/myQnas";
	}
	@RequestMapping(value="/myHQnaList.do")
	public String myHQnaList(SearchTool tool, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("m");		
		tool.setMemberNo(m.getMemberNo()); 
		tool.setBasic("/myHQnaList.do?");
		model.addAttribute("tool", tool);
		model.addAttribute("list", service.selectMyHQna(tool));				
		return "zipcoock/mypage2/mypage/myHQnas";
	}
	
	@RequestMapping(value="/myPaymentInfoList.do")
	public String mymyPaymentInfoList(SearchTool tool, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("m");		
		tool.setMemberNo(m.getMemberNo()); 
		tool.setBasic("/myPaymentInfoList.do?");
		model.addAttribute("tool", tool);
		model.addAttribute("list", service.selectMyPaymentList(tool));				
		return "zipcoock/mypage2/mypage/myPaymentInfos";
	}
	
	
	@RequestMapping(value="/qnaPage.do")
	public String qnaPage(int qnaNo,Model model) {
		QnaPage qna = service.selecQnaPage(qnaNo);
		model.addAttribute("qna",qna);
		return "zipcoock/mypage2/mypage/qnaPage";
	}

	@RequestMapping(value="/hqnaPage.do")
	public String hqnaPage(int qnaNo, Model model) {
		HQnaPage qna = service.selecHQnaPage(qnaNo);
		model.addAttribute("qna",qna);
		return "zipcoock/mypage2/mypage/hqnaPage";
	}
	
	
	@RequestMapping(value="/myPaymentInfoPage.do")
	public String paymentInfoPage(int paymentInfoCode, Model model) {
		model.addAttribute("pi",service.selectPaymentInfoPagePayment(paymentInfoCode));
		model.addAttribute("products",service.selectPaymentInfoPageProduct(paymentInfoCode));
		return "zipcoock/mypage2/mypage/paymentInfoPage";
	}
	
	
	
	@RequestMapping(value="/insertHQnaPage.do")
	public String insertHQnaPage() {
		return "zipcoock/mypage2/mypage/insertHQnaPage";
	}
	@RequestMapping(value="/insertQnaPage.do")
	public String insertQnaPage(int productRefNo, Model model) {
		model.addAttribute("productRefNo",productRefNo);
		return "zipcoock/mypage2/mypage/insertQnaPage";
	}
	
	@RequestMapping(value="/insertReview.do")
	public String insertReview(int orderedProductNo, int paymentInfoCode, int productNo, Model model) {
		model.addAttribute("productNo",productNo);
		model.addAttribute("orderedProductNo",orderedProductNo);
		model.addAttribute("paymentInfoCode",paymentInfoCode);

		return "zipcoock/mypage2/mypage/insertReview";
	}
	
	
	@RequestMapping(value="/updateMyReview.do")
	public String updateMyReview(int reviewNo, Model model) {
		
		model.addAttribute("r", service.selectReviewByReviewNo(reviewNo));
		System.out.println(service.selectReviewByReviewNo(reviewNo));
		System.out.println(reviewNo);
		return "zipcoock/mypage2/mypage/updateReview";
	}
	@RequestMapping(value="/updateMyReview1.do")
	public String updateMyReview(int orderedProductNo, int paymentInfoCode, int productNo, Model model) {
		model.addAttribute("r",  service.selectReviewByOrderNo(orderedProductNo));
		System.out.println(orderedProductNo);
		System.out.println(service.selectReviewByOrderNo(orderedProductNo));
		return "zipcoock/mypage2/mypage/updateReview";
	}
	
	
//	@RequestMapping(value="/insertReview1.do")
//	public String insertReview(ProductReview review, HttpSession session, HttpServletRequest request,MultipartFile[] reviewImg) {
//		//파일목록을 저장할 List
//		ArrayList<ReviewImg> list = new ArrayList<ReviewImg>();
//		
//		if(service.insertReview(review) <=0) {
//			return null;
//		};
//		if(!reviewImg[0].isEmpty()) {
//			//첨부파일이 있는경우
//			//MultipartFile을 이용하여 파일업로드 작업을 수행해야함
//			//파일을 업로드할 경우 설정
//			//request.....getrealPath -> /wabapp/폴더
//			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/review/");
//			//반복문 통해서 파일 처리(파일업로드)564 891 5428
//			for(MultipartFile file : reviewImg) {
//				//유저가 올린 파일명이 이미 업로드 폴더에 존재하면 덮어쓰기가 되어 이전파일이 삭제 
//				//파일명 중복처리
//				//사용자가 올린 파일명
//				String filename = file.getOriginalFilename(); //getOriginalFilename로 파일명 가져오기
//				System.out.println(filename+"filename");
//				//test.txt -> test.	txt ->파일명과 확장자를 나누어줌
//				String onlyFilename = filename.substring(0,filename.indexOf("."));//test 앞 0번째부터 .까지 잘라오기
//				System.out.println(onlyFilename+"onlyfilename");
//				String extention = filename.substring(filename.indexOf("."));//.부터 끝까지 잘라오기 .txt
//				System.out.println(extention+"extention");
//				//실제 업로드할 파일명을 저장할 변수
//				String filepath = null;
//				//중복된 파일 넘버링 위한 변수
//				int count=0;
//				while(true) { //파일명 복수로 업로드 가능하기 떄문에 while
//					if(count == 0) { // 파일이름 존재하지 않을경우
//						filepath = onlyFilename+extention;//test.txt
//						//실제업로드할 파일명 = test 앞 0번쨰부터 .앞까지 +.부터 끝까지 잘라온 파일명
//					}else { // 파일이름 존재할경우
//						filepath = onlyFilename+"_"+count+extention;//test_3.txt
//					}//실제업로드할 파일명 = test 앞 0번쨰부터 .앞까지 + _ + .부터 끝까지 잘라온 파일명 
//					File checkFile = new File(savePath+filepath); //실제파일이름
//					if(!checkFile.exists()) {//exists : 존재여부 존재하면 t 아니면 f
//						break; //존재하지 않을경우 t while문 빠져나감 //존재할경우 f break동작안하고 count++ 실행후 while동작
//					}
//					System.out.println(savePath+filepath+"파일경로");
//					count++;//중복시 if구문에서 break로 빠져나오지 못하고 카운트값 증가후 while문으로 복귀
//				}
//				//파일명 중복처리가 끝나면 파일업로드
//				try {
//					//중복처리가 끝난 파일명(filepath)으로 파일을 업로드
//					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
//					//업로드 속도 증가를 위한 보조 스트림
//					BufferedOutputStream bos = new BufferedOutputStream(fos);
//					//파일 업로드
//					byte[] bytes = file.getBytes(); // 파일을 바이트단위로 변환 
//					bos.write(bytes);//파일업로드
//					bos.close(); //연결 해제
//				} catch (FileNotFoundException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				//DB에 파일 업로드하기 위한 구문
//				ReviewImg fv = new ReviewImg();
//				fv.setReviewNo(review.getReviewNo());
//				fv.setFileName(filename);//getOriginalFilename로 가져온 파일명
//				fv.setFilePath(filepath);//중복체크 결과에따라 test 앞 0번쨰부터 .앞까지 + _ + .부터 끝까지 잘라온 파일명
//				list.add(fv);//리스트에 추가
//			}
//			
//		}
//		list.size();
//		//DB에 insert하기 위해 Board객체와 file이 담긴 list를 보내줌
//		service.insertReviewImgs(list);
//		
//		//-1 파일이 없는경우 || file_tbl db에 insert한 횟수와 리턴받은 list의 사이즈가 다른경우
//		return "redirect:/myReviewList.do";
//	}
//	
	
	
	
	
	
	
	
	
	
	
	
	
//	@RequestMapping(value="/productUpdate.do")
//	public String productUpdate(Model model, HttpSession session,Product product,HttpServletRequest request, ReturnPolicy returnPolicy,ShippingInfo shippingInfo,MultipartFile[] productMainImg, int status, String[] oldPath, int[] oldPathNo,int photoStatus,MultipartFile[] productDetailImg) {
//		
//		 
//
//		//파일 삭제
//		if (status == 2) { // 기존 파일을 지운 경우
//			String saveDirectory = request.getSession().getServletContext().getRealPath("resources/upload/product/");
//			for(int i=0; i < oldPath.length; i++ ) {
//			File delFile = new File(saveDirectory + "/" + oldPath[i]);
//			System.out.println(delFile);
//			delFile.delete();	 		 
//			 }
//			
//		} else {
//			
//		}
//		//파일목록을 저장할 List
//		ArrayList<ProductImg> mainList = new ArrayList<ProductImg>();
//	
//		
//		//MultipartFile[]배열은 파일을 첨부하지 않더라도 무조건 길이가 1인 배열
//		//배열의 첫번째 파일이 비어있는지 체크하는 방식으로 파일 첨부여부 확인	
//		if(productMainImg[0].isEmpty()) {
//			//첨부 파일이 없는경우	뭐안할예정
//				System.out.println("오류발생시점 테스트 2"+productMainImg);
//			}else {
//				//첨부파일이 있는경우
//				//MultipartFile을 이용하여 파일업로드 작업을 수행해야함
//				//파일을 업로드할 경우 설정
//				//request.....getrealPath -> /wabapp/폴더
//				String savePath = request.getSession().getServletContext().getRealPath("resources/upload/product/");
//				//반복문 통해서 파일 처리(파일업로드)564 891 5428
//				for(MultipartFile file : productMainImg) {
//					//유저가 올린 파일명이 이미 업로드 폴더에 존재하면 덮어쓰기가 되어 이전파일이 삭제 
//					//파일명 중복처리
//					//사용자가 올린 파일명
//					String filename = file.getOriginalFilename(); //getOriginalFilename로 파일명 가져오기
//					System.out.println(filename+"filename");
//					//test.txt -> test.	txt ->파일명과 확장자를 나누어줌
//					String onlyFilename = filename.substring(0,filename.indexOf("."));//test 앞 0번째부터 .까지 잘라오기
//					System.out.println(onlyFilename+"onlyfilename");
//					String extention = filename.substring(filename.indexOf("."));//.부터 끝까지 잘라오기 .txt
//					System.out.println(extention+"extention");
//					//실제 업로드할 파일명을 저장할 변수
//					String filepath = null;
//					//중복된 파일 넘버링 위한 변수
//					int count=0;
//					while(true) { //파일명 복수로 업로드 가능하기 떄문에 while
//						if(count == 0) { // 파일이름 존재하지 않을경우
//							filepath = onlyFilename+extention;//test.txt
//							//실제업로드할 파일명 = test 앞 0번쨰부터 .앞까지 +.부터 끝까지 잘라온 파일명
//						}else { // 파일이름 존재할경우
//							filepath = onlyFilename+"_"+count+extention;//test_3.txt
//						}//실제업로드할 파일명 = test 앞 0번쨰부터 .앞까지 + _ + .부터 끝까지 잘라온 파일명 
//						File checkFile = new File(savePath+filepath); //실제파일이름
//						if(!checkFile.exists()) {//exists : 존재여부 존재하면 t 아니면 f
//							break; //존재하지 않을경우 t while문 빠져나감 //존재할경우 f break동작안하고 count++ 실행후 while동작
//						}
//						System.out.println(savePath+filepath+"파일경로");
//						count++;//중복시 if구문에서 break로 빠져나오지 못하고 카운트값 증가후 while문으로 복귀
//					}
//					//파일명 중복처리가 끝나면 파일업로드
//					try {
//						//중복처리가 끝난 파일명(filepath)으로 파일을 업로드
//						FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
//						//업로드 속도 증가를 위한 보조 스트림
//						BufferedOutputStream bos = new BufferedOutputStream(fos);
//						//파일 업로드
//						byte[] bytes = file.getBytes(); // 파일을 바이트단위로 변환 
//						bos.write(bytes);//파일업로드
//						bos.close(); //연결 해제
//					} catch (FileNotFoundException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					} catch (IOException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
//					//DB에 파일 업로드하기 위한 구문
//					ProductImg fv = new ProductImg();
//					fv.setFileName(filename);//getOriginalFilename로 가져온 파일명
//					fv.setFilePath(filepath);//중복체크 결과에따라 test 앞 0번쨰부터 .앞까지 + _ + .부터 끝까지 잘라온 파일명
//					mainList.add(fv);//리스트에 추가
//				}
//				
//			}
//		mainList.size();
//			
//			ArrayList<ProductImg> detailList = new ArrayList<ProductImg>();
//			if(productDetailImg[0].isEmpty()) {
//				//첨부 파일이 없는경우	뭐안할예정
//					System.out.println("오류발생시점 테스트 2"+productDetailImg[0]);
//				}else {
//					//첨부파일이 있는경우
//					//MultipartFile을 이용하여 파일업로드 작업을 수행해야함
//					//파일을 업로드할 경우 설정
//					//request.....getrealPath -> /wabapp/폴더
//					String savePath = request.getSession().getServletContext().getRealPath("resources/upload/product/");
//					//반복문 통해서 파일 처리(파일업로드)564 891 5428
//					for(MultipartFile file : productDetailImg) {
//						//유저가 올린 파일명이 이미 업로드 폴더에 존재하면 덮어쓰기가 되어 이전파일이 삭제 
//						//파일명 중복처리
//						//사용자가 올린 파일명
//						String filename = file.getOriginalFilename(); //getOriginalFilename로 파일명 가져오기
//						System.out.println(filename+"filename");
//						//test.txt -> test.	txt ->파일명과 확장자를 나누어줌
//						String onlyFilename = filename.substring(0,filename.indexOf("."));//test 앞 0번째부터 .까지 잘라오기
//						System.out.println(onlyFilename+"onlyfilename");
//						String extention = filename.substring(filename.indexOf("."));//.부터 끝까지 잘라오기 .txt
//						System.out.println(extention+"extention");
//						//실제 업로드할 파일명을 저장할 변수
//						String filepath = null;
//						//중복된 파일 넘버링 위한 변수
//						int count=0;
//						while(true) { //파일명 복수로 업로드 가능하기 떄문에 while
//							if(count == 0) { // 파일이름 존재하지 않을경우
//								filepath = onlyFilename+extention;//test.txt
//								//실제업로드할 파일명 = test 앞 0번쨰부터 .앞까지 +.부터 끝까지 잘라온 파일명
//							}else { // 파일이름 존재할경우
//								filepath = onlyFilename+"_"+count+extention;//test_3.txt
//							}//실제업로드할 파일명 = test 앞 0번쨰부터 .앞까지 + _ + .부터 끝까지 잘라온 파일명 
//							File checkFile = new File(savePath+filepath); //실제파일이름
//							if(!checkFile.exists()) {//exists : 존재여부 존재하면 t 아니면 f
//								break; //존재하지 않을경우 t while문 빠져나감 //존재할경우 f break동작안하고 count++ 실행후 while동작
//							}
//							count++;//중복시 if구문에서 break로 빠져나오지 못하고 카운트값 증가후 while문으로 복귀
//						}
//						//파일명 중복처리가 끝나면 파일업로드
//						try {
//							//중복처리가 끝난 파일명(filepath)으로 파일을 업로드
//							FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
//							//업로드 속도 증가를 위한 보조 스트림
//							BufferedOutputStream bos = new BufferedOutputStream(fos);
//							//파일 업로드
//							byte[] bytes = file.getBytes(); // 파일을 바이트단위로 변환 
//							bos.write(bytes);//파일업로드
//							bos.close(); //연결 해제
//						} catch (FileNotFoundException e) {
//							// TODO Auto-generated catch block
//							e.printStackTrace();
//						} catch (IOException e) {
//							// TODO Auto-generated catch block
//							e.printStackTrace();
//						}
//						//DB에 파일 업로드하기 위한 구문
//						ProductImg fv = new ProductImg();
//						fv.setFileName(filename);//getOriginalFilename로 가져온 파일명
//						fv.setFilePath(filepath);//중복체크 결과에따라 test 앞 0번쨰부터 .앞까지 + _ + .부터 끝까지 잘라온 파일명
//						detailList.add(fv);//리스트에 추가
//						System.out.println(fv+"fv값");
//						System.out.println(detailList+"list값");
//					}
//				}
//			detailList.size();
//			
//			
//		//DB에 insert하기 위해 Board객체와 file이 담긴 list를 보내줌
//		int result = service.productUpdate(product,shippingInfo,mainList,detailList,returnPolicy,productMainImg,oldPath,oldPathNo);
//		//-1 파일이 없는경우 || file_tbl db에 insert한 횟수와 리턴받은 list의 사이즈가 다른경우
//		System.out.println(result+"result");
//		System.out.println(detailList.size()+"list.size");
//		System.out.println(mainList.size()+"list.size");
//		if(result == -1 || result != detailList.size() + mainList.size())  {
//			System.out.println(result);
//			System.out.println(detailList.size() + mainList.size());
//			model.addAttribute("msg","등록실패");
//		}else {
//			//정상인경우
//			model.addAttribute("msg","등록성공");
//		}		
//		model.addAttribute("loc","/productList.do?reqPage=1");
//		return "zipcoock/common/msg";		
//	}
//
	
	
	
	
	
	
	// review_img 등록/수정

}

//<hr/>
//addr
//<form action="/insert.do">
//	<input type="text" name="addr.memberNo" value="4"/>
//	<input type="text" name="addr.receiverName" value="receiverName"/>
//	<input type="text" name="addr.receiverPhone" value="receiverPhone"/>
//	<input type="text" name="addr.addr" value="addr"/>
//	<button type="submit">제출</button>
//</form>
//<hr/>
//qna
//<form action="/insert.do">
//	<input type="text" name="q.memberNo" value="4"/>
//	<input type="text" name="q.productRefNo" value="1"/>
//	<input type="text" name="q.qnaTitle" value="qnaTitle"/>
//	<input type="text" name="q.qnaContent" value="qnaContent"/>
//	<button type="submit">제출</button>
//</form>
//<hr/>
//hq
//<form action="/insert.do">
//	<input type="text" name="hq.memberNo" value="4"/>
//	<input type="text" name="hq.qnaTitle" value="qnaTitle"/>
//	<input type="text" name="hq.qnaContent" value="qnaContent"/>
//	<button type="submit">제출</button>
//</form>
//<hr/>
//r
//<form action="/insert.do">
//	<input type="text" name="r.memberNo" value="4"/>
//	<input type="text" name="r.star" value="5"/>
//	<input type="text" name="r.reviewContent" value="리뷰내용"/>
//	<input type="text" name="r.productNo" value="1"/>
//	<button type="submit">제출</button>
//</form>
//<hr/>
//like
//<form action="/insert.do">
//	<input type="text" name="like.memberNo" value="4"/>
//	<input type="text" name="like.productNo" value="1"/>
//	<button type="submit">제출</button>
//</form>
//
//<br/>
//update
//<hr/>
//m
//<form action="/update.do">
//	<input type="text" name="m.memberNo" value="4"/>
//	<input type="text" name="m.memberId" value="rmemberId"/>
//	<input type="text" name="m.memberName" value="member_name"/>
//	<input type="text" name="m.memberPhone" value="memberPhone"/>
//	<button type="submit">제출</button>
//</form>
//pwM
//<form action="/update.do">
//	<input type="text" name="pwM.memberNo" value="4"/>
//	<input type="text" name="pwM.memberPw" value="pwM"/>
//	<button type="submit">제출</button>
//</form>
//<hr/>
//addr
//<form action="/update.do">
//	<input type="text" name="addr.memberNo" value="4"/>
//	<input type="text" name="addr.receiverName" value="receiverName1234"/>
//	<input type="text" name="addr.receiverPhone" value="receiverPhone1234"/>
//	<input type="text" name="addr.addr" value="addr"/>
//	<input type="text" name="addr.addrNo" value="2"/>
//	<button type="submit">제출</button>
//</form>
//<hr/>
//Q
//<form action="/update.do">
//	<input type="text" name="q.memberNo" value="4"/>
//	<input type="text" name="q.qnaNo" value="1"/>
//	<input type="text" name="q.qnaTitle" value="qnaTitle1234"/>
//	<input type="text" name="q.qnaContent" value="qnaContent1234"/>
//	<button type="submit">제출</button>
//</form>
//<hr/>
//hq
//<form action="/update.do">
//	<input type="text" name="hq.memberNo" value="4"/>
//	<input type="text" name="hq.qnaNo" value="1"/>
//	<input type="text" name="hq.qnaTitle" value="qnaTitle1234"/>
//	<input type="text" name="hq.qnaContent" value="qnaContent1234"/>
//	<button type="submit">제출</button>
//</form>
//<hr/>
//r
//<form action="/update.do">
//	<input type="text" name="r.reviewNo" value="10"/>
//	<input type="text" name="r.memberNo" value="4"/>
//	<input type="text" name="r.star" value="3"/>
//	<input type="text" name="r.reviewContent" value="리뷰내용1234"/>
//	<button type="submit">제출</button>
//</form>
//<hr/>
//like
//<form action="/update.do">
//	<input type="text" name="r.memberNo" value="4"/>
//	<input type="text" name="r.productNo" value="1"/>
//	<button type="submit">제출</button>
//</form>
//<br/>
//delete
//<hr/>
//m
//<form action="/delete.do">
//	<input type="text" name="m.memberNo" value="5"/>
//	<input type="text" name="m.memberId" value="rmemberId"/>
//	<button type="submit">제출</button>
//</form>
//addr
//<form action="/delete.do">
//	<input type="text" name="addr.memberNo" value="4"/>
//	<input type="text" name="addr.addrNo" value="2"/>
//	<button type="submit">제출</button>
//</form>
//<hr/>
//Q
//<form action="/delete.do">
//	<input type="text" name="q.memberNo" value="4"/>
//	<input type="text" name="q.qnaNo" value="1"/>
//	<button type="submit">제출</button>
//</form>
//<hr/>
//hq
//<form action="/delete.do">
//	<input type="text" name="hq.memberNo" value="4"/>
//	<input type="text" name="hq.qnaNo" value="1"/>
//	<button type="submit">제출</button>
//</form>
//<hr/>
//r
//<form action="/delete.do">
//	<input type="text" name="r.memberNo" value="4"/>
//	<input type="text" name="r.reviewNo" value="1"/>
//	<button type="submit">제출</button>
//</form>
//<hr/>
//like
//<form action="/delete.do">
//	<input type="text" name="like.memberNo" value="4"/>
//	<input type="text" name="like.productNo" value="1"/>
//	<button type="submit">제출</button>
//</form>
//
