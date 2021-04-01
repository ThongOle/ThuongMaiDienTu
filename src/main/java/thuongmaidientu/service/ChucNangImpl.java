package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.ChucNang;

@Service
public class ChucNangImpl implements ChucNangDao{
	@Override
	public List<ChucNang> layDanhSach() {
		// Khai báo 1 danh sách
		List<ChucNang> lstChucNang = new ArrayList<ChucNang>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<ChucNang> query = session.createQuery("from ChucNang", ChucNang.class);

		lstChucNang = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstChucNang;
	}

	@Override
	public ChucNang layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		ChucNang objChucNang = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objChucNang = (ChucNang) session.get(ChucNang.class, id);

		tx.commit();

		return objChucNang;
	}

	@Override
	public boolean themMoi(ChucNang obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(ChucNang obj) {
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
		ChucNang objChucNang = (ChucNang) session.get(ChucNang.class, id);

		if (objChucNang != null) {
			session.delete(objChucNang);

			tx.commit();

			return true;
		}

		return false;
	}
}
