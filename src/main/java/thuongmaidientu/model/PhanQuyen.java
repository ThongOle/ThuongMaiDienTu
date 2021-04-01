package thuongmaidientu.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PhanQuyen")
public class PhanQuyen implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2913773294660223617L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	private int id;
	@Column(name = "VaiTroId")
	private int vaiTroId;
	@Column(name = "ChucNangId")
	private int chucNangId;
	@Column(name = "DanhSach" )
	private int danhSach;
	public int getDanhSach() {
		return danhSach;
	}
	public void setDanhSach(int danhSach) {
		this.danhSach = danhSach;
	}
	public int getSua() {
		return sua;
	}
	public void setSua(int sua) {
		this.sua = sua;
	}
	public int getXoa() {
		return xoa;
	}
	public void setXoa(int xoa) {
		this.xoa = xoa;
	}
	@Column(name = "Sua")
	private int sua;
	@Column(name = "Xoa")
	private int xoa;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getVaiTroId() {
		return vaiTroId;
	}
	public void setVaiTroId(int vaiTroId) {
		this.vaiTroId = vaiTroId;
	}
	public int getChucNangId() {
		return chucNangId;
	}
	public void setChucNangId(int chucNangId) {
		this.chucNangId = chucNangId;
	}
	
}
