package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.DanhMuc;
import thuongmaidientu.model.HoaDon;

@Service
public class HoaDonImpl implements HoaDonDao{
	@Override
	public List<HoaDon> layDanhSach() {
		// Khai báo 1 danh sách
		List<HoaDon> lstHoaDon = new ArrayList<HoaDon>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<HoaDon> query = session.createQuery("from HoaDon", HoaDon.class);

		lstHoaDon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstHoaDon;
	}

	@Override
	public HoaDon layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		HoaDon objHoaDon = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objHoaDon = (HoaDon) session.get(HoaDon.class, id);

		tx.commit();

		return objHoaDon;
	}

	@Override
	public boolean themMoi(HoaDon obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(HoaDon obj) {
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
		HoaDon objHoaDon = (HoaDon) session.get(HoaDon.class, id);

		if (objHoaDon != null) {
			session.delete(objHoaDon);

			tx.commit();

			return true;
		}

		return false;
	}
	@Override
	public List<HoaDon> timKiemTheoIdKH(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<HoaDon> query = session.createQuery("from HoaDon where MaKhachHang =:id", HoaDon.class);
		query.setParameter("id", id);
		List<HoaDon> lst = query.getResultList();
		tx.commit();
		return lst;
	}
}
