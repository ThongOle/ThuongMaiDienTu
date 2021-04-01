package thuongmaidientu.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "SanPhamGiamGia")
public class SanPhamGiamGia implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5263977075433616467L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	private int id;
	@Column(name = "SanPhamId")
	private int sanPhamId;
	@Column(name = "GiaGiam")
	private float giaGiam;
	@Column(name = "ThoiGian")
	private Date thoiGian;
	@Column(name = "NgayThem")
	private Date ngayThem;
	@Column(name = "NgayCapNhat")
	private Date ngayCapNhat;
	@Column(name = "NgayXoa")
	private Date ngayXoa;
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
	public float getGiaGiam() {
		return giaGiam;
	}
	public void setGiaGiam(float giaGiam) {
		this.giaGiam = giaGiam;
	}
	public Date getThoiGian() {
		return thoiGian;
	}
	public void setThoiGian(Date thoiGian) {
		this.thoiGian = thoiGian;
	}
	public Date getNgayThem() {
		return ngayThem;
	}
	public void setNgayThem(Date ngayThem) {
		this.ngayThem = ngayThem;
	}
	public Date getNgayCapNhat() {
		return ngayCapNhat;
	}
	public void setNgayCapNhat(Date ngayCapNhat) {
		this.ngayCapNhat = ngayCapNhat;
	}
	public Date getNgayXoa() {
		return ngayXoa;
	}
	public void setNgayXoa(Date ngayXoa) {
		this.ngayXoa = ngayXoa;
	}
}
