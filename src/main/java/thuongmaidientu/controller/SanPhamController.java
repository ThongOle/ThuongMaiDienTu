package thuongmaidientu.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import thuongmaidientu.model.AnhSanPham;
import thuongmaidientu.model.DanhMuc;
import thuongmaidientu.model.GiaTriThuocTinh;
import thuongmaidientu.model.HangSanXuat;
import thuongmaidientu.model.LoaiSanPham;
import thuongmaidientu.model.SanPham;
import thuongmaidientu.model.XuatXu;
import thuongmaidientu.service.AnhSanPhamImpl;
import thuongmaidientu.service.Auth;
import thuongmaidientu.service.DanhMucImpl;
import thuongmaidientu.service.GiaTriThuocTinhImpl;
import thuongmaidientu.service.HangSanXuatImpl;
import thuongmaidientu.service.LoaiSanPhamImpl;
import thuongmaidientu.service.SanPhamImpl;
import thuongmaidientu.service.XuatXuImpl;

@Controller
@RequestMapping(value = "/admin")
public class SanPhamController {
	@Autowired
	DanhMucImpl danhMucImpl;
	@Autowired
	XuatXuImpl xuatXuImpl;
	@Autowired
	HangSanXuatImpl hangSanXuatImpl;
	@Autowired
	SanPhamImpl sanPhamImpl;
	@Autowired
	LoaiSanPhamImpl loaispImpl;
	@Autowired
	GiaTriThuocTinhImpl gtttImpl;
	@Autowired
	AnhSanPhamImpl anhspImpl;
	
	@Auth(permission = 1, action = Auth.Action.VIEW)
	@RequestMapping(value = "/dssanpham")
	public String danhSachSanPham(Model model) {
		List<SanPham> lstSP = sanPhamImpl.layDanhSach();
		model.addAttribute("lstSP", lstSP);
		return "dssanpham";
	}
	
	
	@RequestMapping(value = "/sanphamadd")
	public String themMoiSanPham(HttpServletRequest request, HttpServletResponse response, Model model) {
		List<DanhMuc> lstDanhMuc0 = danhMucImpl.timKiemDanhMuc(0);
		model.addAttribute("lstDanhMuc0", lstDanhMuc0);
		return "sanphamadd";
	}

	@RequestMapping(value = "/sanphamadd2")
	public String themMoiSanPham2(@RequestParam(name = "tensanpham", required = false) String tensanpham,
			@RequestParam(name = "dmId", required = false) String dmId,
			@RequestParam(name = "tendanhmuc", required = false) String tendanhmuc, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		String jsonSP ="";
		model.addAttribute("jsonSP", jsonSP);
		model.addAttribute("tensanpham", tensanpham);
		model.addAttribute("dmId", dmId);
		model.addAttribute("tendanhmuc", tendanhmuc);
		model.addAttribute("sanPham", new SanPham());
		layDanhSachHSX();
		layDanhSachXX();
		layDanhSachLoaiSanPham();
		return "sanphamadd2";
	}
	@RequestMapping(value = "/sanphamadd2/{id}", method = RequestMethod.GET)
	public String chiTietSanPham(@PathVariable("id") int id, Model model) throws JsonProcessingException {
		
		SanPham objSanPham = sanPhamImpl.layChiTiet(id);
		List<AnhSanPham> lstASP = objSanPham.getLstAnhSP();
		
		int size = lstASP.size();
		for(int i = 6; i> size ; i--) {
			lstASP.add(new AnhSanPham());
		}
		String tendanhmuc = danhMucImpl.layChuoiDanhMuc(objSanPham.getDanhMucId());
		List<GiaTriThuocTinh> lstGTTT = gtttImpl.timKiemTheoSP(id);
		
		// chuyển đổi lstGTTT thành chuỗi Json
		ObjectMapper mapper = new ObjectMapper();
		String jsonSP = mapper.writeValueAsString(lstGTTT);
		
		
		model.addAttribute("jsonSP", jsonSP);
		model.addAttribute("tendanhmuc", tendanhmuc);
		model.addAttribute("sanPham", objSanPham);
		model.addAttribute("lstASP", lstASP);
		layDanhSachHSX();
		layDanhSachXX();
		return "sanphamadd2";
	}

