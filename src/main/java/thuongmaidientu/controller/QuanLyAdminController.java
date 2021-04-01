package thuongmaidientu.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import thuongmaidientu.model.HoaDon;
import thuongmaidientu.model.KhachHang;
import thuongmaidientu.model.TaiKhoan;
import thuongmaidientu.service.Auth;
import thuongmaidientu.service.HoaDonImpl;
import thuongmaidientu.service.KhachHangImpl;
import thuongmaidientu.service.TaiKhoanImpl;


@Controller
@RequestMapping(value = "/admin")
public class QuanLyAdminController {
	
	@Autowired
	HoaDonImpl hdImpl;
	@Autowired
	KhachHangImpl khImpl;
	
	@Auth(permission = 3, action = Auth.Action.VIEW)
	@RequestMapping(value = "/dskhachhang")
	public String dSKhachHang(Model model) {
		List<KhachHang> lstKhachHang = khImpl.layDanhSach();
		model.addAttribute("lstKH", lstKhachHang);
		
		return "dskhachhang";
	}
	
	@RequestMapping(value = "/dsdonhang")
	public String DsDonHang(Model model) {
		
		List<HoaDon> lstHoaDon = hdImpl.layDanhSach();
		model.addAttribute("lstHoaDon", lstHoaDon);
		
		return "dsdonhang";
	}
	@RequestMapping(value="chitietdonhang/{id}")
	public String chiTietDonHang(Model model, @PathVariable("id") int id) {
		HoaDon objHDon = hdImpl.layChiTiet(id);
		model.addAttribute("objHD", objHDon);
		return "ctdonhang";
	}
	@RequestMapping(value="chitietkhachhang/{id}")
	public String chiTietKhachHang(Model model, @PathVariable("id") int id) {
		KhachHang objKhachHang = khImpl.layChiTiet(id);
		model.addAttribute("objKH", objKhachHang);
		return "ctkhachhang";
	}
}
