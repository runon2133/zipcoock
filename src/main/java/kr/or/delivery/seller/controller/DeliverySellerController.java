package kr.or.delivery.seller.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.delivery.model.vo.AddMenu;
import kr.or.delivery.model.vo.Menu;
import kr.or.delivery.model.vo.MenuGroup;
import kr.or.delivery.model.vo.MenuOrder;
import kr.or.delivery.model.vo.ReviewComment;
import kr.or.delivery.model.vo.StoreLogo;
import kr.or.delivery.model.vo.ZcdCart;
import kr.or.delivery.model.vo.ZcdOrderPage;
import kr.or.delivery.model.vo.ZcdReview;
import kr.or.delivery.model.vo.ZcdReviewPage;
import kr.or.delivery.model.vo.ZcdStore;
import kr.or.delivery.seller.model.service.DeliverySellerService;
import kr.or.table.model.vo.Member;

@Controller
public class DeliverySellerController {

	@Autowired
	private DeliverySellerService service;
	
	@RequestMapping(value="/manageMarketFrm.do")
	public String manageMarketFrm(Member member, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("m");
		ArrayList<ZcdStore> list = service.selectZcdStoreList(m.getMemberNo());
		model.addAttribute("list", list);
		return "delivery/seller/manageMarketFrm";
	}
	
	@RequestMapping(value="/addMarketFrm.do")
	public String addMarketFrm() {
		return "delivery/seller/addMarketFrm";
	}
	
	@RequestMapping(value="/manageMenuFrm.do")
	public String manageMenuFrm(Member member, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("m");
		ArrayList<ZcdStore> list = service.selectZcdStoreList(m.getMemberNo());
		model.addAttribute("list", list);
		return "delivery/seller/manageMenuFrm";
	}
	
	@RequestMapping(value="/storeNameCheck.do")
	@ResponseBody
	public int storeNameCheck(String storeName) {
		String sn = service.selectOneStoreName(storeName);
		if (sn == null) {
			return 0;
		} else {
			return 1;
		}
	}
	
	@RequestMapping(value="/storeNameCheck2.do")
	@ResponseBody
	public int storeNameCheck2(String storeName, int storeNo) {
		String sn1 = service.selectOneStoreName(storeName);
		String sn2 = service.selectOneStoreName2(storeNo);
		if (sn1 == null) {
			return 0;
		} else if (sn1.equals(sn2)) {
			return 0;
		} else {
			return 1;
		}
	}
	
	@RequestMapping(value="/storePhoneCheck.do")
	@ResponseBody
	public int storePhoneCheck(String storePhone) {
		String sp = service.selectOneStorePhone(storePhone);
		if (sp == null) {
			return 0;
		} else {
			return 1;
		}
	}
	
	@RequestMapping(value="/storePhoneCheck2.do")
	@ResponseBody
	public int storePhoneCheck2(String storePhone, int storeNo) {
		String sp1 = service.selectOneStorePhone(storePhone);
		String sp2 = service.selectOneStorePhone2(storeNo);
		if (sp1 == null) {
			return 0;
		} else if (sp1.equals(sp2)) {
			return 0;
		} else {
			return 1;
		}
	}
	
