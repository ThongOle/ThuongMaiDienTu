package thuongmaidientu.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "DiaChi")
public class DiaChi {
	
	@Id
	@Column(name = "Id", unique = true, nullable = false)
	private String id;
	@Column (name = "Ten")
	private String ten;
	@Column(name = "MaCha")
	private String maCha;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public String getMaCha() {
		return maCha;
	}
	public void setMaCha(String maCha) {
		this.maCha = maCha;
	}
}
