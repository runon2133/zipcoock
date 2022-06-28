package kr.or.delivery.event.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kr.or.delivery.event.model.service.EventService;
import kr.or.delivery.model.vo.ZcdEvent;
import kr.or.delivery.model.vo.ZcdEventFile;
import kr.or.delivery.model.vo.ZcdEventVO;

@Controller
public class EventController {

	@Autowired
	private EventService service;

	@RequestMapping(value = "/eventList.do")
	public String eventList(Model model) {
		ArrayList<ZcdEventVO> list = service.selectEventList();
		model.addAttribute("list", list);
		return "delivery/event/eventList";
	}

	@RequestMapping(value = "/eventWriteFrm.do")
	public String eventWriteFrm() {
		return "delivery/event/eventWriteFrm";
	}

	@RequestMapping(value = "/eventWrite.do")
	public String eventWrite(ZcdEvent ze, MultipartFile[] thumbnail, HttpServletRequest request, Model model) {
		// 파일 목록 저장할 List
		ArrayList<ZcdEventFile> list = new ArrayList<ZcdEventFile>();
		if (thumbnail[0].isEmpty()) {
			// 첨부파일이 없는경우
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/delivery/event/");
			// 반복문을 이용해서 파일처리(파일업로드)
			for (MultipartFile file : thumbnail) {
				String filename = file.getOriginalFilename();
				System.out.println("filename : " + filename);
				String onlyFilename = filename.substring(0, filename.indexOf("."));
				String extention = filename.substring(filename.indexOf("."));
				// 실제 업로드할 파일명을 저장할 변수
				String filepath = null;
				int count = 0;
				while (true) {
					if (count == 0) {
						filepath = onlyFilename + extention;
					} else {
						filepath = onlyFilename + "_" + count + extention;
					}
					File checkFile = new File(savePath + filepath);
					if (!checkFile.exists()) {
						break;
					}
					count++;
				}
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
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
				ZcdEventFile zef = new ZcdEventFile();
				zef.setFilename(filename);
				zef.setFilepath(filepath);
				list.add(zef);
			}
		}
		int result = service.insertEvent(ze, list);
		if (result == -1 || result != list.size()) {
			model.addAttribute("msg", "등록실패");
			model.addAttribute("loc", "/eventWrite.do");
		} else {
			model.addAttribute("msg", "등록성공");
			model.addAttribute("loc", "/eventList.do");
		}
		return "common/msg";
	}

	@RequestMapping(value = "/eventView.do")
	public String eventView(int eventNo, Model model) {
		ZcdEventVO ze = service.selectOneEvent(eventNo);
		model.addAttribute("ze", ze);
		return "delivery/event/eventView";
	}

	@RequestMapping(value = "/eventUpdateFrm.do")
	public String eventUpdateFrm(int eventNo, Model model) {
		ZcdEventVO ze = service.selectOneEvent(eventNo);
		model.addAttribute("ze", ze);
		return "delivery/event/eventUpdateFrm";
	}

	@RequestMapping(value = "/eventUpdate.do")
	public String eventUpdate(ZcdEvent ze, int status, MultipartFile[] upfile, HttpServletRequest request,
			Model model) {
		ArrayList<ZcdEventFile> list = new ArrayList<ZcdEventFile>();
		if (upfile[0].isEmpty()) {
			// 첨부파일이 없는경우
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/delivery/event/");
			// 반복문을 이용해서 파일처리(파일업로드)
			for (MultipartFile file : upfile) {
				String filename = file.getOriginalFilename();
				System.out.println("filename : " + filename);
				String onlyFilename = filename.substring(0, filename.indexOf("."));
				String extention = filename.substring(filename.indexOf("."));
				// 실제 업로드할 파일명을 저장할 변수
				String filepath = null;
				int count = 0;
				while (true) {
					if (count == 0) {
						filepath = onlyFilename + extention;
					} else {
						filepath = onlyFilename + "_" + count + extention;
					}
					File checkFile = new File(savePath + filepath);
					if (!checkFile.exists()) {
						break;
					}
					count++;
				}
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
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
				ZcdEventFile zef = new ZcdEventFile();
				zef.setFilename(filename);
				zef.setFilepath(filepath);
				list.add(zef);
			}
		}
		int result = 0;
		if (status == 1) {
			result = service.updateEvent2(ze);
		} else if (status == 2) {
			result = service.updateEvent(ze, list);
		}
		if (result == -1) {
			model.addAttribute("msg", "이벤트 수정 실패");
			model.addAttribute("loc", "/eventUpdateFrm.do?eventNo=" + ze.getEventNo());
		} else {
			model.addAttribute("msg", "이벤트 수정 성공");
			model.addAttribute("loc", "/eventView.do?eventNo=" + ze.getEventNo());
		}
		return "common/msg";
	}

	@RequestMapping(value = "/eventDelete.do")
	public String eventDelete(int eventNo, HttpServletRequest request, Model model) {
		ZcdEventVO ze = service.selectOneEvent(eventNo);
		System.out.println(ze);
		int result = service.deleteEvent(eventNo);
		if (result > 0) {
			if (ze.getFileNo() != 0) {
				String root = request.getSession().getServletContext().getRealPath("/resources/upload/delivery/event/");
				String file = root + ze.getFilename();
				System.out.println(file);
				File delFile = new File(file);
				delFile.delete();
			}
			model.addAttribute("msg", "삭제성공");
			model.addAttribute("loc", "/eventList.do");
		} else {
			model.addAttribute("msg", "삭제실패");
			model.addAttribute("loc", "/eventView.do");
		}
		return "common/msg";
	}

	@RequestMapping(value = "eventUploadImage.do", produces = "application/json")
	@ResponseBody
	public String eventUploadImage(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/delivery/event/");
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		File targetFile = new File(savePath + savedFileName);	
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);
				jsonObject.addProperty("url", "/resources/upload/delivery/event/"+savedFileName);
				jsonObject.addProperty("responseCode", "success");
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}
			String a = jsonObject.toString();
			return a;
		}
	}
