package thuongmaidientu.interceptor;

import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import thuongmaidientu.model.PhanQuyen;
import thuongmaidientu.model.TaiKhoan;
import thuongmaidientu.service.Auth;
import thuongmaidientu.service.PhanQuyenImpl;


public class AuthorizationInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	PhanQuyenImpl pqImpl;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	throws Exception{
		
		HttpSession session= request.getSession();
		// trích xuất method tương ứng với request mapping trong controller
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		Method method = handlerMethod.getMethod();
		// tìm trong method có khai báo anotation Auth?
        Auth permissionAnnotation = AnnotationUtils.findAnnotation(method, Auth.class);
        // nếu có lấy ra thuộc tính role, không trả về null
        Integer permission = permissionAnnotation != null ? permissionAnnotation.permission() : null;
        Auth.Action action = permissionAnnotation != null ? permissionAnnotation.action() : null;
        String url = request.getRequestURL().toString();
		if (session != null && session.getAttribute("userOnline") != null) {
			TaiKhoan objTK = (TaiKhoan) session.getAttribute("taikhoan");
			
			List<PhanQuyen> lstPQ = pqImpl.timKiemVaiTro(permission);
			for(int i = 0; i < lstPQ.size(); i++ ) {
				if(lstPQ.get(i).getChucNangId() == permission) {
					PhanQuyen objPQ = pqImpl.layThongTin(objTK.getVaiTroId(), permission);
					if(action.equals(Auth.Action.VIEW)) {
						if(objPQ.getDanhSach() == 1) {
							return true;
						}
					}
					if(action.equals(Auth.Action.UPDATE)) {
						if(objPQ.getSua()==1) {
							return true;
						}
					}
					if(action.equals(Auth.Action.DELETE)) {
						if(objPQ.getXoa()==1) {
							return true;
						}
					}
				}
			}
			response.sendRedirect("/ThuongMaiDienTu/loi403");
			return false;
		}else {
			
			response.sendRedirect("/ThuongMaiDienTu/login");			
		}
		return super.preHandle(request, response, handler);
	}
}
