package thuongmaidientu.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import thuongmaidientu.model.KhachHang;
import thuongmaidientu.model.TaiKhoan;

@Service
public class TaiKhoanImpl implements TaiKhoanDao{
	@Override
	public List<TaiKhoan> layDanhSach() {
		// Khai báo 1 danh sách
		List<TaiKhoan> lstTaiKhoan = new ArrayList<TaiKhoan>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<TaiKhoan> query = session.createQuery("from TaiKhoan", TaiKhoan.class);

		lstTaiKhoan = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstTaiKhoan;
	}

	@Override
	public TaiKhoan layChiTiet(Integer id) {
		// Khai báo 1 đối tượng chủ đề
		TaiKhoan objTaiKhoan = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		objTaiKhoan = (TaiKhoan) session.get(TaiKhoan.class, id);

		tx.commit();

		return objTaiKhoan;
	}

	@Override
	public boolean themMoi(TaiKhoan obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean sua(TaiKhoan obj) {
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
		TaiKhoan objTaiKhoan = (TaiKhoan) session.get(TaiKhoan.class, id);

		if (objTaiKhoan != null) {
			session.delete(objTaiKhoan);

			tx.commit();

			return true;
		}

		return false;
	}
	@Override
	public TaiKhoan layTKtheoUserName(String username) {
		
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		Transaction tx = session.beginTransaction();
		
		
		TypedQuery<TaiKhoan> query = session.createQuery("from TaiKhoan where taikhoan =:username", TaiKhoan.class);
		
		
		query.setParameter("username", username);
		
		List<TaiKhoan> lst = query.getResultList();
		
		if(lst == null) {
			return new TaiKhoan();
		}
		
		tx.commit();
				
		return lst.get(0);
	}
}
