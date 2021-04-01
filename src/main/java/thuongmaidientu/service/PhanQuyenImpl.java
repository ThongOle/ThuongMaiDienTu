package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.PhanQuyen;

@Service
public class PhanQuyenImpl implements PhanQuyenDao{
	@Override
	public List<PhanQuyen> layDanhSach() {
		// Khai báo 1 danh sách
		List<PhanQuyen> lstPhanQuyen = new ArrayList<PhanQuyen>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<PhanQuyen> query = session.createQuery("from PhanQuyen", PhanQuyen.class);

		lstPhanQuyen = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPhanQuyen;
	}

	@Override
	public PhanQuyen layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		PhanQuyen objPhanQuyen = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objPhanQuyen = (PhanQuyen) session.get(PhanQuyen.class, id);

		tx.commit();

		return objPhanQuyen;
	}

	@Override
	public boolean themMoi(PhanQuyen obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(PhanQuyen obj) {
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
		PhanQuyen objPhanQuyen = (PhanQuyen) session.get(PhanQuyen.class, id);

		if (objPhanQuyen != null) {
			session.delete(objPhanQuyen);

			tx.commit();

			return true;
		}

		return false;
	}
	@Override
	public List<PhanQuyen> timKiemVaiTro(int vaiTroId) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();
		
		TypedQuery<PhanQuyen> query = session.createQuery("from PhanQuyen where VaiTroId =: id", PhanQuyen.class);
		
		query.setParameter("id", vaiTroId);
		List<PhanQuyen> lstPhanQuyen = new ArrayList<PhanQuyen>();
		lstPhanQuyen = query.getResultList();
		tx.commit();

		// Trả về danh sách
		return lstPhanQuyen;
	}
	@Override
	public PhanQuyen layThongTin(int vaiTroId, int chucNangId) {
		// TODO Auto-generated method stub
				Session session = HibernateUtil.getSessionFactory().openSession();
				// Khởi tạo 1 transaction
				Transaction tx = session.beginTransaction();
				TypedQuery<PhanQuyen> query = session.createQuery("from PhanQuyen where VaiTroId =: vt and ChucNangId =: cn", PhanQuyen.class);
				query.setParameter("vt", vaiTroId);
				query.setParameter("cn", chucNangId);
				PhanQuyen objPhanQuyen = query.getSingleResult();
		return objPhanQuyen;
	}
}
