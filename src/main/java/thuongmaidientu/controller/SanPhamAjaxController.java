package thuongmaidientu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import thuongmaidientu.model.DanhMuc;
import thuongmaidientu.service.DanhMucImpl;

@RestController
@RequestMapping(value = "/admin")
public class SanPhamAjaxController {
	@Autowired
	DanhMucImpl danhMucImpl;
	@RequestMapping(value="/sanphamadd/{dmId}", produces= {"application/json"}, method = RequestMethod.GET)
	public ResponseEntity<Object> layChiTiet(@PathVariable("dmId") int dmId)
	{	
		List<DanhMuc> lstDanhMuc1 = danhMucImpl.timKiemDanhMuc(dmId);
		for (DanhMuc danhMuc : lstDanhMuc1) {
			danhMuc.setDem(danhMucImpl.kiemTraDanhMucCon(danhMuc.getId()));
		}
		return new ResponseEntity<Object>(lstDanhMuc1, HttpStatus.OK);
	}
	
}
