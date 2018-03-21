package com.onlineshopping.servlet;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.onlineshopping.dao.GoodsDao;
import com.onlineshopping.dao.UserAddressDao;
import com.onlineshopping.dao.UserDao;
import com.onlineshopping.entity.Goods;
import com.onlineshopping.entity.User;
import com.onlineshopping.entity.UserAddress;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 得到订单的数据，转换成JSO格式的数据
 */
@WebServlet("/RecordDataServlet")
public class RecordDataServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("do Post");
        doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

//        User userTemp = new UserDao().queryByUserID(1014);
//		session.setAttribute("user", userTemp);
//
//		Map<Integer, Integer> shoppingCartTemp = new HashMap<Integer, Integer>();
//		shoppingCartTemp.put(5159, 2);
//		session.setAttribute("ShoppingCart", shoppingCartTemp);



        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
        }

        // 得到购物车的数据
        Map<Integer, Integer> shoppingCart = (Map<Integer, Integer>) session.getAttribute("ShoppingCart");
        // 得到用户的地址
        List<UserAddress> addressList = new UserAddressDao().getUserAddressByUid(user.getUserid());

        // 转换成JSON格式的数据
        JsonObject json = new JsonObject();

        JsonArray items = new JsonArray();

        if (shoppingCart != null) {
            for (Integer gid : shoppingCart.keySet()) {
                JsonObject item = new JsonObject();

                Goods goods = new GoodsDao().getGoodsByGid(gid);
                item.add("goods", new JsonParser().parse(new Gson().toJson(goods)).getAsJsonObject());

                item.addProperty("number", shoppingCart.get(gid));

                items.add(item);
            }
        }

        JsonArray addressArray = new JsonArray();
        System.out.println(addressList.size());
        if (addressList != null && addressList.size() != 0) {
            for (UserAddress address : addressList) {
                JsonObject object = new JsonParser().parse(new Gson().toJson(address)).getAsJsonObject();
                addressArray.add(object);
            }
        }

        json.add("goodsList", items);

        json.add("addressList", addressArray);
        System.out.println(json.toString());

        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("utf-8");

        response.getWriter().write(json.toString());


    }
}
