package thuongmaidientu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import thuongmaidientu.model.HangSanXuat;
import thuongmaidientu.service.HangSanXuatImpl;

@Controller
@RequestMapping(value = "/admin")
public class HangSanXuatController {
	@Autowired
	HangSanXuatImpl hsxImpl;
	@RequestMapping(value = "/hangsanxuat")
	public String DanhSachHangSanXuat (Model model) {
		List<HangSanXuat> lsthsx = hsxImpl.layDanhSach();
		model.addAttribute("lstHsx", lsthsx);
		model.addAttribute("hangsanxuat", new HangSanXuat());
		return "dshangsx";
	}
	@RequestMapping(value = "/hsxadd")
	public String themMoiCapNhatDanhSach (@ModelAttribute("hangsanxuat") HangSanXuat objHangSanXuat ) {
		
		if (objHangSanXuat.getId()!= 0) {
			hsxImpl.sua(objHangSanXuat);
		}else {
			hsxImpl.themMoi(objHangSanXuat);
		}
		
		return "redirect:/admin/hangsanxuat";
	}
	@RequestMapping(value = "/xoahsx/{hsxid}")
	public String XoaDanhMuc (@PathVariable("hsxid") int hsxid) {
		hsxImpl.xoa(hsxid);
		return "redirect:/admin/hangsanxuat";
	}
	
}
