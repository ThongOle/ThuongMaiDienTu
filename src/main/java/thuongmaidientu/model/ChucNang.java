package thuongmaidientu.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ChucNang")
public class ChucNang implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2873419302685427204L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	private int id;
	@Column(name = "TenChucNang")
	private String tenChucNang;
	@Column(name = "TenForm")
	private String tenForm;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTenChucNang() {
		return tenChucNang;
	}
	public void setTenChucNang(String tenChucNang) {
		this.tenChucNang = tenChucNang;
	}
	public String getTenForm() {
		return tenForm;
	}
	public void setTenForm(String tenForm) {
		this.tenForm = tenForm;
	}
	
}
