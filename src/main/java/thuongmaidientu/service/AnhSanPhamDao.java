package thuongmaidientu.service;

import thuongmaidientu.model.AnhSanPham;

public interface AnhSanPhamDao extends HanhDong<AnhSanPham, Integer>{
	boolean xoaASPtheoSP(Integer sanPhamId);
}
