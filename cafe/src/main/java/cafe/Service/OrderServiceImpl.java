package cafe.Service;

import java.util.List;

import cafe.DAO.OrderDAO;
import cafe.DTO.Orders;

public class OrderServiceImpl implements OrderService {

	private OrderDAO orderDAO = new OrderDAO();
	
	
		@Override
	public List<Orders> list(Orders orders) {
		// 1. DAO 객체에 주문 목록 요청
		List<Orders> orderList = orderDAO.list(orders);
		
		// 2. 주문 목록 데이터 가공 
		// PASS
		
		// 3. 게시글 목록 반환
		return orderList;
	}


	
	@Override
	public Orders select(int no) {
		// 1. 주문 번호에 대한 주문 정보 데이터 요청
		Orders order = orderDAO.select(no);
		
		// 2. 게시글 정보 반환
		return order;
	}

	
	@Override
	public int insert(Orders order) {
		// 1. 주문 정보를 전달하여 주문 데이터 등록 요청
		int result = orderDAO.insert(order);
		
		// 2. 적용된 데이터 건수를 반환
		//   - 결과 : 0 --> 데이터 등록 실패
		//           1 --> 데이터 등록 성공
		return result;
	}

	
	@Override
	public int delete(int no) {
		// 1. 주문 번호를 전달하여 주문 데이터 삭제 요청
		int result = orderDAO.delete(no);
		
		// 2. 적용된 데이터 건수를 반환
		//   - 결과 : 0 --> 데이터 삭제 실패
		//           1 --> 데이터 삭제 성공
		return result;
	}

	public List<Orders> getOrderByDate(String selectedDate) {
	    List<Orders> orderList = orderDAO.getOrderByDate(selectedDate);
	    return orderList;
	}
	
	
}
