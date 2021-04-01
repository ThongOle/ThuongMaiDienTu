package thuongmaidientu.service;

import java.util.List;

import thuongmaidientu.model.DiaChi;

public interface DiaChiDao extends HanhDong<DiaChi, String>{
	List<DiaChi> layListDiaChiTheoIdCha (String idDiaChi);
}
