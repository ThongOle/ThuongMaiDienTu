package thuongmaidientu.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import thuongmaidientu.model.TaiKhoan;
import thuongmaidientu.service.TaiKhoanImpl;
@Controller
public class LoginController {
	@Autowired
	TaiKhoanImpl taiKhoanImpl;
	
	@RequestMapping("/login")
	public String viewDangNhap(Model model) {
		model.addAttribute("taikhoan", new TaiKhoan());
		String  a ="";
		model.addAttribute("thongbao", a);
		return "DangNhap";
	}
	@RequestMapping("/loi403")
	public String loi() {
		return "403";
	}
	@RequestMapping("/dangnhap")
	public String dangNhap(@ModelAttribute("taikhoan") TaiKhoan  taiKhoan, Model model, HttpSession session, HttpServletResponse response) {
		TaiKhoan objTaiKhoan = taiKhoanImpl.layTKtheoUserName(taiKhoan.getTaiKhoan());
		if (objTaiKhoan!= null) {
			String matKhau = objTaiKhoan.getMatKhau();
			if (matKhau.equals(taiKhoan.getMatKhau())) {
				session.setAttribute("taikhoan", objTaiKhoan);
				session.setAttribute("userOnline", objTaiKhoan.getHoTen());
				
					return "redirect:/admin/dstaikhoan";
				
		
			}else {
				
				model.addAttribute("thongbao", "Sai mật khẩu");
			}
		}else {
			
			model.addAttribute("thongbao", "Sai thông tin tài khoản");
		}
		
		return "DangNhap";
	}
}
