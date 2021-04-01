package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.HangSanXuat;

@Service
public class HangSanXuatImpl implements HangSanXuatDao {
	@Override
	public List<HangSanXuat> layDanhSach() {
		// Khai báo 1 danh sách
		List<HangSanXuat> lstHangSanXuat = new ArrayList<HangSanXuat>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<HangSanXuat> query = session.createQuery("from HangSanXuat", HangSanXuat.class);

		lstHangSanXuat = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstHangSanXuat;
	}

	@Override
	public HangSanXuat layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		HangSanXuat objHangSanXuat = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objHangSanXuat = (HangSanXuat) session.get(HangSanXuat.class, id);

		tx.commit();

		return objHangSanXuat;
	}

	@Override
	public boolean themMoi(HangSanXuat obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(HangSanXuat obj) {
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
		HangSanXuat objHangSanXuat = (HangSanXuat) session.get(HangSanXuat.class, id);

		if (objHangSanXuat != null) {
			session.delete(objHangSanXuat);

			tx.commit();

			return true;
		}

		return false;
	}
}
