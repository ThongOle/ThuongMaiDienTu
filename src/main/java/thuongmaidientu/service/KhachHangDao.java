package thuongmaidientu.service;

import thuongmaidientu.model.KhachHang;

public interface KhachHangDao extends HanhDong<KhachHang, Integer>{
	KhachHang layKHtheoEmail(String email);
}
