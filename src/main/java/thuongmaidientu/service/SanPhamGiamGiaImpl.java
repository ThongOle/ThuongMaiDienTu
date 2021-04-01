package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.SanPhamGiamGia;

@Service
public class SanPhamGiamGiaImpl implements SanPhamGiamGiaDao{
	@Override
	public List<SanPhamGiamGia> layDanhSach() {
		// Khai báo 1 danh sách
		List<SanPhamGiamGia> lstSanPhamGiamGia = new ArrayList<SanPhamGiamGia>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<SanPhamGiamGia> query = session.createQuery("from SanPhamGiamGia", SanPhamGiamGia.class);

		lstSanPhamGiamGia = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstSanPhamGiamGia;
	}

	@Override
	public SanPhamGiamGia layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		SanPhamGiamGia objSanPhamGiamGia = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objSanPhamGiamGia = (SanPhamGiamGia) session.get(SanPhamGiamGia.class, id);

		tx.commit();

		return objSanPhamGiamGia;
	}

	@Override
	public boolean themMoi(SanPhamGiamGia obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(SanPhamGiamGia obj) {
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
		SanPhamGiamGia objSanPhamGiamGia = (SanPhamGiamGia) session.get(SanPhamGiamGia.class, id);

		if (objSanPhamGiamGia != null) {
			session.delete(objSanPhamGiamGia);

			tx.commit();

			return true;
		}

		return false;
	}
}
