package thuongmaidientu.service;

import java.util.List;

import thuongmaidientu.model.GiaTriThuocTinh;

public interface GiaTriThuocTinhDao extends HanhDong<GiaTriThuocTinh, Integer>{
	List<GiaTriThuocTinh> timKiemTheoSP(Integer SanPhamId);
	boolean xoaGTTTtheoSP(Integer SanPhamId);
}
