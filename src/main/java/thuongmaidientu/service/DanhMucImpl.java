package thuongmaidientu.service;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.annotations.NamedNativeQuery;
import org.hibernate.jdbc.Work;
import org.springframework.stereotype.Service;



import thuongmaidientu.model.DanhMuc;

@Service
public class DanhMucImpl implements DanhMucDao{
	@Override
	public List<DanhMuc> layDanhSach() {
		// Khai báo 1 danh sách
		List<DanhMuc> lstDanhMuc = new ArrayList<DanhMuc>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<DanhMuc> query = session.createQuery("from DanhMuc", DanhMuc.class);

		lstDanhMuc = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstDanhMuc;
	}

	@Override
	public DanhMuc layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		DanhMuc objDanhMuc = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objDanhMuc = (DanhMuc) session.get(DanhMuc.class, id);

		tx.commit();

		return objDanhMuc;
	}

	@Override
	public boolean themMoi(DanhMuc obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(DanhMuc obj) {
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
		DanhMuc objDanhMuc = (DanhMuc) session.get(DanhMuc.class, id);

		if (objDanhMuc != null) {
			session.delete(objDanhMuc);

			tx.commit();

			return true;
		}

		return false;
	}
	@Override
	public List<DanhMuc> timKiemDanhMuc(int maDanhMuc) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = session.beginTransaction();

		TypedQuery<DanhMuc> query = session.createQuery("from DanhMuc where (DanhMucCha =:maDanhMuc)", DanhMuc.class);
		query.setParameter("maDanhMuc", maDanhMuc);
		List<DanhMuc> lst = query.getResultList();
		tx.commit();
		return lst;
	}
	@Override
	public boolean kiemTraDanhMucCon(int maDanhMuc) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createNativeQuery("select kiemTraDanhMucCon(:maDanhMuc);");
		query.setParameter("maDanhMuc", maDanhMuc);
		Integer result = (Integer) query.getSingleResult();
		tx.commit();
		if(result > 0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public String layChuoiDanhMuc(int maDanhMuc) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createNativeQuery("select layChuoiDanhMuc(:maDanhMuc);");
		query.setParameter("maDanhMuc", maDanhMuc);
		String result = (String) query.getSingleResult();
		tx.commit();
		return result;
	}
	
	

}
