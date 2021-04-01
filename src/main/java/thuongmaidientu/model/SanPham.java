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

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "SanPham")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class,property = "id")
public class SanPham implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5992101155232980565L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	private int id;
	@Column(name = "MaSanPham", nullable = true)
	private String maSanPham;
	@Column(name = "TenSanPham", nullable = true)
	private String tenSanPham;
	@Column(name = "GiaTien", nullable = true)
	private float giaTien;
	@Column(name = "SoLuong", nullable = true)
	private int soLuong;
	@Column(name = "MoTa", nullable = true)
	private String moTa;
	@Column(name = "DanhMucId", nullable = true)
	private int danhMucId;
	@Column(name = "LoaiSPId", nullable = true)
	private int loaiSPId;
	@Column(name = "HangSXId", nullable = true)
	private int hangSXId;
	@Column(name = "XuatXuId", nullable = true)
	private int xuatXuId;
	@Column(name = "NgayTao", nullable = true)
	private Date ngayTao;
	@Column(name = "NgayCapNhat", nullable = true)
	private Date ngayCapNhat;
	@Column(name = "NgayXoa", nullable = true)
	private Date ngayXoa;
	@Column(name = "ThuocTinh1", nullable = true)
	private String thuocTinh1;
	@Column(name = "ThuocTinh2", nullable = true)
	private String thuocTinh2;
	
	
	@OneToMany(fetch = FetchType.LAZY, cascade=CascadeType.ALL, mappedBy = "objSanPham")
	@JsonManagedReference
	private List<AnhSanPham> lstAnhSP = new ArrayList<AnhSanPham>();
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "objSanPham")
	private List<GiaTriThuocTinh> lstGTTT = new ArrayList<GiaTriThuocTinh>();
	
	@ManyToOne (fetch = FetchType.LAZY)
	@JsonBackReference
	@JoinColumn (name = "danhMucId", insertable = false, updatable = false)
	private DanhMuc objDanhMuc;
	
	@ManyToOne (fetch = FetchType.LAZY)
	@JsonBackReference
	@JoinColumn (name = "hangSXId", insertable = false, updatable = false)
	private HangSanXuat objHangSanXuat;
	
	@ManyToOne (fetch = FetchType.LAZY)
	@JsonBackReference
	@JoinColumn (name = "XuatXuId", insertable = false, updatable = false)
	private XuatXu objXuatXu;
	
	@ManyToOne (fetch = FetchType.LAZY)
	@JsonBackReference
	@JoinColumn (name = "LoaiSPId", insertable = false, updatable = false)
	private LoaiSanPham objLSP;
	
	public LoaiSanPham getObjLSP() {
		return objLSP;
	}
	public void setObjLSP(LoaiSanPham objLSP) {
		this.objLSP = objLSP;
	}
	public XuatXu getObjXuatXu() {
		return objXuatXu;
	}
	public void setObjXuatXu(XuatXu objXuatXu) {
		this.objXuatXu = objXuatXu;
	}
	public HangSanXuat getObjHangSanXuat() {
		return objHangSanXuat;
	}
	public void setObjHangSanXuat(HangSanXuat objHangSanXuat) {
		this.objHangSanXuat = objHangSanXuat;
	}
	public DanhMuc getObjDanhMuc() {
		return objDanhMuc;
	}
	public void setObjDanhMuc(DanhMuc objDanhMuc) {
		this.objDanhMuc = objDanhMuc;
	}
	public List<GiaTriThuocTinh> getLstGTTT() {
		return lstGTTT;
	}
	public void setLstGTTT(List<GiaTriThuocTinh> lstGTTT) {
		this.lstGTTT = lstGTTT;
	}
	public List<AnhSanPham> getLstAnhSP() {
		return lstAnhSP;
	}
	public void setLstAnhSP(List<AnhSanPham> lstAnhSP) {
		this.lstAnhSP = lstAnhSP;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMaSanPham() {
		return maSanPham;
	}
	public void setMaSanPham(String maSanPham) {
		this.maSanPham = maSanPham;
	}
	public String getTenSanPham() {
		return tenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}
	public float getGiaTien() {
		return giaTien;
	}
	public void setGiaTien(float giaTien) {
		this.giaTien = giaTien;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public int getDanhMucId() {
		return danhMucId;
	}
	public void setDanhMucId(int danhMucId) {
		this.danhMucId = danhMucId;
	}
	public int getLoaiSPId() {
		return loaiSPId;
	}
	public void setLoaiSPId(int loaiSPId) {
		this.loaiSPId = loaiSPId;
	}
	public int getHangSXId() {
		return hangSXId;
	}
	public void setHangSXId(int hangSXId) {
		this.hangSXId = hangSXId;
	}
	public int getXuatXuId() {
		return xuatXuId;
	}
	public void setXuatXuId(int xuatXuId) {
		this.xuatXuId = xuatXuId;
	}
	public Date getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
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
	public String getThuocTinh1() {
		return thuocTinh1;
	}
	public void setThuocTinh1(String thuocTinh1) {
		this.thuocTinh1 = thuocTinh1;
	}
	public String getThuocTinh2() {
		return thuocTinh2;
	}
	public void setThuocTinh2(String thuocTinh2) {
		this.thuocTinh2 = thuocTinh2;
	}
		
}
