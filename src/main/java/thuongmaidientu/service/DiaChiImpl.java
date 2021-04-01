package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.DanhMuc;
import thuongmaidientu.model.DiaChi;

@Service
public class DiaChiImpl implements DiaChiDao{
	@Override
	public List<DiaChi> layDanhSach() {
		// Khai báo 1 danh sách
		List<DiaChi> lstDiaChi = new ArrayList<DiaChi>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<DiaChi> query = session.createQuery("from DiaChi", DiaChi.class);

		lstDiaChi = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstDiaChi;
	}

	@Override
	public DiaChi layChiTiet(String id) {
		// Khai báo 1 đối tượng chủ đề
		DiaChi objDiaChi = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objDiaChi = (DiaChi) session.get(DiaChi.class, id);

		tx.commit();

		return objDiaChi;
	}

	@Override
	public boolean themMoi(DiaChi obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(DiaChi obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.update(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean xoa(String id) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách cần xoá
		DiaChi objDiaChi = (DiaChi) session.get(DiaChi.class, id);

		if (objDiaChi != null) {
			session.delete(objDiaChi);

			tx.commit();

			return true;
		}

		return false;
	}
	@Override
	public List<DiaChi> layListDiaChiTheoIdCha(String idDiaChi) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		TypedQuery<DiaChi> query = session.createQuery("from DiaChi where (maCha =:idDiaChi)", DiaChi.class);
		query.setParameter("idDiaChi", idDiaChi);
		List<DiaChi> lst = query.getResultList();
		tx.commit();
		return lst;
	}
}
