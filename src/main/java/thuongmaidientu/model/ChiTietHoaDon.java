package thuongmaidientu.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;


@Entity
@Table(name = "ChiTietHoaDon")
public class ChiTietHoaDon implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1106125229661313112L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	private int id;
	@Column(name = "SanPhamId")
	private int sanPhamId;
	@Column(name = "SoLuong")
	private int soLuong;
	@Column(name = "gia")
	private int gia;
	
	@ManyToOne (fetch = FetchType.LAZY)
	@JsonBackReference
	@JoinColumn (name = "HoaDonId")
	private HoaDon objHD; 
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SanPhamId", insertable = false, updatable = false)
	private GiaTriThuocTinh objGTTT;
	
	
	public GiaTriThuocTinh getObjGTTT() {
		return objGTTT;
	}
	public void setObjGTTT(GiaTriThuocTinh objGTTT) {
		this.objGTTT = objGTTT;
	}
	public HoaDon getObjHD() {
		return objHD;
	}
	public void setObjHD(HoaDon objHD) {
		this.objHD = objHD;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getSanPhamId() {
		return sanPhamId;
	}
	public void setSanPhamId(int sanPhamId) {
		this.sanPhamId = sanPhamId;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
}
