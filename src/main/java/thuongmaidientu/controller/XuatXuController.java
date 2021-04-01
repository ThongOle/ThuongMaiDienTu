package thuongmaidientu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import thuongmaidientu.model.XuatXu;
import thuongmaidientu.service.XuatXuImpl;

@Controller
@RequestMapping(value = "/admin")
public class XuatXuController {
	@Autowired
	XuatXuImpl xuatXuImpl;
	
	@RequestMapping(value = "/dsxuatxu")
	public String dsXuatXu (Model model) {
		List<XuatXu> lstxx = xuatXuImpl.layDanhSach();
		model.addAttribute("lstxx", lstxx);
		model.addAttribute("xuatxu", new XuatXu());
		return "dsxuatxu";
	}
	@RequestMapping(value = "/xxadd")
	public String themMoiCapNhatDanhSach (@ModelAttribute("xuatxu") XuatXu objXuatXu ) {
		
		if (objXuatXu.getId()!= 0) {
			xuatXuImpl.sua(objXuatXu);
		}else {
			xuatXuImpl.themMoi(objXuatXu);
		}
		
		return "redirect:/admin/dsxuatxu";
	}
	@RequestMapping(value = "/xoaxx/{xxid}")
	public String XoaDanhMuc (@PathVariable("xxid") int xxid) {
		xuatXuImpl.xoa(xxid);
		return "redirect:/admin/dsxuatxu";
	}
}
