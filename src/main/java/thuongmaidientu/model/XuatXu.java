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
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "XuatXu")
public class XuatXu implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6546724031785655853L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	private int id;
	@Column(name = "XuatXu")
	private String xuatXu;
	
	@OneToMany(fetch = FetchType.LAZY, cascade=CascadeType.ALL, mappedBy = "objXuatXu")
	@JsonManagedReference
	List<SanPham> lstSP = new ArrayList<SanPham>();
	public List<SanPham> getLstSP() {
		return lstSP;
	}
	public void setLstSP(List<SanPham> lstSP) {
		this.lstSP = lstSP;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getXuatXu() {
		return xuatXu;
	}
	public void setXuatXu(String xuatXu) {
		this.xuatXu = xuatXu;
	}
	
}
