package thuongmaidientu.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import thuongmaidientu.model.DanhMuc;
import thuongmaidientu.service.Auth;
import thuongmaidientu.service.DanhMucImpl;

@Controller
@RequestMapping(value = "/admin")
public class DanhMucController {
	@Autowired
	DanhMucImpl danhMucImpl;
	@Auth(permission = 1, action = Auth.Action.VIEW)
	@RequestMapping(value = "/dsdanhmuc")
	public String danhSachDanhMuc (Model model) {
		List<DanhMuc> lstDanhMuc = danhMucImpl.layDanhSach();
		Map<Integer, String> lstCha = new HashMap<Integer, String>();
		for (DanhMuc danhMuc : lstDanhMuc) {
			lstCha.put(danhMuc.getId(), danhMuc.getTenDanhMuc());
		}
		model.addAttribute("lstDanhMuc", lstDanhMuc);
		model.addAttribute("lstCha", lstCha);
		model.addAttribute("danhmuc", new DanhMuc());
		return "dsdanhmuc";
	}
	
	@Auth(permission = 1, action = Auth.Action.VIEW)
	@RequestMapping(value = "/danhmucadd")
	public String themMoiCapNhatDanhSach (@ModelAttribute("danhmuc") DanhMuc objDanhMuc ) {
		if (objDanhMuc.getId()!= 0) {
			danhMucImpl.sua(objDanhMuc);
		}else {
			danhMucImpl.themMoi(objDanhMuc);
		}
		
		return "redirect:/admin/dsdanhmuc";
	}
	@Auth(permission = 1, action = Auth.Action.VIEW)
	@RequestMapping(value = "/xoadm/{dmid}")
	public String XoaDanhMuc (@PathVariable("dmid") int dmid) {
		danhMucImpl.xoa(dmid);
		return "redirect:/admin/dsdanhmuc";
	}
	
}
