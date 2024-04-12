package cafe.DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cafe.DTO.Food;
import cafe.DTO.Orders;
import cafe.DTO.Users;

// 주문 데이터 접근
public class OrderDAO extends JDBConnection {

	
	// 주문 목록
	public List<Orders> list(Orders orders) {
		// 주문 목록을 담을 컬렉션 객체 생성
		List<Orders> orderList = new ArrayList<Orders>();

		// SQL 작성
		String sql =" SELECT "
						+ " o.ORDER_NO, "
						+ " o.ORDER_DATE, "
						+ " o.FOOD_CODE, "
						+ " o.TOTAL_PRICE, "
						+ " o.CNT, "
						+ " o.order_date, " 
						+ " f.PRICE "
						+ " FROM "
						+ " CAFE.ORDERS o "
						+ " JOIN " 
						+ " CAFE.FOOD f ON o.FOOD_CODE = f.FOOD_CODE "
						+ " WHERE " 
						+ " o.USER_NO = ? "
						+ " ORDER BY "
						+ " o.ORDER_DATE ASC ";
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, orders.getUser_no());

			rs = psmt.executeQuery();
			
			while (rs.next()) { // next() : 실행 결과의 다음 데이터로 이동
				Orders order = new Orders();
				Food food = new Food();

				// 결과 데이터 가져오기
				// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
				// * "컬럼명"의 값을 특정 타입으로 변환
				food.setPrice(rs.getInt("price"));
				order.setOrder_no(rs.getInt("order_no"));
				order.setFood_code(rs.getString("food_code"));
				order.setCnt(rs.getInt("cnt"));
				order.setOrder_date(rs.getTimestamp("order_date"));
				order.setTotal_price(rs.getInt("total_price"));
				order.setFood(food);
				// 게시글 목록에 추가
				
				orderList.add(order);
			}
		} catch (SQLException e) {
			System.err.println("게시글 목록 조회 시, 예외 발생");
			e.printStackTrace();
		}
		// 게시글 목록 반환
		return orderList;
	}

	
	
	// 세부 주문 조회 (SELECT)
	public Orders select(int no) {
		Orders order = new Orders();

		String sql = "SELECT * FROM orders WHERE order_no = ? ";

		try {
			psmt = con.prepareStatement(sql); // 실행
			psmt.setInt(1, no);

			rs = psmt.executeQuery();

			if (rs.next()) {

				order.setOrder_no(rs.getInt("order_no"));
				order.setUser_no(rs.getInt("user_no"));
				order.setFood_code(rs.getString("food_code"));
				order.setCnt(rs.getInt("cnt"));
				order.setOrder_date(rs.getTimestamp("order_date"));
				order.setTotal_price(rs.getInt("total_price"));
				order.setOrder_check(rs.getInt("order_check"));

			} else {
				return order;
			}

		} catch (Exception e) {
			System.err.println("주문 조회 중 오류 발생: " + e.getMessage());
			e.printStackTrace();
		}
		return order;
	}

	
	// 주문하기 (INSERT)
	public int insert(Orders order) {

		int result = 0; // 결과 : 적용된 데이터 개수

		String sql = "INSERT INTO orders(order_no,user_no,user_id,food_code,cnt,order_date,total_price,order_check)"
				+ " VALUES(SEQ_ORDER_NO.nextval, ? , ?,  ? , ? , sysdate, ? , ? )";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, order.getUser_no());
			psmt.setString(2, order.getUser_id());
			psmt.setString(3, order.getFood_code());
			psmt.setInt(4, order.getCnt());
			psmt.setInt(5, order.getTotal_price());
			psmt.setInt(6, order.getOrder_check());
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.err.println("주문 등록 중 오류 발생: " + e.getMessage());
			e.printStackTrace();
		}

		return result;
	}

	
	// 주문 삭제 (DELETE)
	public int delete(int no) {
		int result = 0;
		String sql = " DELETE FROM orders " + " WHERE order_no = ? ";

		try {
			this.psmt = this.con.prepareStatement(sql);
			this.psmt.setInt(1, no);

			result = this.psmt.executeUpdate();

		} catch (SQLException var5) {
			System.err.println("주문 삭제 시, 예외 발생");
			var5.printStackTrace();
		}

		return result;
	}
	
	
	 public List<Orders> getOrderByDate(String selectedDate) {
	        List<Orders> orderList = new ArrayList<>();
	        String sql = "SELECT * FROM Orders WHERE TRUNC(order_date) = TO_DATE(?, 'YYYY-MM-DD')";
	        
	        try { 
	            psmt = con.prepareStatement(sql); // PreparedStatement 생성
	            psmt.setString(1, selectedDate); // 쿼리 파라미터 설정

	            rs = psmt.executeQuery(); // 쿼리 실행

	            while (rs.next()) { // 결과 순회
	                Orders order = new Orders();
	                Users user = new Users();
	                
	                
	                user.setUser_no(rs.getInt("user_no"));
	                user.setUser_id(rs.getString("user_id"));
	                order.setOrder_no(rs.getInt("order_no"));
	                order.setUser_no(rs.getInt("user_no"));
	                order.setUser_id(rs.getString("user_id"));
	                order.setFood_code(rs.getString("food_code"));
	                order.setCnt(rs.getInt("cnt"));
	                order.setOrder_date(rs.getDate("order_date"));
	                order.setTotal_price(rs.getInt("total_price"));
	                order.setOrder_check(rs.getInt("order_check"));
	               
	                order.setUsers(user);
	                orderList.add(order); // 주문 목록에 추가
	            }
	        } catch (SQLException e) { // 예외 처리
	            System.err.println("Error occurred while fetching orders by date: " + e.getMessage());
	            e.printStackTrace();
	            
	        } finally { // 리소스 정리
	            try {
	                if (rs != null) rs.close();
	                if (psmt != null) psmt.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	        return orderList; // 주문 목록 반환
	    }
	}
	
	 
	