	@RequestMapping(value="/addMarket.do")
	public String addMarket(ZcdStore zs, MultipartFile[] files, HttpServletRequest request, Model model) {
		// 파일목록을 저장할 List
		ArrayList<StoreLogo> list = new ArrayList<StoreLogo>();
		if (files[0].isEmpty()) {
			// 첨부파일이 없는 경우
		} else {
			// 첨부파일이 있는 경우
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/zcdSeller/");
			// 반복문을 이용해서 파일 처리(파일업로드)
			for (MultipartFile file : files) {
				// 사용자가 올린 파일명
				String filename = file.getOriginalFilename(); // 치킨_로고.png
				String onlyFilename = filename.substring(0, filename.indexOf(".")); // 치킨_로고
				String extention = filename.substring(filename.indexOf(".")); // .png
				String filepath = null;
				// 파일명 중복 시 숫자를 붙이는 코드
				int count = 0;
				while (true) {
					if (count == 0) {
						filepath = onlyFilename + extention; // 치킨_로고.png
					} else {
						filepath = onlyFilename + "_" + count + extention; // 치킨_로고_1.png
					}
					File checkFile = new File(savePath + filepath); // /resources/upload/zcdSeller/치킨_로고.png
					if (!checkFile.exists()) {
						break;
					}
					count++;
				}
				// 파일명 중복처리가 끝나면 파일 업로드
				try {
					// 중복처리가 끝난 파일명(filepath)으로 파일을 업로드
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					// 업로드 속도 증가를 위한 보조스트림
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					// 파일 업로드
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				StoreLogo sl = new StoreLogo();
				sl.setFilename(filename);
				sl.setFilepath(savePath);
				list.add(sl);
			}
		}
		int result = service.addMarket(zs, list);
		if (result == -1 || result != list.size()) {
			model.addAttribute("msg", "매장이 등록되지 않았습니다.");
			model.addAttribute("loc", "/manageMarketFrm.do");
		} else {
			model.addAttribute("msg", "매장이 등록되었습니다.");
			model.addAttribute("loc", "/manageMarketFrm.do");
		}
		return "zipcoock/common/msg";
	}
	
	@RequestMapping(value="/changeState.do")
	@ResponseBody
	public int changeState(ZcdStore zs, Model model) {
		int result = service.changeState(zs);
		if (result > 0) {
			return 0;
		} else {
			return 1;
		}
	}
	
	@RequestMapping(value="/selectOneMarket.do")
	public String selectOneMarket(int storeNo, Model model) {
		ZcdStore zs = service.selectOneMarket(storeNo);
		model.addAttribute("zs", zs);
		return "delivery/seller/selectOneMarketFrm";
	}
	
	@RequestMapping(value="/modifyMarket.do")
	public String modifyMarket(ZcdStore zs, int status, MultipartFile[] files, HttpServletRequest request, Model model) {
		// 파일목록을 저장할 List
		ArrayList<StoreLogo> list = new ArrayList<StoreLogo>();
		if (files[0].isEmpty()) {
			// 첨부파일이 없는 경우
			
		} else {
			// 첨부파일이 있는 경우
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/zcdSeller/");
			// 반복문을 이용해서 파일 처리(파일업로드)
			for (MultipartFile file : files) {
				// 사용자가 올린 파일명
				String filename = file.getOriginalFilename(); // 치킨_로고.png
				String onlyFilename = filename.substring(0, filename.indexOf(".")); // 치킨_로고
				String extention = filename.substring(filename.indexOf(".")); // .png
				String filepath = null;
				// 파일명 중복 시 숫자를 붙이는 코드
				int count = 0;
				while (true) {
					if (count == 0) {
						filepath = onlyFilename + extention; // 치킨_로고.png
					} else {
						filepath = onlyFilename + "_" + count + extention; // 치킨_로고_1.png
					}
					File checkFile = new File(savePath + filepath); // /resources/upload/zcdSeller/치킨_로고.png
					if (!checkFile.exists()) {
						break;
					}
					count++;
				}
				// 파일명 중복처리가 끝나면 파일 업로드
				try {
					// 중복처리가 끝난 파일명(filepath)으로 파일을 업로드
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					// 업로드 속도 증가를 위한 보조스트림
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					// 파일 업로드
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				StoreLogo sl = new StoreLogo();
				sl.setFilename(filename);
				sl.setFilepath(savePath);
				list.add(sl);
			}
		}
		int result = 0;
		if (status == 1) {
			result = service.modifyMarket(zs);
		} else if (status == 2) {
			result = service.modifyMarket(zs, list);
		}
		if (result == -1) {
			model.addAttribute("msg", "매장 정보가 변경되지 않았습니다.");
			model.addAttribute("loc", "/manageMarketFrm.do");
		} else {
			model.addAttribute("msg", "매장 정보가 변경되었습니다.");
			model.addAttribute("loc", "/manageMarketFrm.do");
		}
		return "zipcoock/common/msg";
	}
	
	@RequestMapping(value="/deleteOneMarket.do")
	public String deleteOneMarket(int storeNo, Model model) {
		int result = service.deleteOneMarket(storeNo);
		if (result > 0) {
			model.addAttribute("msg","매장 정보가 삭제되었습니다.");
			model.addAttribute("loc", "/manageMarketFrm.do");
		} else {
			model.addAttribute("msg","매장 정보가 삭제되지 않았습니다.");
			model.addAttribute("loc", "/manageMarketFrm.do");
		}
		return "zipcoock/common/msg";
	}
	
	@RequestMapping(value="/addMenuGroupFrm.do")
	public String addMenuGroupFrm(int storeNo, HttpSession session, Model model) {
		ArrayList<MenuGroup> list = service.selectMenuGroupList(storeNo);
		model.addAttribute("list", list);
		model.addAttribute("storeNo", storeNo);
		return "delivery/seller/addMenuGroupFrm";
	}
	
	@RequestMapping(value="/addMenuGroup.do")
	public String addMenuGroup(MenuGroup mg, Model model) {
		int result = service.addMenuGroup(mg);
		if (result > 0) {
			model.addAttribute("msg","메뉴그룹이 등록되었습니다.");
			model.addAttribute("loc", "/addMenuGroupFrm.do?storeNo=" + mg.getStoreNo());
		} else {
			model.addAttribute("msg","메뉴그룹이 등록되지 않았습니다.");
			model.addAttribute("loc", "/addMenuGroupFrm.do?storeNo=" + mg.getStoreNo());
		}
		return "zipcoock/common/msg";
	}
	
	/*
	@RequestMapping(value="/modifyMenuGroup.do")
	public String modifyMenuGroup(MenuGroup mg, Model model) {
		int result = service.modifyMenuGroup(mg);
		if (result > 0) {
			model.addAttribute("msg","메뉴그룹이 변경되었습니다.");
			model.addAttribute("loc", "/addMenuGroupFrm.do?storeNo=" + mg.getStoreNo());
		} else {
			model.addAttribute("msg","메뉴그룹이 변경되지 않았습니다.");
			model.addAttribute("loc", "/addMenuGroupFrm.do?storeNo=" + mg.getStoreNo());
		}
		return "zipcoock/common/msg";
	}
	*/
	
	@RequestMapping(value="/deleteMenuGroup.do")
	public String deleteMenuGroup(MenuGroup mg, Model model) {
		int result = service.deleteMenuGroup(mg.getGroupNo());
		if (result > 0) {
			model.addAttribute("msg","메뉴그룹이 삭제되었습니다.");
			model.addAttribute("loc", "/addMenuGroupFrm.do?storeNo=" + mg.getStoreNo());
		} else {
			model.addAttribute("msg","메뉴그룹이 삭제되지 않았습니다.");
			model.addAttribute("loc", "/addMenuGroupFrm.do?storeNo=" + mg.getStoreNo());
		}
		return "zipcoock/common/msg";
	}
	
	@RequestMapping(value="/addMenuFrm.do")
	public String addMenuFrm(int groupNo, int storeNo, HttpSession session, Model model) {
		ArrayList<Menu> list = service.selectMenuList(groupNo);
		String groupName = service.selectGroupName(groupNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("storeNo", storeNo);
		model.addAttribute("groupName", groupName);
		model.addAttribute("list", list);
		return "delivery/seller/addMenuFrm";
	}
	
	@RequestMapping(value="/enrollMenuFrm.do")
	public String enrollMenuFrm(int groupNo, int storeNo, Model model) {
		String groupName = service.selectGroupName(groupNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("storeNo", storeNo);
		model.addAttribute("groupName", groupName);
		return "delivery/seller/enrollMenuFrm";
	}
	
	@RequestMapping(value="/menuNameCheck.do")
	@ResponseBody
	public int menuNameCheck(String menuName) {
		String mn = service.selectOneMenuName(menuName);
		if (mn == null) {
			return 0;
		} else {
			return 1;
		}
	}
	
	@RequestMapping(value="/addMenu.do")
	public String addMenu(Menu menu, int storeNo, MultipartFile[] files, HttpServletRequest request, Model model) {
		if (files[0].isEmpty()) {
			// 첨부파일이 없는 경우
		} else {
			// 첨부파일이 있는 경우
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/zcdSeller/");
			// 반복문을 이용해서 파일 처리(파일업로드)
			for (MultipartFile file : files) {
				// 사용자가 올린 파일명
				String filename = file.getOriginalFilename(); // 치킨_로고.png
				String onlyFilename = filename.substring(0, filename.indexOf(".")); // 치킨_로고
				String extention = filename.substring(filename.indexOf(".")); // .png
				String filepath = null;
				// 파일명 중복 시 숫자를 붙이는 코드
				int count = 0;
				while (true) {
					if (count == 0) {
						filepath = onlyFilename + extention; // 치킨_로고.png
					} else {
						filepath = onlyFilename + "_" + count + extention; // 치킨_로고_1.png
					}
					File checkFile = new File(savePath + filepath); // /resources/upload/zcdSeller/치킨_로고.png
					if (!checkFile.exists()) {
						break;
					}
					count++;
				}
				// 파일명 중복처리가 끝나면 파일 업로드
				try {
					// 중복처리가 끝난 파일명(filepath)으로 파일을 업로드
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					// 업로드 속도 증가를 위한 보조스트림
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					// 파일 업로드
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				menu.setFilename(filename);
				menu.setFilepath(savePath);
			}
		}
		int result = service.addMenu(menu);
		if (result == -1) {
			model.addAttribute("msg", "메뉴가 등록되지 않았습니다.");
			model.addAttribute("loc", "/addMenuFrm.do?groupNo=" + menu.getGroupNo() + "&storeNo=" + storeNo);
		} else {
			model.addAttribute("msg", "메뉴가 등록되었습니다.");
			model.addAttribute("loc", "/addMenuFrm.do?groupNo=" + menu.getGroupNo() + "&storeNo=" + storeNo);
		}
		return "zipcoock/common/msg";
	}
	
	@RequestMapping(value="/selectOneMenu.do")
	public String selectOneMenu(int menuNo, int groupNo, int storeNo, Model model) {
		Menu menu = service.selectOneMenu(menuNo);
		String groupName = service.selectGroupName(groupNo);		
		model.addAttribute("menu", menu);
		model.addAttribute("storeNo", storeNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("groupName", groupName);
		return "delivery/seller/selectOneMenuFrm";
	}
	
	@RequestMapping(value="/modifyMenu.do")
	public String modifyMenu(Menu menu, int status, int storeNo, MultipartFile[] files, HttpServletRequest request, Model model) {
		if (files[0].isEmpty()) {
			// 첨부파일이 없는 경우
			System.out.println("menuname: " + menu.getMenuName());
			System.out.println("menucontent: " + menu.getMenuContent());
			System.out.println("menuprice: " + menu.getMenuPrice());
			System.out.println("status: " + status);
		} else {
			// 첨부파일이 있는 경우
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/zcdSeller/");
			// 반복문을 이용해서 파일 처리(파일업로드)
			for (MultipartFile file : files) {
				// 사용자가 올린 파일명
				String filename = file.getOriginalFilename(); // 치킨_로고.png
				String onlyFilename = filename.substring(0, filename.indexOf(".")); // 치킨_로고
				String extention = filename.substring(filename.indexOf(".")); // .png
				String filepath = null;
				// 파일명 중복 시 숫자를 붙이는 코드
				int count = 0;
				while (true) {
					if (count == 0) {
						filepath = onlyFilename + extention; // 치킨_로고.png
					} else {
						filepath = onlyFilename + "_" + count + extention; // 치킨_로고_1.png
					}
					File checkFile = new File(savePath + filepath); // /resources/upload/zcdSeller/치킨_로고.png
					if (!checkFile.exists()) {
						break;
					}
					count++;
				}
				// 파일명 중복처리가 끝나면 파일 업로드
				try {
					// 중복처리가 끝난 파일명(filepath)으로 파일을 업로드
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					// 업로드 속도 증가를 위한 보조스트림
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					// 파일 업로드
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				menu.setFilename(filename);
				menu.setFilepath(savePath);
			}
		}
		int result = 0;
		if (status == 1) {
			result = service.modifyMenu(menu);
		} else if (status == 2) {
			result = service.modifyMenu2(menu);
		}
		if (result == -1) {
			model.addAttribute("msg", "메뉴가 변경되지 않았습니다.");
			model.addAttribute("loc", "/addMenuFrm.do?groupNo=" + menu.getGroupNo() + "&storeNo=" + storeNo);
		} else {
			model.addAttribute("msg", "메뉴가 변경되었습니다.");
			model.addAttribute("loc", "/addMenuFrm.do?groupNo=" + menu.getGroupNo() + "&storeNo=" + storeNo);
		}
		return "zipcoock/common/msg";
	}
	
	@RequestMapping(value="/deleteMenu.do")
	public String deleteOneMenu(int menuNo, int groupNo, int storeNo, Model model) {
		int result = service.deleteMenu(menuNo);
		if (result > 0) {
			model.addAttribute("msg","해당 메뉴가 삭제되었습니다.");
			model.addAttribute("loc", "/addMenuFrm.do?storeNo=" + storeNo + "&groupNo=" + groupNo);
		} else {
			model.addAttribute("msg","해당 메뉴가 삭제되지 않았습니다.");
			model.addAttribute("loc", "/addMenuFrm.do?storeNo=" + storeNo + "&groupNo=" + groupNo);
		}
		return "zipcoock/common/msg";
	}
	
	@RequestMapping(value="/addOptionFrm.do")
	public String addOptionFrm(int menuNo, int groupNo, int storeNo, String menuName, Model model) {
		ArrayList<AddMenu> list = service.selectAddMenuList(menuNo);
		String groupName = service.selectGroupName(groupNo);
		model.addAttribute("storeNo", storeNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("groupName", groupName);
		model.addAttribute("menuNo", menuNo);
		model.addAttribute("menuName", menuName);
		model.addAttribute("list", list);
		return "delivery/seller/addOptionFrm";
	}
	
	@RequestMapping(value="/deleteOption.do")
	public String deleteOption(int addmenuNo, int menuNo, int groupNo, int storeNo, String menuName, Model model) {
		int result = service.deleteOption(addmenuNo);
		if (result > 0) {
			model.addAttribute("msg","해당 선택메뉴가 삭제되었습니다.");
			model.addAttribute("loc", "/addOptionFrm.do?menuNo=" + menuNo + "&storeNo=" + storeNo + "&groupNo=" + groupNo + "&menuName=" + menuName);
		} else {
			model.addAttribute("msg","해당 선택메뉴가 삭제되지 않았습니다.");
			model.addAttribute("loc", "/addOptionFrm.do?menuNo=" + menuNo + "&storeNo=" + storeNo + "&groupNo=" + groupNo + "&menuName=" + menuName);
		}
		return "zipcoock/common/msg";
	}
	
	@RequestMapping(value="/addMenuOption.do")
	public String addMenuOption(AddMenu addmenu, int groupNo, int storeNo, String menuName, Model model) {
		int result = service.addMenuOption(addmenu);
		if (result > 0) {
			model.addAttribute("msg","선택메뉴가 등록되었습니다.");
			model.addAttribute("loc", "/addOptionFrm.do?menuNo=" + addmenu.getMenuNo() + "&storeNo=" + storeNo + "&groupNo=" + groupNo + "&menuName=" + menuName);
		} else {
			model.addAttribute("msg","선택메뉴가 등록되지 않았습니다.");
			model.addAttribute("loc", "/addOptionFrm.do?menuNo=" + addmenu.getMenuNo() + "&storeNo=" + storeNo + "&groupNo=" + groupNo + "&menuName=" + menuName);
		}
		return "zipcoock/common/msg";
	}
	
	@RequestMapping(value="/marketView.do")
	public String marketView(int storeNo, int memberNo, HttpSession session, Model model) {
		ZcdStore zs = service.selectOneMarket(storeNo);
		String businessNo = service.selectBusinessNo(memberNo);
		String sellerName = service.selectSellerName(memberNo);
		ArrayList<MenuGroup> menuGrouplist = service.selectGroupList(storeNo);
		ArrayList<Menu> menulist = service.selectAllMenuList();
		ArrayList<ReviewComment> rclist = service.selectReviewCommentList(memberNo);
		/*
		for (int i=0; i<menuGrouplist.size(); i++) {
			int groupNo = menuGrouplist.get(i).getGroupNo();
			System.out.println(groupNo);
			ArrayList<Menu> menulist = service.selectMenuList(groupNo);
		}
		*/
		ArrayList<ZcdReview> zrlist = service.selectZcdReviewList(storeNo);
		model.addAttribute("zs", zs);
		model.addAttribute("businessNo", businessNo);
		model.addAttribute("sellerName", sellerName);
		model.addAttribute("menuGrouplist", menuGrouplist);
		model.addAttribute("menulist", menulist);
		model.addAttribute("zrlist", zrlist);
		model.addAttribute("rclist", rclist);
		return "delivery/seller/marketView";
	}
	
	@RequestMapping(value="/menuPopup.do", method = RequestMethod.GET)
	public String popupGet(Model model, int storeNo, @RequestParam(value="menuNo", defaultValue="") int menuNo) throws Exception {
		Menu menu = service.selectOneMenu(menuNo);
		// 필수 선택
		ArrayList<AddMenu> addMenu1 = service.selectAddMenuList1(menuNo);
		// 추가 선택
		ArrayList<AddMenu> addMenu2 = service.selectAddMenuList2(menuNo);
		model.addAttribute("menu", menu);
		model.addAttribute("storeNo", storeNo);
		model.addAttribute("addMenu1", addMenu1);
		model.addAttribute("addMenu2", addMenu2);
		return "delivery/seller/menuPopup";
	}
	
	@RequestMapping(value="/addCart.do")
	@ResponseBody
	public int addCart(Member member, @RequestParam(defaultValue="") List<String> addmenuInfo2, String addmenu1Opt, ZcdCart zc, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("m");
		String addmenu2 = "";
		AddMenu addmenu = new AddMenu();
		addmenu.setMenuNo(zc.getMenuNo());
		int addmenu2Price = 0;
		
		
		for (int i=0; i<addmenuInfo2.size(); i++) {
			String addmenuName = addmenuInfo2.get(i);
			addmenu2 += addmenuName;
			addmenu.setAddmenuName(addmenuName);
			int addmenuPrice = service.selectAddMenuPrice(addmenu);
			addmenu2Price = addmenu2Price + addmenuPrice;
			
			if(i != addmenuInfo2.size()-1) {
				addmenu2 += ", ";
			}
		}			
		
		Menu menu = service.selectOneMenu(zc.getMenuNo());
		int menuPrice = menu.getMenuPrice();
		addmenu2Price = menuPrice + addmenu2Price;
		System.out.println(addmenu1Opt);
        System.out.println(addmenu2);
        System.out.println(zc.getMenuNo());
        System.out.println(addmenu2Price);
        System.out.println(zc.getAmount());
        
        zc.setMemberNo(m.getMemberNo());
        zc.setAddmenuInfo1(addmenu1Opt);
        zc.setAddmenuInfo2(addmenu2);
        zc.setMenuAllprice(addmenu2Price);
        
        int result = service.addCart(zc);
        
        if (result > 0) {
        	return 0;
		} else {
			return 1;
		}
	}
	
	@RequestMapping(value="/manageZcdOrderFrm.do")
	public String manageZcdOrderFrm(Member member, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("m");
		ArrayList<ZcdStore> list = service.selectZcdStoreList(m.getMemberNo());
		model.addAttribute("list", list);
		return "delivery/seller/manageZcdOrderFrm";
	}
	
	@RequestMapping(value = "/manageZcdOrder.do")
	public String searchOrder(Member member, HttpSession session, int reqPage, int storeNo, String orderState, Model model) {
		Member m = (Member)session.getAttribute("m");
		ZcdOrderPage zop = service.selectOrderList(reqPage, storeNo, orderState);
		System.out.println(reqPage);
		System.out.println(storeNo);
		System.out.println(orderState);
		model.addAttribute("zop", zop);
		model.addAttribute("storeNo", storeNo);
		model.addAttribute("orderState", orderState);
		System.out.println(zop);
		return "delivery/seller/manageZcdOrder";
	}
	
	@RequestMapping(value="/orderReceipt.do")
	public String orderReceipt(Member member, HttpSession session, Model model, int orderNo) {
		Member m = (Member)session.getAttribute("m");
		MenuOrder mo = service.selectMenuOrder(orderNo);
		String memberPhone = service.selectMemberPhone(mo.getMemberNo());
		ArrayList<ZcdCart> list = service.selectZcdCartList(mo);
		model.addAttribute("mo", mo);
		model.addAttribute("memberPhone", memberPhone);
		model.addAttribute("list", list);
		System.out.println(mo.getMemberNo());
		System.out.println(mo.getStoreNo());
		return "delivery/seller/orderReceipt";
	}
	
	@RequestMapping(value="/zcdOrderX.do")
	public String zcdOrderX(int orderNo, Model model) {
		MenuOrder mo = service.selectMenuOrder(orderNo);
		int result = service.zcdOrderX(mo.getOrderNo());
		if (result > 0) {
			model.addAttribute("msg","주문이 취소되었습니다.");
			model.addAttribute("loc", "/manageZcdOrder.do?reqPage=1&storeNo=" + mo.getStoreNo() + "&orderState=" + mo.getOrderState());
		} else {
			model.addAttribute("msg","주문이 취소되지 않았습니다.");
			model.addAttribute("loc", "/manageZcdOrder.do?reqPage=1&storeNo=" + mo.getStoreNo() + "&orderState=" + mo.getOrderState());
		}
		return "zipcoock/common/msg";
	}
	
	@RequestMapping(value="/zcdOrderO.do")
	public String zcdOrderO(int orderNo, Model model) {
		MenuOrder mo = service.selectMenuOrder(orderNo);
		int result = service.zcdOrderO(mo.getOrderNo());
		if (result > 0) {
			model.addAttribute("msg","주문접수가 완료되었습니다.");
			model.addAttribute("loc", "/manageZcdOrder.do?reqPage=1&storeNo=" + mo.getStoreNo() + "&orderState=" + mo.getOrderState());
		} else {
			model.addAttribute("msg","주문접수가 완료되지 않았습니다.");
			model.addAttribute("loc", "/manageZcdOrder.do?reqPage=1&storeNo=" + mo.getStoreNo() + "&orderState=" + mo.getOrderState());
		}
		return "zipcoock/common/msg";
	}
	
	@RequestMapping(value="/deliveryReceipt.do")
	public String deliveryReceipt(Member member, HttpSession session, Model model, int orderNo) {
		Member m = (Member)session.getAttribute("m");
		MenuOrder mo = service.selectMenuOrder(orderNo);
		String memberPhone = service.selectMemberPhone(mo.getMemberNo());
		ZcdStore zs = service.selectOneMarket(mo.getStoreNo());
		ArrayList<ZcdCart> list = service.selectZcdCartList(mo);
		model.addAttribute("mo", mo);
		model.addAttribute("memberPhone", memberPhone);
		model.addAttribute("list", list);
		model.addAttribute("zs", zs);
		return "delivery/seller/deliveryReceipt";
	}
	
	@RequestMapping(value="/deliveryStart.do")
	@ResponseBody
	public int deliveryStart(int orderNo, Model model) {
		MenuOrder mo = service.selectMenuOrder(orderNo);
		int result = service.zcdOrderO2(mo.getOrderNo());
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="manageZcdReviewFrm.do")
	public String manageZcdReviewFrm(Member member, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("m");
		ArrayList<ZcdStore> list = service.selectZcdStoreList(m.getMemberNo());
		model.addAttribute("list", list);
		return "delivery/seller/manageZcdReviewFrm";
	}
	
	@RequestMapping(value = "/manageZcdReview.do")
	public String manageZcdReview(HttpSession session, int reqPage, int storeNo, String reviewState, Model model) {
		ZcdReviewPage zrp = service.selectReviewList(reqPage, storeNo, reviewState);
		System.out.println(reqPage);
		System.out.println(storeNo);
		System.out.println(reviewState);
		model.addAttribute("zrp", zrp);
		model.addAttribute("storeNo", storeNo);
		model.addAttribute("reviewState", reviewState);
		System.out.println(zrp);
		return "delivery/seller/manageZcdReview";
	}
	
	@RequestMapping(value="/reviewView.do")
	public String reviewView(HttpSession session, Model model, int reviewNo) {
		ZcdReview zr = service.selectOneReview(reviewNo);
		String memberId = service.selectMemberId(zr.getMemberNo());
		model.addAttribute("zr", zr);
		model.addAttribute("memberId", memberId);
		return "delivery/seller/reviewView";
	}

	@RequestMapping(value="/reviewWrite.do")
	public String reviewWrite(Member member, HttpSession session, Model model, ReviewComment rc, int storeNo) {
		Member m = (Member)session.getAttribute("m");
		rc.setMemberNo(m.getMemberNo());
		int result = service.reviewWrite(rc);
		if (result > 0) {
			int result2 = service.updateReviewState(rc.getReviewNo());
			model.addAttribute("msg","리뷰답변 작성이 완료되었습니다.");
			model.addAttribute("loc", "/manageZcdReview.do?reqPage=1&storeNo=" + storeNo + "&reviewState=답변완료");
		} else {
			model.addAttribute("msg","리뷰답변 작성이 완료되지 않았습니다.");
			model.addAttribute("loc", "/manageZcdReview.do?reqPage=1&storeNo=" + storeNo + "&reviewState=미답변");
		}
		return "zipcoock/common/msg";
	}
	
	@RequestMapping(value="/commentView.do")
	public String commentView(HttpSession session, Model model, int reviewNo) {
		ZcdReview zr = service.selectOneReview(reviewNo);
		String memberId = service.selectMemberId(zr.getMemberNo());
		ReviewComment rc = service.selectOneComment(reviewNo);
		model.addAttribute("zr", zr);
		model.addAttribute("rc", rc);
		model.addAttribute("memberId", memberId);
		return "delivery/seller/commentView";
	}
	
	@RequestMapping(value="/commentModify.do")
	public String commentModify(Member member, HttpSession session, Model model, ReviewComment rc, int storeNo) {
		Member m = (Member)session.getAttribute("m");
		rc.setMemberNo(m.getMemberNo());
		int result = service.commentModify(rc);
		if (result > 0) {
			model.addAttribute("msg","리뷰답변 수정이 완료되었습니다.");
			model.addAttribute("loc", "/manageZcdReview.do?reqPage=1&storeNo=" + storeNo + "&reviewState=답변완료");
		} else {
			model.addAttribute("msg","리뷰답변 수정이 완료되지 않았습니다.");
			model.addAttribute("loc", "/manageZcdReview.do?reqPage=1&storeNo=" + storeNo + "&reviewState=미답변");
		}
		return "zipcoock/common/msg";
	}
	
	// 지역 구분 제한으로 인해 임시 구현
	@RequestMapping(value="/manageDeliveryFrm.do")
	public String manageDeliveryFrm(HttpSession session, Model model) {
		ArrayList<ZcdStore> list = service.selectZcdStoreList2();
		model.addAttribute("list", list);
		return "delivery/seller/manageDeliveryFrm";
	}
	
	@RequestMapping(value = "/manageDeliveryOrder.do")
	public String deliveryOrder(Member member, HttpSession session, int reqPage, int storeNo, String orderState, Model model) {
		Member m = (Member)session.getAttribute("m");
		ZcdOrderPage zop = service.selectOrderList2(reqPage, storeNo, orderState);
		System.out.println(reqPage);
		System.out.println(storeNo);
		System.out.println(orderState);
		model.addAttribute("zop", zop);
		model.addAttribute("storeNo", storeNo);
		model.addAttribute("orderState", orderState);
		System.out.println(zop);
		return "delivery/seller/manageDeliveryOrder";
	}
	
	@RequestMapping(value="/deliveryAccept.do")
	public String deliveryAccept(Member member, HttpSession session, Model model, int orderNo) {
		Member m = (Member)session.getAttribute("m");
		MenuOrder mo = service.selectMenuOrder(orderNo);
		String memberPhone = service.selectMemberPhone(mo.getMemberNo());
		ZcdStore zs = service.selectOneMarket(mo.getStoreNo());
		ArrayList<ZcdCart> list = service.selectZcdCartList(mo);
		model.addAttribute("mo", mo);
		model.addAttribute("memberPhone", memberPhone);
		model.addAttribute("list", list);
		model.addAttribute("zs", zs);
		return "delivery/seller/deliveryAccept";
	}
	
	@RequestMapping(value="/deliveryStart2.do")
	@ResponseBody
	public int deliveryStart2(int orderNo, Model model) {
		MenuOrder mo = service.selectMenuOrder(orderNo);
		int result = service.zcdOrderO2(mo.getOrderNo());
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="/deliveryEnd.do")
	public String deliveryEnd(int orderNo, Model model) {
		System.out.println(orderNo);
		MenuOrder mo = service.selectMenuOrder(orderNo);
		int result = service.zcdOrderEnd(mo.getOrderNo());
		if (result > 0) {
			model.addAttribute("msg","배달이 완료되었습니다.");
			model.addAttribute("loc", "/manageDeliveryOrder.do?reqPage=1&storeNo=" + mo.getStoreNo() + "&orderState=" + mo.getOrderState());
		} else {
			model.addAttribute("msg","배달이 완료되지 않았습니다.");
			model.addAttribute("loc", "/manageDeliveryOrder.do?reqPage=1&storeNo=" + mo.getStoreNo() + "&orderState=" + mo.getOrderState());
		}
		return "zipcoock/common/msg";
	}
	
}
