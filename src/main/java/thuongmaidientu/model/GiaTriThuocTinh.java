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

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "GiaTriThuocTinh")

@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class,property = "id")
public class GiaTriThuocTinh implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -935992965308807195L;
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	private int id;
	
	@Column(name = "GiaTien")
	private int giaTien;
	@Column(name = "soLuong")
	private int soLuong;
	@Column(name = "masanpham")
	private String maSanPham;
	
	@Column(name = "ThuocTinh1")
	private String thuocTinh1;
	
	@Column(name = "ThuocTinh2")
	private String thuocTinh2;
	
	@ManyToOne
	@JoinColumn (name = "SanPhamId")
	private SanPham objSanPham;
		
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
	public SanPham getObjSanPham() {
		return objSanPham;
	}
	public void setObjSanPham(SanPham objSanPham) {
		this.objSanPham = objSanPham;
	}
	public int getGiaTien() {
		return giaTien;
	}
	public void setGiaTien(int giaTien) {
		this.giaTien = giaTien;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public String getMaSanPham() {
		return maSanPham;
	}
	public void setMaSanPham(String maSanPham) {
		this.maSanPham = maSanPham;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
