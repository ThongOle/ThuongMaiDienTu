package thuongmaidientu.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import thuongmaidientu.model.ChiTietHoaDon;
import thuongmaidientu.model.DanhMuc;
import thuongmaidientu.model.DiaChi;
import thuongmaidientu.model.GiaTriThuocTinh;
import thuongmaidientu.model.GioHang;
import thuongmaidientu.model.HoaDon;
import thuongmaidientu.model.SanPham;
import thuongmaidientu.service.DanhMucImpl;
import thuongmaidientu.service.DiaChiImpl;
import thuongmaidientu.service.GiaTriThuocTinhImpl;
import thuongmaidientu.service.HoaDonImpl;
import thuongmaidientu.service.SanPhamImpl;

@RestController
@RequestMapping(value = "/home")
public class TrangChuAjaxController {
	@Autowired
	DanhMucImpl danhMucImpl;
	
	@Autowired
	SanPhamImpl sanPhamImpl;
	
	@Autowired
	GiaTriThuocTinhImpl gtttImpl;
	
	@Autowired
	DiaChiImpl diaChiImpl;
	
	@Autowired
	HoaDonImpl hoaDonImpl;

	@RequestMapping(value="/laydanhmuc", produces= {"application/json"}, method = RequestMethod.GET)
	public ResponseEntity<Object> layDanhMuc(){	
		List<DanhMuc> lstDM = danhMucImpl.timKiemDanhMuc(0);
		for (int i = 0 ; i <lstDM.size(); i++) {
			lstDM.get(i).setLstDanhMuc(danhMucImpl.timKiemDanhMuc(lstDM.get(i).getId()));
		}
		return new ResponseEntity<Object>(lstDM, HttpStatus.OK);
	}
	
	
	@RequestMapping(value="/laychitiet-sp/{sanphamid}", produces= {"application/json"}, method = RequestMethod.GET)
	public ResponseEntity<Object> layChiTietSanPham(@PathVariable("sanphamid") int id){	
		
		SanPham objSanPham= sanPhamImpl.layChiTiet(id);
		
		return new ResponseEntity<Object>(objSanPham, HttpStatus.OK);
	}
	@RequestMapping(value="/laylistGTTT/{sanphamid}", produces= {"application/json"}, method = RequestMethod.GET)
	public ResponseEntity<Object> listTT(@PathVariable("sanphamid") int id){	
		
		List<GiaTriThuocTinh> lstGTTT = gtttImpl.timKiemTheoSP(id);
		
		return new ResponseEntity<Object>(lstGTTT, HttpStatus.OK);
	}
	
	@RequestMapping(value="/giohang-preview", produces= {"application/json"}, method = RequestMethod.GET)
	public ResponseEntity<Object> layChiTietGioHang(@RequestParam("lstId") String lstId) throws JsonMappingException, JsonProcessingException{	
		
		ObjectMapper mapper = new ObjectMapper();
		 
		List<GioHang> listObjSP = Arrays.asList(mapper.readValue(lstId, GioHang[].class));
		List<GiaTriThuocTinh> lstTT = new ArrayList<GiaTriThuocTinh>();
		
		for (int i = 0; i < listObjSP.size(); i++) {
			GiaTriThuocTinh gttt = new GiaTriThuocTinh();
			gttt = gtttImpl.layChiTiet(listObjSP.get(i).getIdTT());
			lstTT.add(gttt);
		}
		return new ResponseEntity<Object>(lstTT, HttpStatus.OK);
	}
	@RequestMapping(value="/laydiachi", produces= {"application/json"}, method = RequestMethod.GET)
	public ResponseEntity<Object> layDiaChi(@RequestParam("diaChiId") String diaChiId){
		
		List<DiaChi> lstDC = diaChiImpl.layListDiaChiTheoIdCha(diaChiId);
		
		return new ResponseEntity<Object>(lstDC, HttpStatus.OK);
	}
	@RequestMapping(value="/thanhtoan" ,produces= {"application/json"}, method = RequestMethod.GET)
	public ResponseEntity<Integer> thanhToan( 
			@RequestParam("tinhId")String tinhId, 
			@RequestParam("huyenId")String huyenId, 
			@RequestParam("xaId") String xaId,
			@RequestParam("maKhachHang") int maKhachHang,
			@RequestParam("tenKH") String tenKH,
			@RequestParam("email") String email,
			@RequestParam("dienThoai") String dienThoai,
			@RequestParam("dcChiTiet") String dcChiTiet,
			@RequestParam("ghiChu") String ghiChu,
			@RequestParam("lstTT") String lstTT, 
			@RequestParam("htTT") int htTT
			
			) throws JsonMappingException, JsonProcessingException {
		
		ObjectMapper mapper = new ObjectMapper();
		 
		List<GioHang> listObjSP = Arrays.asList(mapper.readValue(lstTT, GioHang[].class));
		List<GiaTriThuocTinh> lstGTTT = new ArrayList<GiaTriThuocTinh>();
		for (int i = 0; i < listObjSP.size(); i++) {
			GiaTriThuocTinh gttt = new GiaTriThuocTinh();
			gttt = gtttImpl.layChiTiet(listObjSP.get(i).getIdTT());
			lstGTTT.add(gttt);
		}
		HoaDon objHoaDon = new HoaDon();
		List<ChiTietHoaDon> lstHDCT = new ArrayList<ChiTietHoaDon>();
		for (int i = 0 ; i < lstGTTT.size(); i++) {
			ChiTietHoaDon cthd = new ChiTietHoaDon();
			cthd.setGia(lstGTTT.get(i).getGiaTien());
			cthd.setSanPhamId(lstGTTT.get(i).getId());
			cthd.setSoLuong(listObjSP.get(i).getSoLuong());
			cthd.setObjHD(objHoaDon);
			lstHDCT.add(cthd);
		}
		
		objHoaDon.setLstCTHD(lstHDCT);
		objHoaDon.setMaKhachHang(maKhachHang);
		Date date = new Date();
		objHoaDon.setNgayTao(date);
		objHoaDon.setTinhId(tinhId);
		objHoaDon.setHuyenId(huyenId);
		objHoaDon.setXaId(xaId);
		objHoaDon.setDcChiTiet(dcChiTiet);
		objHoaDon.setTenKH(tenKH);
		objHoaDon.setEmail(email);
		objHoaDon.setDienThoai(dienThoai);
		objHoaDon.setGhiChu(ghiChu);
		objHoaDon.sethThucTT(htTT);
		objHoaDon.setTinhTrang(0);
		
		hoaDonImpl.themMoi(objHoaDon);
		Integer a = 1;
		
		return new ResponseEntity<Integer>(a, HttpStatus.OK);
	}
}