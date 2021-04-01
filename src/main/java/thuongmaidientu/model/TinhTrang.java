package thuongmaidientu.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TinhTrang")
public class TinhTrang implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8146847894264669488L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	private int id;
	@Column(name = "TenTinhTrang")
	private String tenTinhTrang;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTenTinhTrang() {
		return tenTinhTrang;
	}
	public void setTenTinhTrang(String tenTinhTrang) {
		this.tenTinhTrang = tenTinhTrang;
	}
}
