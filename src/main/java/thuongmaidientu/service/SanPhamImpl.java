package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.DanhMuc;
import thuongmaidientu.model.SanPham;

@Service
public class SanPhamImpl implements SanPhamDao {
	@Override
	public List<SanPham> layDanhSach() {
		// Khai báo 1 danh sách
		List<SanPham> lstSanPham = new ArrayList<SanPham>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().openSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<SanPham> query = session.createQuery("from SanPham", SanPham.class);

		lstSanPham = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstSanPham;
	}

	@Override
	public SanPham layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		SanPham objSanPham = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objSanPham = (SanPham) session.get(SanPham.class, id);

		tx.commit();

		return objSanPham;
	}

	@Override
	public boolean themMoi(SanPham obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().openSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(SanPham obj) {
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
		SanPham objSanPham = (SanPham) session.get(SanPham.class, id);

		if (objSanPham != null) {
			session.delete(objSanPham);

			tx.commit();

			return true;
		}

		return false;
	}
	@Override
	public List<SanPham> timKiemSanPhamTheoDanhMuc(int madanhmuc) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<SanPham> query = session.createNativeQuery("call lstSPtheodm(:maDanhMuc);", SanPham.class);
		query.setParameter("maDanhMuc", madanhmuc);
		
		List<SanPham> lstSP = query.getResultList();
		tx.commit();
		return lstSP;
	}
}
