package com.onlineshopping.servlet;

import com.google.gson.JsonObject;
import com.onlineshopping.dao.RecordDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RecordCancelServlet", value = "/RecordCancelServlet")
public class RecordCancelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("do post");
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rid = Integer.parseInt(request.getParameter("rid"));

        boolean b = new RecordDao().cancelRecord(rid);

        JsonObject json = new JsonObject();

        json.addProperty("status", b);

        response.getWriter().write(json.toString());
    }
}
