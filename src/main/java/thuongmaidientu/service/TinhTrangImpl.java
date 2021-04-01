package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.TinhTrang;

@Service
public class TinhTrangImpl implements TinhTrangDao{
	@Override
	public List<TinhTrang> layDanhSach() {
		// Khai báo 1 danh sách
		List<TinhTrang> lstTinhTrang = new ArrayList<TinhTrang>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<TinhTrang> query = session.createQuery("from TinhTrang", TinhTrang.class);

		lstTinhTrang = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstTinhTrang;
	}

	@Override
	public TinhTrang layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		TinhTrang objTinhTrang = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objTinhTrang = (TinhTrang) session.get(TinhTrang.class, id);

		tx.commit();

		return objTinhTrang;
	}

	@Override
	public boolean themMoi(TinhTrang obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(TinhTrang obj) {
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
		TinhTrang objTinhTrang = (TinhTrang) session.get(TinhTrang.class, id);

		if (objTinhTrang != null) {
			session.delete(objTinhTrang);

			tx.commit();

			return true;
		}

		return false;
	}
}
