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

@Entity
@Table(name = "VaiTro")
public class VaiTro implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6143513468476810116L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	private int id;
	@Column(name = "TenVaiTro")
	private String tenVaiTro;
	@Column(name = "MoTa")
	private String moTa;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "objVaiTro")
	List<TaiKhoan> lstTaiKhoan = new ArrayList<TaiKhoan>();
	
	
	public List<TaiKhoan> getLstTaiKhoan() {
		return lstTaiKhoan;
	}
	public void setLstTaiKhoan(List<TaiKhoan> lstTaiKhoan) {
		this.lstTaiKhoan = lstTaiKhoan;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTenVaiTro() {
		return tenVaiTro;
	}
	public void setTenVaiTro(String tenVaiTro) {
		this.tenVaiTro = tenVaiTro;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
}
