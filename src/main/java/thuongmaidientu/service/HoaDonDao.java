package thuongmaidientu.service;

import java.util.List;

import thuongmaidientu.model.HoaDon;

public interface HoaDonDao extends HanhDong<HoaDon, Integer>{
	List<HoaDon> timKiemTheoIdKH(int id);
}
