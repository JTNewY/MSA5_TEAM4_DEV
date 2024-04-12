package cafe.Service;

import java.util.List;

import cafe.DTO.Orders;

public interface OrderService {
	
	
	// 주문 목록
	List<Orders> list(Orders orders);
	
	// 주문 조회
	Orders select(int no);
	
	// 주문 등록(하기)
	int insert(Orders order);
	
	// 주문 삭제
	int delete(int no);
	
	public List<Orders> getOrderByDate(String selectedDate);
}