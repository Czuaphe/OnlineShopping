package com.onlineshopping.servlet;

import com.google.gson.JsonObject;
import com.onlineshopping.dao.GoodsDao;
import com.onlineshopping.dao.RecordDao;
import com.onlineshopping.dao.RecordDetailsDao;
import com.onlineshopping.dao.UserDao;
import com.onlineshopping.entity.Goods;
import com.onlineshopping.entity.Record;
import com.onlineshopping.entity.RecordDetails;
import com.onlineshopping.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@WebServlet("/RecordMakeServlet")
public class RecordMakeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("do post");
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

//        User userTemp = new UserDao().queryByUserID(1014);
//        session.setAttribute("user", userTemp);
//
//        Map<Integer, Integer> shoppingCartTemp = new HashMap<Integer, Integer>();
//        shoppingCartTemp.put(5159, 2);
//        session.setAttribute("ShoppingCart", shoppingCartTemp);


        Integer uaid = Integer.parseInt(request.getParameter("uaid"));

        System.out.println(uaid);

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
        }

        // 生成一个订单
        // 得到购物车数据
        Map<Integer, Integer> shoppingCart = (Map<Integer, Integer>) session.getAttribute("ShoppingCart");

        double total = 0;
        for (Integer gid : shoppingCart.keySet()) {
            Goods goods = new GoodsDao().getGoodsByGid(gid);
            total += goods.getPrice() * goods.getDiscount() * shoppingCart.get(gid);
        }

        Record record = new Record();
        RecordDao recordDao = new RecordDao();

        DateFormat df = new SimpleDateFormat("yyyyMMddhhmmss");
        Date now = new Date();

        record.setUserid(user.getUserid());
        record.setRecnum(df.format(now));
        record.setTotal(total);
        record.setAddscore((int)(total / 10));
        record.setTime(new Timestamp(now.getTime()));
        record.setUaid(uaid);
        // 1表示下订单成功，等待付款中
        record.setStatus(1);

        // 保存订单
        recordDao.save(record);
        // 得到订单ID
        if (record.getRid() == 0) {
            record = recordDao.queryByRecNum(record.getRecnum());
        }

        // 向数据库插入RecordDetails
        for (Integer gid : shoppingCart.keySet()) {
            RecordDetails recordDetails = new RecordDetails();
            Goods goods = new GoodsDao().getGoodsByGid(gid);
            recordDetails.setRid(record.getRid());
            recordDetails.setBuyprice(goods.getPrice() * goods.getDiscount());
            recordDetails.setGid(gid);
            recordDetails.setNumbers(shoppingCart.get(gid));
            // 保存
            new RecordDetailsDao().save(recordDetails);
        }


        JsonObject json = new JsonObject();

        json.addProperty("status", true);

        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("utf-8");

        response.getWriter().write(json.toString());

    }
}
