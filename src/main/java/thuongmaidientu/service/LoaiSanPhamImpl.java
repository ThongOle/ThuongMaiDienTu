package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.LoaiSanPham;

@Service
public class LoaiSanPhamImpl implements LoaiSanPhamDao{
	@Override
	public List<LoaiSanPham> layDanhSach() {
		// Khai báo 1 danh sách
		List<LoaiSanPham> lstLoaiSanPham = new ArrayList<LoaiSanPham>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<LoaiSanPham> query = session.createQuery("from LoaiSanPham", LoaiSanPham.class);

		lstLoaiSanPham = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstLoaiSanPham;
	}

	@Override
	public LoaiSanPham layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		LoaiSanPham objLoaiSanPham = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objLoaiSanPham = (LoaiSanPham) session.get(LoaiSanPham.class, id);

		tx.commit();

		return objLoaiSanPham;
	}

	@Override
	public boolean themMoi(LoaiSanPham obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(LoaiSanPham obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.update(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean xoa(Integer id) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách cần xoá
		LoaiSanPham objLoaiSanPham = (LoaiSanPham) session.get(LoaiSanPham.class, id);

		if (objLoaiSanPham != null) {
			session.delete(objLoaiSanPham);

			tx.commit();

			return true;
		}

		return false;
	}
}
