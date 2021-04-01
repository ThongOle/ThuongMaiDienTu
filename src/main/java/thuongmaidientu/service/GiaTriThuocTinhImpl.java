package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.GiaTriThuocTinh;

@Service
public class GiaTriThuocTinhImpl implements GiaTriThuocTinhDao{
	@Override
	public List<GiaTriThuocTinh> layDanhSach() {
		// Khai báo 1 danh sách
		List<GiaTriThuocTinh> lstGiaTriThuocTinh = new ArrayList<GiaTriThuocTinh>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<GiaTriThuocTinh> query = session.createQuery("from GiaTriThuocTinh", GiaTriThuocTinh.class);

		lstGiaTriThuocTinh = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstGiaTriThuocTinh;
	}

	@Override
	public GiaTriThuocTinh layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		GiaTriThuocTinh objGiaTriThuocTinh = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objGiaTriThuocTinh = (GiaTriThuocTinh) session.get(GiaTriThuocTinh.class, id);

		tx.commit();

		return objGiaTriThuocTinh;
	}

	@Override
	public boolean themMoi(GiaTriThuocTinh obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(GiaTriThuocTinh obj) {
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
		GiaTriThuocTinh objGiaTriThuocTinh = (GiaTriThuocTinh) session.get(GiaTriThuocTinh.class, id);

		if (objGiaTriThuocTinh != null) {
			session.delete(objGiaTriThuocTinh);

			tx.commit();

			return true;
		}

		return false;
	}
	@Override
	public List<GiaTriThuocTinh> timKiemTheoSP(Integer sanPhamId) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		TypedQuery<GiaTriThuocTinh> query = session.createQuery("from GiaTriThuocTinh where SanPhamId =:sanPhamId", GiaTriThuocTinh.class);
		
		query.setParameter("sanPhamId", sanPhamId);
		
		List<GiaTriThuocTinh> lstGiaTriThuocTinh = query.getResultList();

		tx.commit();
		
		return lstGiaTriThuocTinh;
	}
	@Override
	public boolean xoaGTTTtheoSP(Integer sanPhamId) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		TypedQuery<GiaTriThuocTinh> query = session.createQuery("from GiaTriThuocTinh where SanPhamId =:sanPhamId", GiaTriThuocTinh.class);
		query.setParameter("sanPhamId", sanPhamId);
		
		List<GiaTriThuocTinh> lstGiaTriThuocTinh = query.getResultList();
		if (lstGiaTriThuocTinh != null) {
			for (int i=0 ; i < lstGiaTriThuocTinh.size(); i++) {
				session.delete(lstGiaTriThuocTinh.get(i));
			}
			tx.commit();
			return true;
		}
		return false;
	}
}
