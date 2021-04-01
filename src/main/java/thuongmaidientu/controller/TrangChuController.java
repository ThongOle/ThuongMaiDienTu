package thuongmaidientu.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import thuongmaidientu.model.DanhMuc;
import thuongmaidientu.model.HoaDon;
import thuongmaidientu.model.KhachHang;
import thuongmaidientu.model.SanPham;
import thuongmaidientu.service.DanhMucImpl;
import thuongmaidientu.service.HoaDonImpl;
import thuongmaidientu.service.KhachHangImpl;
import thuongmaidientu.service.SanPhamImpl;


@Controller
@RequestMapping(value = "/home")
public class TrangChuController {
	@Autowired
	DanhMucImpl danhMucImpl;
	@Autowired
	SanPhamImpl sanphamImpl;
	@Autowired
	KhachHangImpl khImpl;
	@Autowired
	HoaDonImpl hdImpl;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String trangChu(Model model, HttpSession session) {
		List<DanhMuc> lstDM = danhMucImpl.timKiemDanhMuc(0);
		
		if(session.getAttribute("objKH") == null) {
			session.setAttribute("objKH", new KhachHang());
		}
		List<SanPham> lstSPLaptop = sanphamImpl.timKiemSanPhamTheoDanhMuc(261);
		model.addAttribute("khachhang", new KhachHang());
		model.addAttribute("lstLT", lstSPLaptop);
		model.addAttribute("lstDM", lstDM);
		return "trangchu";
	}
	
	@RequestMapping(value = "/giohang")
	public String gioHang(Model model, HttpSession session) {
		
		if(session.getAttribute("objKH") == null) {
			session.setAttribute("objKH", new KhachHang());
		}
		model.addAttribute("khachhang", new KhachHang());
		
		return "giohang";
	}
	@RequestMapping(value = "/checkout")
	public String checkout(Model model, HttpSession session) {
		if(session.getAttribute("objKH") == null) {
			session.setAttribute("objKH", new KhachHang());
		}
		model.addAttribute("khachhang", new KhachHang());
		model.addAttribute("hoadon", new HoaDon());
		return "checkout";
	}
	@RequestMapping(value = "/dangnhap")
	public String dangnhap(@ModelAttribute("khachhang") KhachHang objKH, HttpSession session, Model model){
		KhachHang objKhachHang = khImpl.layKHtheoEmail(objKH.getEmail());
		
		if(objKhachHang != null) {
			
			if (objKhachHang.getMatKhau().equals(objKH.getMatKhau()) ) {
			System.out.println(objKhachHang.getHoTen());
			session.setAttribute("objKH", objKhachHang);
			return "redirect:/home";
		}else {
			
			return "redirect:/home";
		}
		}else {
			
		}

		return "redirect:/home";

		
	}
	@RequestMapping(value = "/dangky", method = RequestMethod.POST)
	public String dangky(@ModelAttribute("khachhang") KhachHang objKH, HttpSession session,Model model ) throws JsonProcessingException {
		
		khImpl.themMoi(objKH);
		KhachHang objKhachHang = khImpl.layKHtheoEmail(objKH.getEmail());
		
		session.setAttribute("objKH", objKhachHang);
		
		return "redirect:/home";
	}
	@RequestMapping(value = "shopsanpham/{dmId}")
	public String shopSanPham  ( @PathVariable("dmId") Integer dmId, Model model, HttpSession session) {
		List<SanPham> lstSP = sanphamImpl.timKiemSanPhamTheoDanhMuc(dmId);
		
		model.addAttribute("shopSP", lstSP);
		model.addAttribute("khachhang", new KhachHang());
		if(session.getAttribute("objKH") == null) {
			session.setAttribute("objKH", new KhachHang());
		}
		return "shopsanpham";
	}
	@RequestMapping(value = "thongtincanhan")
	public String thongTinCaNhan  (Model model, HttpSession session) {
		model.addAttribute("khachhang", new KhachHang());
		
		if(session.getAttribute("objKH") == null) {
			session.setAttribute("objKH", new KhachHang());
			model.addAttribute("thongtinkhachhang", new KhachHang());
		}else {
			model.addAttribute("thongtinkhachhang", session.getAttribute("objKH"));
		}
		return "thongtincanhan";
	}
	@RequestMapping(value="capnhat-taikhoan")
	public String capNhatTaiKhoan (@ModelAttribute("thongtinkhachhang") KhachHang objKH, Model model, HttpSession session) {
		
		khImpl.sua(objKH);
		model.addAttribute("khachhang", new KhachHang());
		session.setAttribute("objKH", objKH);
		model.addAttribute("thongtinkhachhang", objKH);
		
		return "thongtincanhan";
	}
	
	@RequestMapping(value="thaydoimatkhau-kh")
	public String viewthayDoiMatKhau(Model model, HttpSession session) {
		model.addAttribute("khachhang", new KhachHang());
		model.addAttribute("mess", "");
		if(session.getAttribute("objKH") == null) {
			session.setAttribute("objKH", new KhachHang());
			
		}
		return "thaydoimatkhau-kh";
	}
	@RequestMapping(value="doimatkhau-kh")
	public String thaydoiMatKhauKH(@RequestParam("matKhauOld")String matKhauOld,  @RequestParam("matKhauNew") String matKhauNew ,Model model, HttpSession session) {
		KhachHang objKH = (KhachHang)session.getAttribute("objKH");
		if (!objKH.getMatKhau().equals(matKhauOld)) {
			model.addAttribute("mess", "Mật khẩu cũ sai");
			model.addAttribute("khachhang", new KhachHang());
			return "thaydoimatkhau-kh";
		}
		objKH.setMatKhau(matKhauNew);
		khImpl.sua(objKH);
		session.setAttribute("objKH", objKH);
		return "redirect:/home/thongtincanhan";
	}
	@RequestMapping(value="lichsumuahang/{id}")
	public String lichSuMuaHang(@PathVariable("id") int id,Model model, HttpSession session) {
		model.addAttribute("khachhang", new KhachHang());
		List<HoaDon> lstHoaDon = hdImpl.timKiemTheoIdKH(id);
		model.addAttribute("lstHoaDon", lstHoaDon);
		if(session.getAttribute("objKH") == null) {
			session.setAttribute("objKH", new KhachHang());
		}
		
		return "lichsudonhang";
	}
	
	@RequestMapping(value="chitiethoadon/{id}")
	public String chiTietHoaDon(@PathVariable("id")int id , Model model, HttpSession session) {
		model.addAttribute("khachhang", new KhachHang());
		if(session.getAttribute("objKH") == null) {
			session.setAttribute("objKH", new KhachHang());
		}
		HoaDon objHoaDon = hdImpl.layChiTiet(id);
		model.addAttribute("objHoaDon", objHoaDon);
		return "chitietdonhang";
	}
	@RequestMapping(value="chitietsanpham/{id}")
	public String chiTietSanPham(@PathVariable("id")int id , Model model, HttpSession session) {
		model.addAttribute("khachhang", new KhachHang());
		if(session.getAttribute("objKH") == null) {
			session.setAttribute("objKH", new KhachHang());
		}
		SanPham objSanPham = sanphamImpl.layChiTiet(id);
		List<SanPham> lstSanPham = sanphamImpl.timKiemSanPhamTheoDanhMuc(objSanPham.getDanhMucId());
		model.addAttribute("lstSanPham", lstSanPham);
		model.addAttribute("objSanPham", objSanPham);
		return "chitietsanpham";
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	binder.registerCustomEditor(Date.class, new CustomDateEditor(
	        dateFormat, true));
	}
	
}
