package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.DanhMuc;
import thuongmaidientu.model.KhachHang;

@Service
public class KhachHangImpl implements KhachHangDao{
	@Override
	public List<KhachHang> layDanhSach() {
		// Khai báo 1 danh sách
		List<KhachHang> lstKhachHang = new ArrayList<KhachHang>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<KhachHang> query = session.createQuery("from KhachHang", KhachHang.class);

		lstKhachHang = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstKhachHang;
	}

	@Override
	public KhachHang layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		KhachHang objKhachHang = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objKhachHang = (KhachHang) session.get(KhachHang.class, id);

		tx.commit();

		return objKhachHang;
	}

	@Override
	public boolean themMoi(KhachHang obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(KhachHang obj) {
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
		KhachHang objKhachHang = (KhachHang) session.get(KhachHang.class, id);

		if (objKhachHang != null) {
			session.delete(objKhachHang);

			tx.commit();

			return true;
		}

		return false;
	}
	@Override
	public KhachHang layKHtheoEmail(String email) {
		// TODO Auto-generated method stub
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<KhachHang> query = session.createQuery("from KhachHang where (Email =:email)", KhachHang.class);
		query.setParameter("email", email);
		List<KhachHang> lst = query.getResultList();
		tx.commit();
				
		return lst.get(0);
	}
}
