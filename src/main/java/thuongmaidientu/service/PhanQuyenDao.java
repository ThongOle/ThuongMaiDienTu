package thuongmaidientu.service;

import java.util.List;

import thuongmaidientu.model.PhanQuyen;

public interface PhanQuyenDao extends HanhDong<PhanQuyen, Integer>{
	List<PhanQuyen> timKiemVaiTro(int vaiTroId);
	PhanQuyen layThongTin (int vaiTroId, int chucNangId);
}
