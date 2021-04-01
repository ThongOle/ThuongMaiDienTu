package thuongmaidientu.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import thuongmaidientu.model.GiaTriThuocTinh;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		GiaTriThuocTinhDao gttt = new GiaTriThuocTinhImpl();
		ObjectMapper mapper = new ObjectMapper();
		
		GiaTriThuocTinh gt = gttt.layChiTiet(18);
		try {
			String json = mapper.writeValueAsString(gt);
			System.out.println(json);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
