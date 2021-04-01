package thuongmaidientu.service;

import thuongmaidientu.model.TaiKhoan;

public interface TaiKhoanDao extends HanhDong<TaiKhoan, Integer>{
	TaiKhoan layTKtheoUserName(String username);
}
