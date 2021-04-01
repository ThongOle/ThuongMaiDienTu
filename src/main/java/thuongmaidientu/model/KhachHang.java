package thuongmaidientu.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "KhachHang")
public class KhachHang implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5969755985762869002L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	private int id;
	@Column(name = "HoTen")
	private String hoTen;
	@Column(name = "NgaySinh")
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date ngaySinh;
	@Column(name = "Email")
	private String email;
	@Column(name = "DienThoai")
	private String dienThoai;
	@Column(name = "DiaChi")
	private String diaChi;
	@Column(name = "MatKhau")
	private String matKhau;
	@Column(name= "TinhId")
	private String tinhId;
	@Column(name = "HuyenId")
	private String huyenId;
	@Column(name = "XaId")
	private String xaId;
	@Column(name = "GioiTinh")
	private int gioiTinh;
	@ManyToOne
	@JoinColumn (name = "tinhId", insertable = false, updatable = false)
	private DiaChi objTinh; 
	@ManyToOne
	@JoinColumn (name = "huyenId", insertable = false, updatable = false)
	private DiaChi objHuyen; 
	@ManyToOne
	@JoinColumn (name = "xaId", insertable = false, updatable = false)
	private DiaChi objXa;
	
	
	public DiaChi getObjTinh() {
		return objTinh;
	}
	public void setObjTinh(DiaChi objTinh) {
		this.objTinh = objTinh;
	}
	public DiaChi getObjHuyen() {
		return objHuyen;
	}
	public void setObjHuyen(DiaChi objHuyen) {
		this.objHuyen = objHuyen;
	}
	public DiaChi getObjXa() {
		return objXa;
	}
	public void setObjXa(DiaChi objXa) {
		this.objXa = objXa;
	}
	public int getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(int gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getTinhId() {
		return tinhId;
	}
	public void setTinhId(String tinhId) {
		this.tinhId = tinhId;
	}
	public String getHuyenId() {
		return huyenId;
	}
	public void setHuyenId(String huyenId) {
		this.huyenId = huyenId;
	}
	public String getXaId() {
		return xaId;
	}
	public void setXaId(String xaId) {
		this.xaId = xaId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDienThoai() {
		return dienThoai;
	}
	public void setDienThoai(String dienThoai) {
		this.dienThoai = dienThoai;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
}
