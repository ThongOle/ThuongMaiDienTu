package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.XuatXu;

@Service
public class XuatXuImpl implements XuatXuDao{
	@Override
	public List<XuatXu> layDanhSach() {
		// Khai báo 1 danh sách
		List<XuatXu> lstXuatXu = new ArrayList<XuatXu>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<XuatXu> query = session.createQuery("from XuatXu", XuatXu.class);

		lstXuatXu = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstXuatXu;
	}

	@Override
	public XuatXu layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		XuatXu objXuatXu = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objXuatXu = (XuatXu) session.get(XuatXu.class, id);

		tx.commit();

		return objXuatXu;
	}

	@Override
	public boolean themMoi(XuatXu obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(XuatXu obj) {
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
		XuatXu objXuatXu = (XuatXu) session.get(XuatXu.class, id);

		if (objXuatXu != null) {
			session.delete(objXuatXu);

			tx.commit();

			return true;
		}

		return false;
	}
}
