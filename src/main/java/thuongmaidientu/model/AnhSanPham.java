package thuongmaidientu.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "AnhSanPham")

public class AnhSanPham implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5649520241161420735L;
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	private int id;
	@Column(name = "Anh")
	private String anh;
	
	@ManyToOne
	@JoinColumn (name = "SanPhamId")
	@JsonBackReference
	private SanPham objSanPham;
	
	public SanPham getObjSanPham() {
		return objSanPham;
	}
	public void setObjSanPham(SanPham objSanPham) {
		this.objSanPham = objSanPham;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	
	
	
}
