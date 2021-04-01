package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.VaiTro;

@Service
public class VaiTroImpl implements VaiTroDao{
	@Override
	public List<VaiTro> layDanhSach() {
		// Khai báo 1 danh sách
		List<VaiTro> lstVaiTro = new ArrayList<VaiTro>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<VaiTro> query = session.createQuery("from VaiTro", VaiTro.class);

		lstVaiTro = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstVaiTro;
	}

	@Override
	public VaiTro layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		VaiTro objVaiTro = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objVaiTro = (VaiTro) session.get(VaiTro.class, id);

		tx.commit();

		return objVaiTro;
	}

	@Override
	public boolean themMoi(VaiTro obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(VaiTro obj) {
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
		VaiTro objVaiTro = (VaiTro) session.get(VaiTro.class, id);

		if (objVaiTro != null) {
			session.delete(objVaiTro);

			tx.commit();

			return true;
		}

		return false;
	}
}
