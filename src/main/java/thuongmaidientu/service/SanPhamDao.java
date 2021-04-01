package thuongmaidientu.service;

import java.util.List;

import thuongmaidientu.model.SanPham;

public interface SanPhamDao extends HanhDong<SanPham, Integer>{
	List<SanPham>timKiemSanPhamTheoDanhMuc(int madanhmuc);
}
