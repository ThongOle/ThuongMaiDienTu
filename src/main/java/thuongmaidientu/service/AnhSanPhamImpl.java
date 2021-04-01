package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.AnhSanPham;
import thuongmaidientu.model.GiaTriThuocTinh;


@Service
public class AnhSanPhamImpl implements AnhSanPhamDao{
	@Override
	public List<AnhSanPham> layDanhSach() {
		// Khai báo 1 danh sách
		List<AnhSanPham> lstAnhSanPham = new ArrayList<AnhSanPham>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<AnhSanPham> query = session.createQuery("from AnhSanPham", AnhSanPham.class);

		lstAnhSanPham = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstAnhSanPham;
	}

	@Override
	public AnhSanPham layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		AnhSanPham objAnhSanPham = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objAnhSanPham = (AnhSanPham) session.get(AnhSanPham.class, id);

		tx.commit();

		return objAnhSanPham;
	}

	@Override
	public boolean themMoi(AnhSanPham obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(AnhSanPham obj) {
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
		AnhSanPham objAnhSanPham = (AnhSanPham) session.get(AnhSanPham.class, id);

		if (objAnhSanPham != null) {
			session.delete(objAnhSanPham);

			tx.commit();

			return true;
		}

		return false;
	}
	@Override
	public boolean xoaASPtheoSP(Integer sanPhamId) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		TypedQuery<AnhSanPham> query = session.createQuery("from GiaTriThuocTinh where SanPhamId =:sanPhamId", AnhSanPham.class);
		query.setParameter("sanPhamId", sanPhamId);
		
		List<AnhSanPham> lstASP = query.getResultList();
		if (lstASP != null) {
			for (int i=0 ; i < lstASP.size(); i++) {
				session.delete(lstASP.get(i));
			}
			tx.commit();
			return true;
		}
		return false;
	}
}
