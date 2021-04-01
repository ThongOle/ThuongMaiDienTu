package thuongmaidientu.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "DanhMuc")
public class DanhMuc implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -9067589455314016561L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id",unique = true, nullable = false )
	private int id;
	@Column (name = "TenDanhMuc")
	private String tenDanhMuc;
	@Column (name = "DanhMucCha")
	private int danhMucCha;
	
	@OneToMany(fetch = FetchType.LAZY, cascade=CascadeType.ALL, mappedBy = "objDanhMuc")
	List<SanPham> lstSP = new ArrayList<SanPham>();
	
	@Transient
	private boolean dem;
	
	@Transient
	private List<DanhMuc> lstDanhMuc = new ArrayList<DanhMuc>();
	
	public List<DanhMuc> getLstDanhMuc() {
		return lstDanhMuc;
	}
	public void setLstDanhMuc(List<DanhMuc> lstDanhMuc) {
		this.lstDanhMuc = lstDanhMuc;
	}
	public boolean isDem() {
		return dem;
	}
	public void setDem(boolean dem) {
		this.dem = dem;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTenDanhMuc() {
		return tenDanhMuc;
	}
	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}
	public int getDanhMucCha() {
		return danhMucCha;
	}
	public void setDanhMucCha(int danhMucCha) {
		this.danhMucCha = danhMucCha;
	}

}
