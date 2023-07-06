package com.shop.servlet;

import com.shop.domain.Order;
import com.shop.domain.User;
import com.shop.service.IOrderService;
import com.shop.service.IShoppingcartItemService;
import com.shop.service.impl.OrderServiceImpl;
import com.shop.service.impl.ShoppingcartItemServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

/**
 * 生成订单，订单详情，库存减少等
 * 
 *
 *
 */

@WebServlet(name = "UpdateOrderServlet", urlPatterns = "/servlet/updateOrderServlet")
public class UpdateOrderServlet extends HttpServlet {
	private IOrderService orderService = new OrderServiceImpl();
	private IShoppingcartItemService shoppingcartItemService = new ShoppingcartItemServiceImpl();

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("------------AddOrderServlet work start-----------");
		int orderId = Integer.parseInt(request.getParameter("orderId"));

		Order order = new Order();
		order.setOrderId(orderId);
		System.out.println(order);

		try {
			//修改发货状态
			orderService.update(order);

			request.setAttribute("operateSuccess", "发货成功！！");
			request.getRequestDispatcher("/pages/admin/history-orders.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("operateError", "发货失败，商品库存可能不够了！！");
			request.getRequestDispatcher("/pages/admin/history-orders.jsp").forward(request, response);
			throw new RuntimeException(e);
		}
		System.out.println("------------AddOrderServlet work finished-----------");

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
