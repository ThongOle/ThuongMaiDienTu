package thuongmaidientu.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import thuongmaidientu.model.TaiKhoan;
import thuongmaidientu.model.VaiTro;
import thuongmaidientu.service.Auth;
import thuongmaidientu.service.TaiKhoanImpl;
import thuongmaidientu.service.VaiTroImpl;

@Controller
@RequestMapping("/admin")
public class DangNhapController {
	@Autowired
	VaiTroImpl vaiTroImpl;
	@Autowired
	TaiKhoanImpl taiKhoanImpl;
	
	
	@Auth(permission = 1, action = Auth.Action.VIEW)
	@RequestMapping("/dstaikhoan")
	public String dsTaiKhoan(Model model) {
		List<TaiKhoan> lstTK = taiKhoanImpl.layDanhSach();
		model.addAttribute("lstTK", lstTK);
		return "dstaikhoan";
	}
	
	@Auth(permission = 1, action = Auth.Action.VIEW)
	@RequestMapping("/captaikhoan")
	public String capTaiKhoan(Model model) {
		danhSachVaiTro();
		model.addAttribute("taikhoan", new TaiKhoan());
		return "captaikhoan";
	}
	@Auth(permission = 1, action = Auth.Action.VIEW)
	@RequestMapping("/captaikhoan/{idtaikhoan}")
	public String chiTietTaiKhoan(@PathVariable("idtaikhoan") int id ,Model model) {
		TaiKhoan objTK = taiKhoanImpl.layChiTiet(id);
		danhSachVaiTro();
		model.addAttribute("taikhoan", objTK);
		return "captaikhoan";
	}
	@Auth(permission = 1, action = Auth.Action.VIEW)
	@RequestMapping("/tk-xoa/{idtaikhoan}")
	public String xoaTaiKhoan (@PathVariable("idtaikhoan") int id) {
		taiKhoanImpl.xoa(id);
		return "redirect: ../dstaikhoan";
	}
	@Auth(permission = 1, action = Auth.Action.VIEW)
	@RequestMapping(value ="/tk-themmoicapnhat", method = RequestMethod.POST)
	public String themMoiCapNhat(@ModelAttribute("taikhoan") TaiKhoan objTaiKhoan, @RequestParam(name ="fUpload", required = false) MultipartFile fileUp, HttpServletRequest request) {
		System.out.println("s");
		if (fileUp.getOriginalFilename() != "") {
			String fileName = "";
			String partStr = "";
			partStr = request.getServletContext().getInitParameter("file-upload");
			fileName = fileUp.getOriginalFilename();
			File file = new File(partStr, fileName);
			try {
				fileUp.transferTo(file);
				objTaiKhoan.setAvatar(fileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		if (objTaiKhoan.getId()!= 0) {
			taiKhoanImpl.sua(objTaiKhoan);
		}else {
			taiKhoanImpl.themMoi(objTaiKhoan);
		}
		return "redirect: dstaikhoan";
	}
	@ModelAttribute("lstVaiTro")
	public Map<Integer, String> danhSachVaiTro(){
		Map<Integer, String> lstVaiTro = new HashMap<Integer, String>();
		List<VaiTro> lstVT = vaiTroImpl.layDanhSach();
		for (VaiTro vaiTro : lstVT) {
			lstVaiTro.put(vaiTro.getId(), vaiTro.getTenVaiTro());
		}
		return lstVaiTro;
	}
}

