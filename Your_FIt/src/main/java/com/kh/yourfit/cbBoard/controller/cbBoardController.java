package com.kh.yourfit.cbBoard.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.yourfit.cbBoard.model.service.cbBoardService;
import com.kh.yourfit.cbBoard.model.vo.cbBoard;
import com.kh.yourfit.common.util.Utils;


@Controller
public class cbBoardController {
	
	@Autowired
	cbBoardService cbBoardService;
	
	@RequestMapping("/cbBoard/cbBoard.do")
	public String cbBoard(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글
		
		// 현재 페이지 게시글 
		List<Map<String, String>> list = cbBoardService.selectcbBoard(cPage, numPerPage);
		
		// 전체 게시글 수
		int totalContents = cbBoardService.selectcbBoardTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "cbBoard.do");
				
		// System.out.println("list : " + list);
				
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "cbBoard/cbBoard";
	}
	
	@RequestMapping("/cbBoard/cbBoardForm.do")
	public String cbBoardForm(Model model) {
		
		return "cbBoard/cbBoardForm";
	}
	
	@RequestMapping("/cbBoard/cbBoardEnd.do")
	public String insertcbBoard(cbBoard cbBoard, Model model) {
		
		int result = cbBoardService.insertcbBoard(cbBoard);
		
		String loc = "/cbBoard/cbBoard.do";
		String msg = "";
		if( result > 0 ) {
			msg = "칼로리 정보 등록 성공";
		} else {
			msg = "칼로리 정보 등록 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/cbBoard/cbBoardView.do")
	public String cbBoardView(@RequestParam String cb_no, Model model) {
		
		cbBoard cbBoard = cbBoardService.selectOnecbBoard(cb_no);
		
		model.addAttribute("cbBoard", cbBoard);
		
		return "cbBoard/cbBoardView";
	}
	
	@RequestMapping("/cbBoard/cbBoardUpdateView.do")
	public String cbBoardUpdateView(@RequestParam String cb_no, Model model) {
		
		cbBoard cbBoard = cbBoardService.cbBoardUpdateView(cb_no);
		
		model.addAttribute("cbBoard", cbBoard);
		
		return "cbBoard/cbBoardUpdateView";
	}
	
	@RequestMapping("/cbBoard/cbBoardUpdate.do")
	public String cbBoardUpdate(cbBoard cbBoard, Model model) {
		
		String cb_no = cbBoard.getCb_no();
		
		// 원본 게시글 불러와 수정하기
		cbBoard origincbBoard = cbBoardService.cbBoardUpdateView(cb_no);
		// System.out.println("origincbBoard: " + origincbBoard);
		
		origincbBoard.setCb_foodname(cbBoard.getCb_foodname());
		origincbBoard.setCb_unit(cbBoard.getCb_unit());
		origincbBoard.setCb_cal(cbBoard.getCb_cal());
		origincbBoard.setCb_carbohydrate(cbBoard.getCb_carbohydrate());
		origincbBoard.setCb_protein(cbBoard.getCb_protein());
		origincbBoard.setCb_fat(cbBoard.getCb_fat());
		
		int result = cbBoardService.updatecbBoard(origincbBoard);
		String loc = "/cbBoard/cbBoardView.do?cb_no="+cb_no;
		String msg = "";
		
		if( result > 0 ) {
			msg = "칼로리 정보 수정 성공!";
		} else {
			msg = "칼로리 정보 수정 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/cbBoard/cbBoardDelete.do")
	public String cbBoardDelete(@RequestParam String cb_no, Model model) {
		
		int result = cbBoardService.deletecbBoard(cb_no);
		
		String loc = "/cbBoard/cbBoard.do";
		String msg = "";
		
		if ( result > 0 ) msg = "칼로리 정보 삭제 완료!";
		else msg = "칼로리 정보 삭제 실패!";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/cbBoard/cbBoardSearch.do")
	public String cbBoardSearch(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, @RequestParam String keyword, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글
		
		// 검색한 현재 페이지 게시글 
		List<Map<String, String>> list = cbBoardService.cbBoardSearch(cPage, numPerPage, keyword);
		
		// 검색된 게시글 수
		int count = cbBoardService.cbBoardSearchCnt(keyword);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(count, cPage, numPerPage, "cbBoardSearch.do");
						
		// System.out.println("list : " + list);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
				
		return "cbBoard/cbBoardSearch";
	}
	
}
