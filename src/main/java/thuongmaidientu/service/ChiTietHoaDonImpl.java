package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.ChiTietHoaDon;

@Service
public class ChiTietHoaDonImpl implements ChiTietHoaDonDao{
	@Override
	public List<ChiTietHoaDon> layDanhSach() {
		// Khai báo 1 danh sách
		List<ChiTietHoaDon> lstChiTietHoaDon = new ArrayList<ChiTietHoaDon>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<ChiTietHoaDon> query = session.createQuery("from ChiTietHoaDon", ChiTietHoaDon.class);

		lstChiTietHoaDon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstChiTietHoaDon;
	}

	@Override
	public ChiTietHoaDon layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		ChiTietHoaDon objChiTietHoaDon = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objChiTietHoaDon = (ChiTietHoaDon) session.get(ChiTietHoaDon.class, id);

		tx.commit();

		return objChiTietHoaDon;
	}

	@Override
	public boolean themMoi(ChiTietHoaDon obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(ChiTietHoaDon obj) {
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
		ChiTietHoaDon objChiTietHoaDon = (ChiTietHoaDon) session.get(ChiTietHoaDon.class, id);

		if (objChiTietHoaDon != null) {
			session.delete(objChiTietHoaDon);

			tx.commit();

			return true;
		}

		return false;
	}
}
