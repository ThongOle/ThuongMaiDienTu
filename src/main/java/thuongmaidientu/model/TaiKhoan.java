package thuongmaidientu.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TaiKhoan")
public class TaiKhoan implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5354106677562056941L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	private int id;
	@Column(name = "TaiKhoan")
	private String taiKhoan;
	@Column(name = "MatKhau")
	private String matKhau;
	@Column(name = "HoTen")
	private String hoTen;
	@Column(name = "Email")
	private String email;
	@Column(name = "DienThoai")
	private String dienThoai;
	@Column(name = "VaiTroId")
	private int vaiTroId;
	@Column(name = "Avatar")
	private String avatar;
	@Column (name = "GioiTinh")
	private int gioiTinh;
	
	public int getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(int gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	@ManyToOne
	@JoinColumn (name = "vaiTroId", insertable = false, updatable = false)
	private VaiTro objVaiTro; 
	
	public VaiTro getObjVaiTro() {
		return objVaiTro;
	}
	public void setObjVaiTro(VaiTro objVaiTro) {
		this.objVaiTro = objVaiTro;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public int getVaiTroId() {
		return vaiTroId;
	}
	public void setVaiTroId(int vaiTroId) {
		this.vaiTroId = vaiTroId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTaiKhoan() {
		return taiKhoan;
	}
	public void setTaiKhoan(String taiKhoan) {
		this.taiKhoan = taiKhoan;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
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
	
}
