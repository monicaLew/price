package com.pctrade.price.views;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pctrade.price.dao.DaoCar;
import com.pctrade.price.dao.DaoCarImpl;
import com.pctrade.price.dao.DaoException;
import com.pctrade.price.entity.Car;
import com.pctrade.price.utils.HttpUtils;
import com.pctrade.price.utils.ThreadSetUtils;

public class ShowCurrentState extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String INPUT_VIEW_NAME = "mainMenu.jsp";
	private static final String SUCCESS_VIEW_NAME = "showCars/currentCars.jsp";
	private static final String ERROR_NAME_DAO = "errorPages/errorDao.jsp";
	private static final String ERROR_NAME = "errorPages/errorPageCar.jsp";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		DaoCar daoCar = new DaoCarImpl();
		List<Car> carList = new ArrayList<Car>();
		List<Car> carListAll = new ArrayList<Car>();
		try {
			carList = daoCar.showCarsByStatus();
			carListAll = daoCar.showAllCarsList();
			session.setAttribute("carList", carList);
			session.setAttribute("numberOfCars", carList.size());

			Integer urlsSize = (Integer) session.getAttribute("totalPages");
			if ((ThreadSetUtils.getInst().isEmpty()) || (carListAll.size() == urlsSize)) {
				HttpUtils.forward(INPUT_VIEW_NAME, request, response);

			} else {
				HttpUtils.forward(SUCCESS_VIEW_NAME, request, response);
			}
		} catch (DaoException e) {
			session.setAttribute("exception", e);
			HttpUtils.forward(ERROR_NAME_DAO, request, response);
		} catch (Exception e) {
			session.setAttribute("exception", e);
			HttpUtils.forward(ERROR_NAME, request, response);
		}
	}
}