	@RequestMapping(value = "/themmoisanpham", method = RequestMethod.POST)
	public String themMoiCapNhat(@ModelAttribute("sanPham") SanPham objSanPham,
			@RequestParam(value = "tennhomphanloai1", required = false) String nhom1,
			@RequestParam(value = "tennhomphanloai2", required = false) String nhom2,
			@RequestParam(value = "tenphanloai1", required = false) String[] ten1,
			@RequestParam(value = "tenphanloai2", required = false) String[] ten2,
			@RequestParam(name = "gia", required = false) int[] gia,
			@RequestParam(name = "khohang", required = false) Integer[] khohang,
			@RequestParam(name = "mahang", required = false) String[] mahang,
			@RequestParam(name = "fUpload") MultipartFile[] fUploads, HttpServletRequest request) {

		
		if (!nhom1.isEmpty()) {
			List<GiaTriThuocTinh> lstGTTT = new ArrayList<GiaTriThuocTinh>();
			objSanPham.setThuocTinh1(nhom1);
			if (!nhom2.isEmpty()) {
				
				objSanPham.setThuocTinh2(nhom2);
				int dem = 0;
				for (int i = 0; i < ten1.length; i++) {
					for (int j = 0; j < ten2.length; j++) {
						GiaTriThuocTinh objGTTT = new GiaTriThuocTinh();
						objGTTT.setThuocTinh1(ten1[i]);
						objGTTT.setThuocTinh2(ten2[j]);
						objGTTT.setGiaTien(gia[dem]);
						objGTTT.setSoLuong(khohang[dem]);
						objGTTT.setMaSanPham(mahang[dem]);
						objGTTT.setObjSanPham(objSanPham);
						lstGTTT.add(objGTTT);
						dem++;
					}
				}
			} 
			objSanPham.setLstGTTT(lstGTTT);
		}
		
		if (fUploads[0].getOriginalFilename() != "") {
			String fileName = "";
			String partStr = "";
			List<AnhSanPham> listASP = new ArrayList<AnhSanPham>();
			for (int i = 0; i < fUploads.length; i++) {
				MultipartFile fUpload = fUploads[i];
				partStr = request.getServletContext().getInitParameter("file-upload");
				fileName = fUpload.getOriginalFilename();
				// Tạo file theo đường dẫn và tên file truyền vào
				if (fileName != "") {
					File file = new File(partStr, fileName);
					AnhSanPham objAnhSanPham = new AnhSanPham();
					objAnhSanPham.setAnh(fileName);
					objAnhSanPham.setObjSanPham(objSanPham);
					listASP.add(objAnhSanPham);
					try {
						// Ghi ra file
						fUpload.transferTo(file);

					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

			}
			objSanPham.setLstAnhSP(listASP);
	
		}
		if(objSanPham.getId() != 0) {
			gtttImpl.xoaGTTTtheoSP(objSanPham.getId());
			anhspImpl.xoaASPtheoSP(objSanPham.getId());
			sanPhamImpl.sua(objSanPham);
		}else {
			sanPhamImpl.themMoi(objSanPham);
		}
		
		return "redirect:/admin/dssanpham";
	}
	
	@RequestMapping(value = "/xoasanpham/{id}", method = RequestMethod.GET)
	public String xoaSanPham(@PathVariable("id") int id) {
		sanPhamImpl.xoa(id);
		return "redirect:/admin/dssanpham";
	}
	
	@ModelAttribute("lstHSX")
	public Map<Integer, String> layDanhSachHSX() {
		Map<Integer, String> lstHSX = new HashMap<Integer, String>();
		List<HangSanXuat> lstHSXuat = hangSanXuatImpl.layDanhSach();
		for (HangSanXuat hangSanXuat : lstHSXuat) {
			lstHSX.put(hangSanXuat.getId(), hangSanXuat.getTenHangSX());
		}
		return lstHSX;
	}

	@ModelAttribute("lstXX")
	public Map<Integer, String> layDanhSachXX() {
		Map<Integer, String> lstXX = new HashMap<Integer, String>();
		List<XuatXu> lstXXu = xuatXuImpl.layDanhSach();
		for (XuatXu xuatxu : lstXXu) {
			lstXX.put(xuatxu.getId(), xuatxu.getXuatXu());
		}
		return lstXX;
	}
	
	@ModelAttribute("lstLSP")
	public Map<Integer, String> layDanhSachLoaiSanPham() {
		Map<Integer, String> lstLSP = new HashMap<Integer, String>();
		List<LoaiSanPham> lstLoaiSP = loaispImpl.layDanhSach();
		for (LoaiSanPham sp : lstLoaiSP) {
			lstLSP.put(sp.getId(), sp.getTenLoai());
		}
		return lstLSP;
	}

}
