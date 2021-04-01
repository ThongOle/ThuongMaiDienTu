package thuongmaidientu.service;

import java.util.List;

public interface HanhDong <T, idT>{
	List<T>layDanhSach();
	T layChiTiet(idT id);
	boolean themMoi (T obj);
	boolean sua (T obj);
	boolean xoa (idT id);
}
