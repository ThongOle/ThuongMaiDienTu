package thuongmaidientu.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "HoaDon")
public class HoaDon implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 504070110662535677L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	private int id;
	@Column(name = "MaKhachHang")
	private int maKhachHang;
	@Column(name = "NgayTao")
	private Date ngayTao;
	@Column(name = "TinhTrang")
	private int tinhTrang;
	@Column(name = "NgayCapNhat")
	private Date ngayCapNhat;
	
	@Column(name = "tinhId")
	private String tinhId;
	@Column(name = "huyenId")
	private String huyenId;
	@Column(name = "xaId")
	private String xaId;
	@Column(name = "dcchitiet")
	private String dcChiTiet;
	@Column(name = "tenKH")
	private String tenKH;
	@Column(name = "email")
	private String email;
	@Column(name = "DienThoai")
	private String dienThoai;
	@Column(name = "Ghichu")
	private String ghiChu;
	@Column(name = "hthuctt")
	private int hThucTT;
	
	public int gethThucTT() {
		return hThucTT;
	}

	public void sethThucTT(int hThucTT) {
		this.hThucTT = hThucTT;
	}

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "objHD")
	@JsonManagedReference
	private List<ChiTietHoaDon> lstCTHD = new ArrayList<ChiTietHoaDon>();
	
	@ManyToOne
	@JoinColumn (name = "tinhTrang", insertable = false, updatable = false)
	private TinhTrang objTinhTrang; 
	
	@ManyToOne
	@JoinColumn (name = "hthuctt", insertable = false, updatable = false)
	private HinhThucThanhToan objHTTT; 
	
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

	public TinhTrang getObjTinhTrang() {
		return objTinhTrang;
	}

	public void setObjTinhTrang(TinhTrang objTinhTrang) {
		this.objTinhTrang = objTinhTrang;
	}

	public HinhThucThanhToan getObjHTTT() {
		return objHTTT;
	}

	public void setObjHTTT(HinhThucThanhToan objHTTT) {
		this.objHTTT = objHTTT;
	}

	public List<ChiTietHoaDon> getLstCTHD() {
		return lstCTHD;
	}

	public void setLstCTHD(List<ChiTietHoaDon> lstCTHD) {
		this.lstCTHD = lstCTHD;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
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

	public String getDcChiTiet() {
		return dcChiTiet;
	}

	public void setDcChiTiet(String dcChiTiet) {
		this.dcChiTiet = dcChiTiet;
	}

	public String getTenKH() {
		return tenKH;
	}

	public void setTenKH(String tenKH) {
		this.tenKH = tenKH;
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMaKhachHang() {
		return maKhachHang;
	}

	public void setMaKhachHang(int maKhachHang) {
		this.maKhachHang = maKhachHang;
	}

	public Date getNgayTao() {
		return ngayTao;
	}

	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}

	public int getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(int tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	

	public Date getNgayCapNhat() {
		return ngayCapNhat;
	}

	public void setNgayCapNhat(Date ngayCapNhat) {
		this.ngayCapNhat = ngayCapNhat;
	}
}
