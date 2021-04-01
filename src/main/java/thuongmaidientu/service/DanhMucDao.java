package thuongmaidientu.service;
import java.util.List;

import thuongmaidientu.model.DanhMuc;

public interface DanhMucDao extends HanhDong<DanhMuc, Integer>{
	List<DanhMuc>timKiemDanhMuc(int maDanhMuc);
	String layChuoiDanhMuc(int maDanhMuc);
	boolean kiemTraDanhMucCon(int maDanhMuc);
	
}
